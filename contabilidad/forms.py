from django import forms

from contabilidad.models import DetalleFondo, Tapa

class TapaForm(forms.ModelForm):
    class Meta:
        model= Tapa
        fields= ['aprendiz','cantidad' ]
        def __init__(self, user, *args, **kwargs):
            super(RequestForm, self).__init__(*args, **kwargs)
            self.fields['aprendiz'].queryset = Product.objects.filter(estado = self.product_type)
        #fields= '__all__'

class TapaUpdateForm(forms.ModelForm):
    class Meta:
        model= Tapa
        fields= ['cantidad' ]
        #fields= '__all__'

class DetalleFondoForm(forms.ModelForm):
    class Meta:
        model= DetalleFondo
        fields= ['equipo','cantidad']
        
        
        #fields= '__all__'        