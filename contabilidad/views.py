from datetime import datetime
from django.shortcuts import render, redirect
from contabilidad.forms import DetalleFondoForm, TapaForm, TapaUpdateForm
from contabilidad.models import DetalleFondo, Fondo, Tapa
from django.contrib.auth.decorators import login_required
from gestion.decorators import unauthenticated_user, allowed_users
from django.contrib import messages


@login_required(login_url="usuario-login")
def tapa(request, modal_status="v"):
    titulo_pagina = "Tapas"
    subtitulo_pagina = "Gestion de Tapas"
    modal_title = "eliminar tapas"
    modal_txt = ""
    modal_submit=""
    tapas = Tapa.objects.all()
    form = TapaForm()
    pk_tapa= ""
    tipo=""
    if request.method == 'POST' and "form-create" in request.POST:
        form = TapaForm(request.POST)
        if datetime.today().weekday() == 4:
            if form.is_valid():
                modal_status = 't'
                aux=form.save()
                messages.success(request, f'{aux.aprendiz} aporto {aux.cantidad} tapas!')
                return redirect('contabilidad-tapa')
        else:
            messages.warning(request, f'Hoy no es día de agregar fondos!!!')
        print("creando")

    if request.method == 'POST' and "form-delete" in request.POST:
        modal_status = 't'
        aprendiz=Tapa.objects.get(id=request.POST['pk'])
        modal_submit="Confirmar"
       
        modal_txt=f"eliminar la contribución de {aprendiz.aprendiz} con fecha {aprendiz.fecha}"
        tipo= "eliminar"
        pk_tapa= request.POST['pk']

    if request.method == 'POST' and "form-update" in request.POST:
        modal_status = 't'
        tipo="editar"
        print("editando", request.POST['pk'])

    if  request.method == 'POST' and "modal-confirmar" in request.POST:
        print(request.POST)
        if request.POST['tipo'] == "eliminar":
            aprendiz = Tapa.objects.get(id=int(request.POST['modal-pk'] ))
            aprendiz.delete()
        
            messages.success(request, f'la contribución de {aprendiz.aprendiz} se eliminó correctamente!')
            return redirect('contabilidad-tapa')
        
    context = {
        "titulo_pagina": titulo_pagina,
        "subtitulo_pagina": subtitulo_pagina,
        "modal_title": modal_title,
        "modal_txt": modal_txt,
        "tapas": tapas,
        "form": form,
        "modal_status": modal_status,
        "modal_submit":modal_submit,
        "pk":pk_tapa,
        "tipo":tipo
        }
    return render(request, "contabilidad/tapa.html", context)


@login_required(login_url="usuario-login")
def tapa_update(request, pk):
    titulo_pagina = "Tapas"
    url_back = '/contabilidad/tapa/'
    tapas = Tapa.objects.all()
    tapas_unique = Tapa.objects.get(id=pk)
    #items= Aprendiz.objects.raw('SELECT * FROM personal_aprendiz')
    if request.method == 'POST':
        form = TapaUpdateForm(request.POST, instance=tapas_unique)
        if form.is_valid():
            form.save()
            aprendiz_nombre = tapas_unique.aprendiz.nombre
            messages.success(
                request, f'las tapas de {aprendiz_nombre} se modificaron correctamente!')
            return redirect('contabilidad-tapa')
    else:
        form = TapaUpdateForm(instance=tapas_unique)
    context = {
        "titulo_pagina": titulo_pagina,
        "tapas": tapas,
        "form": form,
        "url_back": url_back
    }
    return render(request, "contabilidad/tapa-update.html", context)


    
    

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
