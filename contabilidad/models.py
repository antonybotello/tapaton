from django.db import models
from django.utils.translation import gettext_lazy as _
from personal.models import Aprendiz, Equipo

class Tapa(models.Model):
    fecha= models.DateField(verbose_name="Fecha de Registro", help_text=u"MM/DD/AAAA")
    cantidad= models.IntegerField()
    aprendiz=models.ForeignKey(Aprendiz,on_delete=models.SET_NULL, null=True,verbose_name=u"Aprendiz")

class Fondo(models.Model):
    fecha= models.DateField(verbose_name="Fecha de Registro", help_text=u"MM/DD/AAAA")
    def __str__(self) -> str:
        return '%s'%(self.fecha)
class DetalleFondo(models.Model):
    class Cantidad(models.TextChoices):
        VALOR1='2500', _('2500')
    cantidad=models.CharField(max_length=4, choices=Cantidad.choices,default=Cantidad.VALOR1, verbose_name="Monto")
     
    pagado=models.BooleanField(default=False)
    equipo=models.ForeignKey(Equipo,on_delete=models.SET_NULL, null=True,verbose_name=u"Equipo")
    fondo=models.ForeignKey(Fondo,on_delete=models.SET_NULL, null=True,verbose_name=u"Fondo")
    