from rest_framework import serializers
from lib_api.models import *
from lib_api.serializers.Book import  UserBookSerializer
from lib_api.serializers.user import  StudentSerializer
from lib_api.serializers.Borrowlog import  BookBorrowLogSerializer
from lib_api.serializers.config import  ConfigSerializer

from datetime import date




class BorrowSerializer(serializers.ModelSerializer):
    class Meta:
        model= Borrow
        fields = ('id','user','book','borrow_at','return_at','created_at','total_fine','complete')

    def validate(self, data):
        borrow = Borrow.objects.filter(user=data["user"],book=data["book"],complete=0)
        if borrow.exists():
            raise serializers.ValidationError({"book_id": "User already added this book"})
        book = Book.objects.get(id=data.get('book').id)
        bc = Borrow.objects.filter(book=data["book"],complete=0).count()
        if book and book.quantity <= bc:
            raise serializers.ValidationError({"book_id": "Books already in used"})
        return data

class calculateBorrowSerializer(serializers.ModelSerializer):
    overdue = serializers.SerializerMethodField()
    rate = serializers.SerializerMethodField()
    class Meta:
        model= Borrow
        fields = ('id','user','book','borrow_at','return_at','created_at','total_fine','complete','overdue','rate')
    def get_overdue(self,obj):
        days= 0
        return_at = obj.return_at
        now = date.today()
        days = (now - return_at).days
        return  days
    def get_rate(self,obj):
        config = Config.objects.get(name='fine')
        conf = ConfigSerializer(config)
        return conf.data
        
        
        
class BorrowWithBooksSerializer(serializers.ModelSerializer):
    book = UserBookSerializer()
    student_info = StudentSerializer(source='user', read_only=True)
    logs = serializers.SerializerMethodField()
    overdue = serializers.SerializerMethodField()
    rate = serializers.SerializerMethodField()
    class Meta:
        model= Borrow
        fields = ('id','user','book','borrow_at','return_at','created_at','total_fine','complete','student_info','logs','overdue','rate')
    
    def get_logs(self,obj):
        borrow_id = obj.id
        log = BookBorrowLog.objects.filter(borrow=borrow_id,fine__gt=0)
        logs = BookBorrowLogSerializer(instance=log,many=True)
        return  logs.data
    
    def get_overdue(self,obj):
        days= 0
        return_at = obj.return_at
        now = date.today()
        days = (now - return_at).days -1
        return  days
    def get_rate(self,obj):
        config = Config.objects.get(name='fine')
        conf = ConfigSerializer(config)
        return conf.data
