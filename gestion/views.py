from django.shortcuts import redirect,render

def inicio(request):
    
    titulo_pagina="Inicio"
    context={
       
        'titulo_pagina':titulo_pagina
    }
    return render(request,'index.html',context)