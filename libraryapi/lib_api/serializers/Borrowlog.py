from rest_framework import serializers
from lib_api.models import *
class BookBorrowLogSerializer(serializers.ModelSerializer):
    class Meta:
        model= BookBorrowLog
        fields = ('book','borrow','fine','config','created_at','date')



