from django.db import models

def validate_file_extension(value):
    import os
    from django.core.exceptions import ValidationError
    ext = os.path.splitext(value.name)[1]  # [0] returns path+filename
    valid_extensions = ['.zip']
    if not ext.lower() in valid_extensions:
        raise ValidationError('Archivo no válido')

class Backup(models.Model):
    nombre = models.CharField(max_length = 200,default="Copia de Seguridad", blank=True)
    archivo = models.FileField(upload_to = "backup",validators=[validate_file_extension])
    fecha = models.DateTimeField(auto_now = True)