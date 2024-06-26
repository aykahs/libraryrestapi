# Generated by Django 5.0.1 on 2024-01-18 14:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('lib_api', '0004_rename_fine_borrow_total_fine_bookborrowlog'),
    ]

    operations = [
        migrations.RenameField(
            model_name='bookborrowlog',
            old_name='borrowk_id',
            new_name='borrow_id',
        ),
        migrations.AlterUniqueTogether(
            name='book',
            unique_together={('updated_by',)},
        ),
    ]
