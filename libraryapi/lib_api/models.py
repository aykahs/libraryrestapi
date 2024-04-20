from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.deletion import  SET_NULL
CREATED = '%(class)s_created'
UPDATED = '%(class)s_updated'
# Create your models here.
class User(AbstractUser):
    user_type = [
        ('none', 'None'),
        ('admin', 'Admin'),
        ('student', 'Student'),
    ]
    status = [
        ('regular', 'Regular'),
        ('suspended', 'Suspended'),
        ('terminated', 'Terminated')
    ]
    class Meta:
        db_table = 'users'
    name = models.CharField(max_length=255)
    email = models.CharField(max_length=255,unique=True)
    username = models.CharField(max_length=255,unique=True)
    password = models.CharField(max_length=255)
    is_deleted = models.BooleanField(default=False)
    user_type = models.CharField(
        max_length=100,
        choices=user_type,
        null=True,blank=True
    )
    status =models.CharField(
        max_length=50,
        choices=status,
        default= 'regular'
    )
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    pcreated = models.PositiveIntegerField(default=0)
    pupdated = models.PositiveIntegerField(default=0)
    overduecount = models.IntegerField(default= 0)

    REQUIRED_FIELDS = ['name','email','password','user_type']



class Book(models.Model):
    available = [
        ('yes', 'Yes'),
        ('no', 'No'),
    ]
    class Meta:
        db_table = 'books'  
    name = models.CharField(max_length=255)
    description = models.TextField()
    available = models.CharField(
        max_length=100,
        choices=available,
        null=True,blank=True
    )
    created = models.ForeignKey(User, on_delete=SET_NULL, related_name="created", default=0, null=True)
    updated = models.ForeignKey(User, on_delete=SET_NULL, related_name="updated", default=0, null=True)
    quantity = models.PositiveIntegerField()
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()
    def __str__(self):
            return self.name
        
class Borrow(models.Model):
    class Meta:
        db_table= 'borrow'
    user = models.ForeignKey(User, on_delete=SET_NULL, related_name="user", default=0, null=True)
    book = models.ForeignKey(Book, on_delete=SET_NULL, related_name="book", default=0, null=True)
    borrow_at = models.DateField()
    return_at = models.DateField()
    created_at = models.DateTimeField()
    total_fine = models.PositiveIntegerField(default=0)
    complete = models.BooleanField(default=0)

class Config(models.Model):
    class Meta:
        db_table= 'config'
    name = models.CharField(max_length=255)
    value = models.CharField(max_length=255)


class BookBorrowLog(models.Model):
    class Meta:
        db_table="book_borrow_log"
    book = models.ForeignKey(Book, on_delete=SET_NULL, related_name="logbook", default=0, null=True)
    borrow = models.ForeignKey(Borrow, on_delete=SET_NULL, related_name="logborrow", default=0, null=True)
    fine =  models.PositiveIntegerField(default=0)
    config = models.ForeignKey(Config, on_delete=SET_NULL, related_name="logconfig", default=0, null=True)
    created_at = models.DateTimeField( null=True,blank=True)
    date = models.DateTimeField( null=True,blank=True)


