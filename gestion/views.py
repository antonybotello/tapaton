from pathlib import Path
from django.shortcuts import redirect,render
from django.apps import apps
import sys
from django.core import management

from gestion.forms import UploadFileForm


def crear_archivos(app_name):
    myfile = Path(f"gestion/static/backup/{app_name}.json")
    myfile.touch(exist_ok=True)
def extraer_datos(app_name):
    for i in range(2):
        sysout = sys.stdout
        sys.stdout=open(f"gestion/static/backup/{app_name}.json", 'w+')
        management.call_command('dumpdata', app_name)
        sys.stdout = sysout
        
def subir_datos(app_name,f):
    with open(f"gestion/static/backup/{app_name}.json", 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)
        
def inicio(request):
    
    titulo_pagina="Inicio"
    context={
       
        'titulo_pagina':titulo_pagina
    }
    return render(request,'index.html',context)

 
            
def backup(request):
    modelos= list(map(
        lambda x: x._meta,
        apps.get_models()[6:]
        ))
    filtrado=[]
    if request.method == 'post':
        form = UploadFileForm(request.post, request.FILES)
        if form.is_valid():
            subir_datos(request.post['title'],request.FILES['file'])
            print("si funciona")
            
    elif request.method == 'POST':
        for modelo in modelos:
            if modelo.verbose_name in request.POST.getlist("modelos_lista"):
                filtrado.append(modelo)
        print(filtrado)
    for i in filtrado:
        crear_archivos(i)
        extraer_datos(i)
    else:
        pass
    context ={
        "modelos":modelos
    } 
    return render(request, 'backup.html',context) 