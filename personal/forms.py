from django import forms

from personal.models import Aprendiz, Equipo

class AprendizForm(forms.ModelForm):
    class Meta:
        model= Aprendiz
        fields= ['nombre','apellido','documento','sexo','equipo']
        #fields= '__all__'
class AprendizUpdateForm(forms.ModelForm):
    class Meta:
        model= Aprendiz
        fields= ['nombre','apellido','sexo','equipo']
        #fields= '__all__'
    
class EquipoForm(forms.ModelForm):
    class Meta:
        model= Equipo
        fields= ['nombre']
    
        #fields= '__all__'