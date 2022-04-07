from django.urls import path

from personal.views import aprendiz, equipo

urlpatterns = [
    path('aprendiz/', aprendiz, name='personal-aprendiz'),
    path('equipo/', equipo, name='personal-equipo'),
    
]
