# Generated by Django 5.0.1 on 2024-02-12 15:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lib_api', '0003_alter_user_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='overduecount',
            field=models.IntegerField(default=0),
        ),
    ]