from django import forms

from contabilidad.models import DetalleFondo, Fondo, Tapa

class TapaForm(forms.ModelForm):
    class Meta:
        model= Tapa
        fields= ['fecha', 'cantidad','aprendiz']
        #fields= '__all__'


class DetalleFondoForm(forms.ModelForm):
    class Meta:
        model= DetalleFondo
        fields= ['equipo','cantidad']
        
        
        #fields= '__all__'        