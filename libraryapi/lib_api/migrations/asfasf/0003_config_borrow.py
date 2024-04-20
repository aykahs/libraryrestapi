# Generated by Django 5.0.1 on 2024-01-11 16:00

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lib_api', '0002_user_created_at_user_created_by_user_updated_at_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Config',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('value', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'config',
            },
        ),
        migrations.CreateModel(
            name='Borrow',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('borrow_at', models.DateField(auto_now=True)),
                ('return_at', models.DateField(auto_now=True)),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('fine', models.PositiveIntegerField(default=0)),
                ('complete', models.BooleanField(default=0)),
                ('book_id', models.ForeignKey(default=0, null=True, on_delete=django.db.models.deletion.SET_NULL, to='lib_api.book')),
                ('user_id', models.ForeignKey(default=0, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'borrow',
            },
        ),
    ]