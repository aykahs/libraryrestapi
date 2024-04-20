from rest_framework import serializers
from lib_api.models import *
class ConfigSerializer(serializers.ModelSerializer):
    class Meta:
        model= Config
        fields =('id', 'name', 'value')
        # fields = "__all__"


class ConfigStoreSerializer(serializers.ModelSerializer):
    class Meta:
        model= Config
        fields =('name', 'value')
        # fields = "__all__"
        
    def validate(self, data):
        config = Config.objects.filter(name=data["name"])
        if config.exists():
            raise serializers.ValidationError({"name": "Config name already exist"})
        return data