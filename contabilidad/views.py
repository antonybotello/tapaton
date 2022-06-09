from datetime import datetime
from django.shortcuts import render, redirect
from contabilidad.forms import DetalleFondoForm, TapaForm, TapaUpdateForm
from contabilidad.models import DetalleFondo, Fondo, Tapa
from django.contrib.auth.decorators import login_required
from gestion.decorators import unauthenticated_user, allowed_users
from django.contrib import messages


@login_required(login_url="usuario-login")
@allowed_users(allowed_roles=["Gerente"])
def tapa(request, tipo, pk):
    titulo_pagina = "Tapas"
    subtitulo_pagina = "Gestion de Tapas"
    modal_title="eliminar tapas"
    modal_text=""
    
    tapas = Tapa.objects.all()
    tapa_delete(pk,tipo)
    if request.method == 'POST' and tipo=="C":
        form = TapaForm(request.POST)
        if datetime.today().weekday() == 4:
            if form.is_valid():

                form.save()
                return redirect('contabilidad-tapa')
        else:
            messages.warning(
                request, f'Hoy no es día de agregar fondos!!!')
    
        
    else:
        form = TapaForm()
    context = {
        "titulo_pagina": titulo_pagina,
        "subtitulo_pagina": subtitulo_pagina,
        "modal_title":modal_title,
        "modal_text":modal_text,        
        "tapas": tapas,
        "form": form
    }
    return render(request, "contabilidad/tapa.html", context)

@login_required(login_url="usuario-login")
def tapa_update(request, pk):
    titulo_pagina = "Tapas"
    url_back= '/contabilidad/tapa/'
    tapas = Tapa.objects.all()
    tapas_unique= Tapa.objects.get(id=pk)
    #items= Aprendiz.objects.raw('SELECT * FROM personal_aprendiz')
    if request.method == 'POST':
        form= TapaUpdateForm(request.POST, instance=tapas_unique)
        if form.is_valid():
            form.save()
            aprendiz_nombre= tapas_unique.aprendiz.nombre
            messages.success(request,f'las tapas de {aprendiz_nombre} se modificaron correctamente!')
            return redirect('contabilidad-tapa')
    else:
        form= TapaUpdateForm(instance=tapas_unique)
    context={
        "titulo_pagina": titulo_pagina,
        "tapas": tapas,
        "form":form,
        "url_back":url_back
    }
    return render(request, "contabilidad/tapa-update.html",context)

def tapa_delete(pk,tipo):
    titulo_pagina = "Tapas"
    tapas = Tapa.objects.all()
    url_back= '/contabilidad/tapa/'
    tapa= Tapa.objects.get(id=pk)
    accion_txt= f"La contribución de {tapa.aprendiz.nombre} se eliminará"
    if request.method == 'POST' and tipo=="D":
        form= TapaForm(request.POST)
        Tapa.objects.filter(id=pk).update(
                    estado='0'
                )
        aprendiz_nombre= tapa.aprendiz.nombre
        messages.success(request,f'la contribución de {aprendiz_nombre} se eliminó correctamente!')
        return redirect('contabilidad-tapa')
    


@login_required(login_url="usuario-login")
def fondo(request):
    titulo_pagina = "Fondos"
    fondos_detalle = DetalleFondo.objects.all()
    if request.method == 'POST':
        if datetime.today().weekday() == 4:
            #fecha_aux = f"{datetime.now().year}-{datetime.now().month}-{datetime.now().day}"
            fecha_aux = datetime.now().strftime("%Y-%m-%d")
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

@login_required(login_url="usuario-login")
def detalle_fondo(request, pk):
    titulo_pagina = f"Nueva Contribución"
    fondos_detalle = DetalleFondo.objects.all()
    fondo_obj = DetalleFondo.objects.get(id=pk)
    url_back = "/contabilidad/fondo"
    # print(fondo_obj.equipo)
    if fondo_obj.equipo != None:
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
        'fondos_detalle': fondos_detalle,
        'titulo_pagina': titulo_pagina,
        "form": form,
        'url_back': url_back,
    }
    return render(request, "contabilidad/detalle-fondo.html", context)

@login_required(login_url="usuario-login")

def detalle_fondo_delete(request, pk):
    titulo_pagina = f"Fondos"
    fondos_detalle = DetalleFondo.objects.all()
    accion_txt = "eliminar el registro de la contribución"
    url_back = "/contabilidad/fondo"
    det_fo_obj = DetalleFondo.objects.get(id=pk)
    fo_obj = det_fo_obj.fondo
    if request.method == 'POST':
        det_fo_obj.delete()
        fo_obj.delete()
        messages.success(
            request, f'La Contribucion se ha eliminado!')
        return redirect('contabilidad-fondo')

    context = {
        'accion_txt': accion_txt,
        'url_back': url_back,
        'titulo_pagina': titulo_pagina,
        "fondos_detalle": fondos_detalle,
    }
    return render(request, "contabilidad/fondo-delete.html", context)
