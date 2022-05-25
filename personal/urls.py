from django.urls import path

from personal.views import aprendiz, aprendiz_update, aprendiz_delete, equipo

urlpatterns = [
    path('aprendiz/', aprendiz, name='personal-aprendiz'),
    path('aprendiz/update/<int:pk>/', aprendiz_update, name='personal-aprendiz-update'),
    path('aprendiz/delete/<int:pk>/', aprendiz_delete, name='personal-aprendiz-delete'),
    
    
    path('equipo/', equipo, name='personal-equipo'),
    
   
]
