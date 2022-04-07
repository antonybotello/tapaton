from django.shortcuts import render, redirect
from personal.forms import AprendizForm, EquipoForm
from personal.models import Aprendiz, Equipo

from django.contrib import messages

def aprendiz(request):
    titulo_pagina="Aprendices"
    aprendices= Aprendiz.objects.all()
    #items= Aprendiz.objects.raw('SELECT * FROM personal_aprendiz')
    if request.method == 'POST':
        form= AprendizForm(request.POST)
        if form.is_valid():
            form.save()
            aprendiz_nombre= form.cleaned_data.get('nombre')
            messages.success(request,f'El aprendiz {aprendiz_nombre} se agregó correctamente!')
            return redirect('personal-aprendiz')
    else:
        form= AprendizForm()
        context={
            "titulo_pagina": titulo_pagina,
            "aprendices": aprendices,
            "form":form
        }
    return render(request, "personal/aprendiz.html",context)

def equipo(request):
    titulo_pagina="Equipos"
    equipos= Equipo.objects.all()
    #items= Aprendiz.objects.raw('SELECT * FROM personal_aprendiz')
    if request.method == 'POST':
        form= EquipoForm(request.POST)
        if form.is_valid():
            form.save()
            equipo_nombre= form.cleaned_data.get('nombre')
            messages.success(request,f'El equipo {equipo_nombre} se agregó correctamente!')
            return redirect('personal-equipo')
        else:
            equipo_nombre= form.cleaned_data.get('nombre')
            messages.error(request,f'El equipo {equipo_nombre} no se ha podido agregar!')
           
            return redirect('personal-equipo')
    else:
        form= EquipoForm()
        context={
            "titulo_pagina":titulo_pagina,
            "equipos": equipos,
            "form": form
        }
    return render(request, "personal/equipo.html",context)