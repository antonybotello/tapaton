from django.db import models

class Backup(models.Model):
    nombre = models.CharField(max_length = 200)
    archivo = models.FileField(upload_to = "static/backup")
    fecha = models.DateTimeField(auto_now = True)