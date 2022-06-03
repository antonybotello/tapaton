from django.db import models
from django.utils.translation import gettext_lazy as _

class Equipo(models.Model):
    nombre=models.CharField(max_length=50, blank=False, unique=True, verbose_name="Nombre")
    puntos=models.PositiveIntegerField(default=0)
    
    def __str__(self) -> str:
        return '%s'%(self.nombre)
    def clean(self):
        self.nombre= self.nombre.capitalize()
 
    class Meta:
        verbose_name = "Equipo"
        verbose_name_plural = "personal.Equipo"
        
        

class Aprendiz(models.Model):
    nombre=models.CharField(max_length=50, verbose_name="Nombre")
    apellido=models.CharField(max_length=50, verbose_name="Apellido")
    documento=models.CharField(unique=True, max_length=10)
    class Estado(models.TextChoices):
        ACTIVO='1', _('Activo')
        INACTIVO='0', _('Inactivo')
    estado= models.CharField(max_length=1, choices=Estado.choices, default=Estado.ACTIVO, verbose_name="Activo")
    class Sexo(models.TextChoices):
        MASCULINO='M', _('Masculino')
        FEMENINO='F', _('Femenino')
    sexo= models.CharField(max_length=1, choices=Sexo.choices, verbose_name="Sexo")
    equipo= models.ForeignKey(Equipo, on_delete=models.SET_NULL, null=True, verbose_name=u"Equipo")
    def __str__(self) -> str:
        return '%s %s'%(self.nombre, self.apellido)
    def clean(self):
        self.nombre= self.nombre.title()
        self.apellido= self.apellido.title() 
    class Meta:
        verbose_name = "Aprendiz"
        verbose_name_plural = "personal.Aprendiz"
       
        
        
    
    