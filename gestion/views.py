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
def crear_archivos(app_name):
    myfile = Path(f"static/backup/{app_name}.json")
    myfile.touch(exist_ok=True)
def extraer_datos(app_name):
    for i in range(2):
        sysout = sys.stdout
        sys.stdout=open(f"static/backup/{app_name}.json", 'w+')
        management.call_command('dumpdata', app_name)
        sys.stdout = sysout

def restaurar_datos(ruta_zip):


    ruta_extraccion = ""
    password = None
    print(f">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> {ruta_zip}")
    archivo_zip = zipfile.ZipFile(ruta_zip[1:], "r")
    try:
        print(archivo_zip.namelist())
        archivo_zip.extractall(pwd=password, path=ruta_extraccion)
    except:
        print("paila")
    archivo_zip.close()
    django.core.management.call_command("loaddata", ruta , ignorenonexistent=ignorenonexistent)
    

        
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
        
        form = BackupForm(request.POST, request.FILES)
        if form.is_valid():
            nombre= request.POST['nombre']
            archivo = request.FILES['archivo']
            
            insert = Backup(nombre=nombre, archivo=archivo)
            insert.save()
            restaurar_datos(insert.archivo.url)
            return redirect('backup','A')
        else:
            print( "Error al procesar el formulario")
              
    elif request.method == 'POST' and tipo== "D":
        fecha= date.today()
        for modelo in modelos:
            if modelo.verbose_name in request.POST.getlist("modelos_lista"):
                filtrado.append(modelo)
        print(filtrado)
        
        for i in filtrado:
            crear_archivos(i)
            extraer_datos(i)
        try:    
            compression = zipfile.ZIP_DEFLATED
        except:
            compression = zipfile.ZIP_STORED
        
        zf = zipfile.ZipFile(f"static/backup/backup at {fecha}.zip", mode="w")
        try:
            for i in filtrado:
                path_to_apk=f"static/backup/action/{i}.json"
                zf.write(path_to_apk, compress_type=compression)    
        finally:
            zf.close()
        path_to_apk=f"static/backup/backup at {fecha}.zip"
        file=open(path_to_apk,"rb")
        response=FileResponse(file)
        response['Content-Disposition'] = 'attachment; filename=' + os.path.basename(path_to_apk) 
        
        return response
    
    else:
        form = BackupForm()
      
        
    context ={
        "modelos":modelos,
        "form":form,
        "backups":backups
    }
    return render(request, 'backup.html',context) 