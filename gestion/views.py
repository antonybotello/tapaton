from pathlib import Path
from django.shortcuts import redirect,render
from django.apps import apps
import sys
from django.core import management
from gestion.models import Backup
from gestion.forms import BackupForm
from django.http import FileResponse
import os
import zipfile
from datetime import date

def exportar_datos():
    fecha=date.today()
    os.system(f"mysqldump --add-drop-table --column-statistics=0 -u root bd_tapaton> static/backup/BKP_{fecha}.sql")
   

def importar_datos(archivo):
    try:
        os.system(f"mysql -u root bd_tapaton < {archivo[1:]}")
    except:
        print("Problemas al importar")

    
def inicio(request):

    titulo_pagina="Inicio"
   
    context={
       
        'titulo_pagina':titulo_pagina
    }
    return render(request,'index.html',context)

 
            
def backup(request,tipo):
   
    ejemplo_dir = 'static/backup/'
    with os.scandir(ejemplo_dir) as ficheros:
        ficheros = [fichero.name for fichero in ficheros if fichero.is_file()]
    print(ficheros)
    filtrado=[]
    backups = Backup.objects.all()
    if request.method == 'POST' and tipo== "U":
        # Fetching the form data
        
        form = BackupForm(request.POST, request.FILES)
        if form.is_valid():
            nombre= request.POST['nombre']
            archivo = request.FILES['archivo']
            
            insert = Backup(nombre=nombre, archivo=archivo)
            insert.save()
            
            importar_datos(insert.archivo.url)
            
            insert = Backup(nombre=nombre, archivo=archivo)
            insert.save()
            
            return redirect('backup','A')
        else:
            print( "Error al procesar el formulario")
              
    elif request.method == 'POST' and tipo== "D":
        exportar_datos()
        return redirect('backup','A')
    
    else:
        form = BackupForm()
      
        
    context ={
        "ficheros":ficheros,
        "form":form,
        "backups":backups
    }
    return render(request, 'backup.html',context) 