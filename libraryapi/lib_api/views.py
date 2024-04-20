# from django.shortcuts import render
from rest_framework.decorators import api_view
from django.db import transaction
from rest_framework.response import Response
from lib_api.serializers.config import  ConfigSerializer,ConfigStoreSerializer
from lib_api.serializers.user import  UserSerializerLogin,UserRegister,StudentSerializer,StudentBooksRequestedSerializer
from lib_api.serializers.Book import  BookSerializer,BooksSerializer
from lib_api.serializers.Borrow import  BorrowSerializer,BorrowWithBooksSerializer,calculateBorrowSerializer
from lib_api.serializers.Borrowlog import  BookBorrowLogSerializer

from .models import Config,User,Book,Borrow,BookBorrowLog
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework.decorators import api_view,permission_classes 
from rest_framework import generics
from datetime import datetime, date, timedelta
from rest_framework import status
from itertools import groupby
from operator import itemgetter
import string
import random
# Create your views here.
from django.db.models import Q
@api_view(["POST"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def userReturnBooks(request,pk):
    now = datetime.today()
    
    borrows = Borrow.objects.filter(user=pk,complete=0)
    for i in borrows:
        borrow = Borrow.objects.get(id=i.id)
        borrow.complete = 1
        borrow.save()
    user = User.objects.get(id=pk)
    count = user.overduecount + 1 if request.data['fine'] > 0 else 0
    config = Config.objects.get(name='max_suspension')
    if count >= int(config.value):
        user.status = 'terminated'
        user.save()
    else:
        user.status = 'regular'
        user.overduecount = user.overduecount+1
        user.save()
    return Response({"msg": "Successfully returned", "succes": True,}) 
    
  

@api_view(["POST"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def UserrequestedBookCalculation(request,pk):
    now = datetime.today()
    borrows = Borrow.objects.filter(Q(return_at__lt=now),user=pk,complete=0)
    user = User.objects.get(id=pk)
    # borrowscal = calculateBorrowSerializer(instance=borrows,many=True)
    # borrowdata = borrowscal.data
    config = Config.objects.get(name='fine')
    for i in borrows:
        return_at = i.return_at
        now = date.today()
        nowt = datetime.today()
        days = (now - return_at).days -1
        new_date = now + timedelta(days=-days)
        total = 0
        while days != 0:
            total = total + int(config.value)
            exist = BookBorrowLog.objects.filter(borrow=i.id,date=new_date).count()
            if exist == 0:
                BookBorrowLog.objects.create(borrow=i,book=i.book,fine=config.value,config=config,created_at=nowt,date=new_date)
            days = days -1
            new_date = new_date + timedelta(days=1)
        borrow = Borrow.objects.get(id=i.id)
        borrow.total_fine = total
        borrow.save()
        if total > 0:
            user.status = 'suspended'
            user.save()
    return Response({"msg": "Successfully Calculated", "succes": True,}) 

@api_view(["GET"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def requestedBooks(request):
    borrows = Borrow.objects.filter(complete=0)
    userbooks = BorrowWithBooksSerializer(instance=borrows,many=True)
    total_over_due_amt  =0
    for i in userbooks.data:
        total_over_due_amt = total_over_due_amt+ i['overdue']*int(i['rate']['value'])
        
    # grouped_data = group_borrows_by_user(userbooks.data)
    data={'total_over_due_amt' :total_over_due_amt,'userbooks':userbooks.data}
    return Response({"msg": "Successfully saved", "succes": True,'data':data}) 


def group_borrows_by_user(borrow_instances):
    sorted_borrows = sorted(borrow_instances, key=itemgetter('user'))
    grouped_borrows = {key: list(group) for key, group in groupby(sorted_borrows, key=itemgetter('user'))}
    return grouped_borrows
@api_view(["GET"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def userRequestedBook(request,pk):
    borrows = Borrow.objects.filter(user=pk,complete=0)
    user = User.objects.get(id=pk)
    user =StudentSerializer(instance = user)
    userbooks = BorrowWithBooksSerializer(instance=borrows,many=True)
    total_over_due_amt = 0
    for i in userbooks.data:
        total_over_due_amt = total_over_due_amt+ i['overdue']*int(i['rate']['value'])
    data={'total_over_due_amt' :total_over_due_amt,'userbooks':userbooks.data,'student':user.data}
    return Response({"msg": "Successfully saved", "succes": True,'data':data})  

@api_view(["POST"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def userBooks(request):
    config_days = Config.objects.get(name= 'fine_after_days')
    config = Config.objects.get(name= 'max_books')
    created_at = datetime.today()
    current_date = date.today()
    days_= int(config_days.value)
    date_1 = current_date + timedelta(days=days_)
    # date_1 = datetime.strptime(current_date, '%m-%d-%Y')
    # rdata = []
    user_id = request.data["id"]
    book_id =  request.data["book"]["id"]
    rdata ={"user":user_id,"book":book_id,"borrow_at":current_date,"return_at":date_1,"created_at":created_at,"total_fine":0,"complete":0}
    borrows = Borrow.objects.filter(user=user_id,complete=0).count()
    if borrows < int(config.value):
        data_ = BorrowSerializer(data = rdata)
        if data_.is_valid():
            data_.save()
            log ={"borrow":data_.data['id'],"book":book_id,"fine":0,"config":None,"created_at":created_at}
            log_ = BookBorrowLogSerializer(data = log)
            if log_.is_valid():
                log_.save()
                return Response({"msg": "Successfully saved", "succes": True})
        else:
            return Response({"errors":data_.errors}, status.HTTP_400_BAD_REQUEST)
    else:
        return Response({"errors":"Max No of book have been borrowed"}, status.HTTP_400_BAD_REQUEST)

@api_view(["POST"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def userRegister(request):
    res = ''.join(random.choices(string.ascii_uppercase +
                             string.digits, k=12))
    request.data.update({'created_at': datetime.now()})
    request.data.update({'updated_at': datetime.now()})
    data_ = UserRegister(data = request.data)
    if data_.is_valid():
        data_.save()
        user = User.objects.get(id=data_.data['id'])
        user.set_password(res)
        user.save()
        return Response({"msg": "Successfully saved", "data": data_.data, "succes": True})
    else:
        return Response({"errors":data_.errors}, status.HTTP_400_BAD_REQUEST)

        


@api_view(["POST"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def storeConfig(request):
    data_ = ConfigStoreSerializer(data = request.data)
    if data_.is_valid():
        data_.save()
        return Response({"msg": "Successfully saved", "data": data_.data, "succes": True})
    else:
        return Response({"errors":data_.errors}, status.HTTP_400_BAD_REQUEST)

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def allConfig(request):
    configs = Config.objects.all()
    data_ = ConfigSerializer(configs,many=True)
    return Response({"msg": "All Config Data", "data": data_.data, "succes": True})

@api_view(["GET"])
@permission_classes([IsAuthenticated])
def allBooks(request):
    books = Book.objects.all()
    data_ = BooksSerializer(books,many=True)
    return Response({"msg": "All Config Data", "data": data_.data, "succes": True})


@api_view(["POST"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def BookStore(request):
    request.data.update({'created': request.user.id})
    request.data.update({'updated': request.user.id})
    request.data.update({'created_at': datetime.now()})
    request.data.update({'updated_at': datetime.now()})
    data_ = BookSerializer(data = request.data)
    if data_.is_valid():
        data_.save()
        b = Book.objects.get(id=data_.data['id'])
        book = BooksSerializer(instance=b)
        return Response({"msg": "Successfully saved", "data": book.data, "succes": True})
    else:
        return Response({"errors":data_.errors}, status.HTTP_400_BAD_REQUEST)
    
    
@api_view(["POST"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def BookUpdate(request,pk):
    request.data.update({'updated': request.user.id})
    request.data.update({'updated_at': datetime.now()})
    b = Book.objects.get(id=pk)
    data_ = BookSerializer(instance=b,data = request.data)
    if data_.is_valid():
        data_.save()
        b = Book.objects.get(id=data_.data['id'])
        book = BooksSerializer(instance=b)
        return Response({"msg": "Successfully saved", "data": book.data, "succes": True})
    else:
        return Response({"errors":data_.errors}, status.HTTP_400_BAD_REQUEST)
    
    
@api_view(["POST"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def BookBorrowStore(request):
    data_ = BorrowSerializer(data = request.data)
    if data_.is_valid():
        data_.save()
        return Response({"msg": "Successfully saved", "data": data_.data, "succes": True})
    else:
        return Response({"errors":data_.errors}, status.HTTP_400_BAD_REQUEST)

@api_view(["GET"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def allBorrow(request):
    configs = Borrow.objects.prefetch_related('book','user')
    data_ = BorrowSerializer(configs,many=True)
    return Response({"msg": "All Config Data", "data": data_.data, "succes": True})


@api_view(["POST"])
@transaction.non_atomic_requests
@permission_classes([IsAuthenticated])
def  updateConfig(request,pk):
    config = Config.objects.get(id=pk)
    data_ = ConfigStoreSerializer(instance=config ,data = request.data)
    if data_.is_valid():
        data_.save()
        return Response({"msg": "Successfully Updated", "data": data_.data, "succes": True})
    else:
        return Response({"errors":data_.errors}, status.HTTP_400_BAD_REQUEST)

class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        return token

    def validate(self, attrs):
        data = super(CustomTokenObtainPairSerializer, self).validate(attrs)
        serilizer = UserSerializerLogin(self.user)
        data.update({'user': serilizer.data})
        return data
class MyCustomTokenObtainPairView(TokenObtainPairView):
     def get_serializer_class(self):
        return CustomTokenObtainPairSerializer
class BookListAPIView(generics.ListCreateAPIView):
    queryset = Book.objects.all()
    serializer_class = BookSerializer