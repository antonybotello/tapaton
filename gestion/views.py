from pathlib import Path
from django.shortcuts import redirect,render
from django.apps import apps
import sys
from django.core import management
from gestion.models import Backup
from gestion.forms import BackupForm


def crear_archivos(app_name):
    myfile = Path(f"static/backup/{app_name}.json")
    myfile.touch(exist_ok=True)
def extraer_datos(app_name):
    for i in range(2):
        sysout = sys.stdout
        sys.stdout=open(f"static/backup/{app_name}.json", 'w+')
        management.call_command('dumpdata', app_name)
        sys.stdout = sysout

def rstaurar_datos(app_name):
    for i in range(2):
        sysout = sys.stdout
        sys.stdout=open(f"static/backup/{app_name}.json", 'w+')
        management.call_command('dumpdata', app_name)
        sys.stdout = sysout
        
def subir_datos(app_name,f):
    with open(f"static/backup/{app_name}.json", 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)
        
def inicio(request):
    
    titulo_pagina="Inicio"
    context={
       
        'titulo_pagina':titulo_pagina
    }
    return render(request,'index.html',context)

 
            
def backup(request,tipo):
    modelos= list(map(
        lambda x: x._meta,
        apps.get_models()[7:]
        ))
   
    filtrado=[]
    backups = Backup.objects.all()
    if request.method == 'POST' and tipo== "U":
        # Fetching the form data
        nombre = "prueba"
        form = BackupForm(request.POST, request.FILES)
        if form.is_valid():
  
            archivo = request.FILES['archivo']
            
            insert = Backup(nombre="copia", archivo=archivo)
            insert.save()
            
            return redirect('backup','A')
        else:
            print( "Error al procesar el formulario")
            return redirect('backup','A')

        
        return redirect('backup','A')
            
    elif request.method == 'POST'and tipo== "D":
        for modelo in modelos:
            if modelo.verbose_name in request.POST.getlist("modelos_lista"):
                filtrado.append(modelo)
        print(filtrado)
        return redirect('backup','A')
    for i in filtrado:
        crear_archivos(i)
        extraer_datos(i)
        
    else:
        form = BackupForm()
      
        
    context ={
        "modelos":modelos,
        "form":form,
        "backups":backups
    }
    return render(request, 'backup.html',context) 