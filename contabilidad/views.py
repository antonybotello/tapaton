from datetime import datetime
from django.shortcuts import render, redirect
from contabilidad.forms import DetalleFondoForm, TapaForm
from contabilidad.models import DetalleFondo, Fondo, Tapa

from django.contrib import messages


def tapa(request):
    titulo_pagina = "Tapas"
    tapas = Tapa.objects.all()
    #items= Tapa.objects.raw('SELECT * FROM contabilidad_Tapa')
    if request.method == 'POST':
        form = TapaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('contabilidad-tapa')
    else:
        form = TapaForm()
        context = {
            "titulo_pagina": titulo_pagina,
            "tapas": tapas,
            "form": form
        }
    return render(request, "contabilidad/tapa.html", context)


def fondo(request):
    titulo_pagina = "Fondos"
    fondos_detalle = DetalleFondo.objects.all()
    if request.method == 'POST' :
        if datetime.today().weekday()==3:
            fecha_aux = f"{datetime.now().year}-{datetime.now().month}-{datetime.now().day}"
            modelo1 = Fondo.objects.create(
                fecha=fecha_aux
            )
            modelo2 = DetalleFondo.objects.create(
                fondo=modelo1
            )
            messages.success(
                request, f'La contribución # {modelo1.id} esta abierta y lista para agregar fondos!!!')
            return redirect("contabilidad-detallefondo", pk=modelo2.id)
        else:
            messages.warning(
            request, f'Hoy no es día de agregar fondos!!!')
    context = {
        "titulo_pagina": titulo_pagina,
        "fondos_detalle": fondos_detalle,
    }
    return render(request, "contabilidad/fondo.html", context)


def detalle_fondo(request, pk):
    titulo_pagina = f"Nueva Contribución"
    fondos_detalle = DetalleFondo.objects.all()
    fondo_obj=DetalleFondo.objects.get(id=pk)
    url_back="/contabilidad/fondo"
    #print(fondo_obj.equipo)
    if fondo_obj.equipo!=None:
        DetalleFondo.objects.filter(id=pk).update(pagado=1)
        messages.success(
                    request, f'Contribución pagada!')
        return redirect('contabilidad-fondo')
    else:
        if request.method == 'POST':
            form = DetalleFondoForm(request.POST)
            if form.is_valid():
                DetalleFondo.objects.filter(id=pk).update(
                    cantidad=form.cleaned_data.get('cantidad'),
                    equipo=form.cleaned_data.get('equipo'),
                )
                messages.success(
                    request, f'Contribucion agregada, recuerda pagar a tiempo!')
                return redirect('contabilidad-fondo')
        else:
            form = DetalleFondoForm()
    context = {
        'fondos_detalle':fondos_detalle,
        'titulo_pagina': titulo_pagina,
        "form": form,
        'url_back':url_back,
    }
    return render(request, "contabilidad/detalle-fondo.html", context)

def detalle_fondo_delete(request, pk):
    titulo_pagina = f"Fondos"
    fondos_detalle = DetalleFondo.objects.all()
    accion_txt="eliminar el registro de la contribución"
    url_back="/contabilidad/fondo"
    det_fo_obj=DetalleFondo.objects.get(id=pk)
    fo_obj=det_fo_obj.fondo
    if request.method == 'POST':
        det_fo_obj.delete()
        fo_obj.delete()
        messages.success(
            request, f'La Contribucion se ha eliminado!')
        return redirect('contabilidad-fondo')
    
    context = {
        'accion_txt':accion_txt,
        'url_back':url_back,
        'titulo_pagina': titulo_pagina,
        "fondos_detalle": fondos_detalle,
    }
    return render(request, "contabilidad/fondo-delete.html", context)