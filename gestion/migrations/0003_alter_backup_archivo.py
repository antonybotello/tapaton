# Generated by Django 4.0.4 on 2022-06-06 14:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestion', '0002_rename_uploadedfile_backup_archivo_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='backup',
            name='archivo',
            field=models.FileField(upload_to='backup'),
        ),
    ]
