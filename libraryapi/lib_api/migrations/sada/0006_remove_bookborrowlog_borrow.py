# Generated by Django 5.0.1 on 2024-02-11 13:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lib_api', '0005_bookborrowlog_created_at_user_status'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bookborrowlog',
            name='borrow',
        ),
    ]