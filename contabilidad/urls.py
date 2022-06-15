from django.urls import path

from contabilidad.views import detalle_fondo, detalle_fondo_delete, fondo, tapa, tapa_update



urlpatterns = [
    path('tapa/<str:modal_status>/', tapa, name='contabilidad-tapa'),
    path('tapa/', tapa, name='contabilidad-tapa'),

    path('tapa/update/<int:pk>/', tapa_update, name='contabilidad-tapa-update'),
    path('fondo/', fondo, name='contabilidad-fondo'),
    path('fondo/detalle/<int:pk>/', detalle_fondo, name='contabilidad-detallefondo'),
    path('fondo/detalle/delete/<int:pk>/', detalle_fondo_delete,
        name='contabilidad-detallefondo-delete'),
    
]
