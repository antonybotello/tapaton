from django.urls import path

from contabilidad.views import detalle_fondo, detalle_fondo_delete, fondo, tapa



urlpatterns = [
    path('tapa/', tapa, name='contabilidad-tapa'),
    path('fondo/', fondo, name='contabilidad-fondo'),
    path('fondo/detalle/<int:pk>/', detalle_fondo, name='contabilidad-detallefondo'),
    path('fondo/detalle/delete/<int:pk>/', detalle_fondo_delete,
        name='contabilidad-detallefondo-delete'),
    
]
