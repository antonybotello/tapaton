from django.db import models

class Backup(models.Model):
    nombre = models.CharField(max_length = 200,default="Copia de Seguridad", blank=True)
    archivo = models.FileField(upload_to = "backup")
    fecha = models.DateTimeField(auto_now = True)