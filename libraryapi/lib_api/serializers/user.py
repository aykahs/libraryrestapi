from rest_framework import serializers
from lib_api.models import *
from lib_api.serializers.Book import  UserBookSerializer

class UserSerializerLogin(serializers.ModelSerializer):
    class Meta:
        model= User
        fields = "__all__"

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model= User
        fields = ('username','email')
        
class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model= User
        fields = ('username','email','first_name','last_name','status','overduecount')


class StudentBooksRequestedSerializer(serializers.ModelSerializer):
    book = UserBookSerializer()
    class Meta:
        model= User
        fields = ('username','email','first_name','last_name')
        
class UserRegister(serializers.ModelSerializer):
    class Meta:
        model= User
        fields = ('id','name','email','username','user_type','created_at','updated_at')

class LoginSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        max_length=65, min_length=8, write_only=True)
    username = serializers.CharField(max_length=255, min_length=2)
    class Meta:
        model = User
        fields = ['username', 'password']
    def validate(self, attrs):
        username = attrs.get('username', '')
        if User.objects.filter(username=username).exists():
            raise serializers.ValidationError(
                {'username': ('username is already in use')})
        return super().validate(attrs)