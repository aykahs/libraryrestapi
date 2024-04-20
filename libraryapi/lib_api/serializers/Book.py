from rest_framework import serializers
from lib_api.models import *

class UserBookSerializer(serializers.ModelSerializer):
    class Meta:
        model= Book
        fields = ('id','name','description','created_at')


class BooksSerializer(serializers.ModelSerializer):
    updated = serializers.SerializerMethodField()
    class Meta:
        model= Book
        fields = ('id','name','description','available','created','updated','quantity','created_at','updated_at')
    def get_updated(self,obj):
        return obj.updated.username
    
class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model= Book
        fields = ['id','name','description','available','created','updated','quantity','created_at','updated_at']
    
    def validate_quantity(self,value):
        if value == 0:
            raise serializers.ValidationError("Quantity cannot be zero")
        else:
            return value
        
    def validate_name(self,value):
        books = Book.objects.filter(name__iexact=value)
        if self.instance:
            books = books.exclude(pk=self.instance.pk)
        if books.exists():
            raise serializers.ValidationError("Not unique Nmae")
        return value
