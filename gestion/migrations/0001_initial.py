# Generated by Django 4.0.4 on 2022-06-03 20:22

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Backup',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('uploadedFile', models.FileField(upload_to='static/backup')),
                ('dateTimeOfUpload', models.DateTimeField(auto_now=True)),
            ],
        ),
    ]
