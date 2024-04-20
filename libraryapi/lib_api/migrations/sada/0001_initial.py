# Generated by Django 5.0.1 on 2024-01-18 15:11

import django.contrib.auth.models
import django.db.models.deletion
import django.utils.timezone
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
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
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('name', models.CharField(max_length=255)),
                ('email', models.CharField(max_length=255, unique=True)),
                ('username', models.CharField(max_length=255, unique=True)),
                ('password', models.CharField(max_length=255)),
                ('is_deleted', models.BooleanField(default=False)),
                ('user_type', models.CharField(blank=True, choices=[('none', 'None'), ('admin', 'Admin'), ('student', 'Student')], max_length=100, null=True)),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('pcreated', models.PositiveIntegerField(default=0)),
                ('pupdated', models.PositiveIntegerField(default=0)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'db_table': 'users',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('description', models.TextField()),
                ('available', models.CharField(blank=True, choices=[('yes', 'Yes'), ('no', 'No')], max_length=100, null=True)),
                ('quantity', models.PositiveIntegerField()),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('created', models.OneToOneField(default=0, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='created', to=settings.AUTH_USER_MODEL)),
                ('updated', models.OneToOneField(default=0, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='updated', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'books',
                'unique_together': {('updated',)},
            },
        ),
        migrations.CreateModel(
            name='Borrow',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('borrow_at', models.DateField(auto_now=True)),
                ('return_at', models.DateField(auto_now=True)),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('total_fine', models.PositiveIntegerField(default=0)),
                ('complete', models.BooleanField(default=0)),
                ('book', models.OneToOneField(default=0, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='book', to='lib_api.book')),
                ('user', models.OneToOneField(default=0, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='user', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'borrow',
            },
        ),
        migrations.CreateModel(
            name='BookBorrowLog',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fine', models.PositiveIntegerField(default=0)),
                ('book', models.OneToOneField(default=0, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='logbook', to='lib_api.book')),
                ('borrow', models.OneToOneField(default=0, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='logborrow', to='lib_api.borrow')),
                ('config', models.OneToOneField(default=0, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='logconfig', to='lib_api.config')),
            ],
            options={
                'db_table': 'book_borrow_log',
            },
        ),
    ]
