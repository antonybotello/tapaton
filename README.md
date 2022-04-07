#####################################
Creando el proyecto
#####################################

python -m venv adsi-venv
activate
pip install django
django-admin startproject NOMBRE .
python manage.py migrate
python manage.py runserver


settings el template tenga la direccion de la carpeta de plantillas
settings el static tenga asociada la direccion

views agregar los imports
views creamos nuestra funcion donde asociamos la plantilla y enviamos los datos necesarios para que sean visualizados en esa plantilla

urls crear el path
realizar el importe de la funcion de views

python manage.py migrate
python manage.py runserver

#####################################
Base de datos
#####################################

python manage.py startapp NOMBRE
En Settings.py, vinculamos las app a INSTALLED_APPS 
en models.py creamos los objetos con:

        class Nombre(models.Model):

pip install pymsql
pip install mysqlclient
En __init.py__ asociamos el plugin con estas dos lineas:

        import pymysql
        pymysql.install_as_MySQLdb

Se debe crear la base de datos previamente desde workbench o por el metodo que desee
configuramos la base de datos en setting.py cambiando el plugin ya agregando los datos ej:

        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'bd_Nombre',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',

python manage.py migrate
python manage.py makemigrations
python manage.py migrate

#####################################
Creando views
#####################################

Importamos las siguientes librerias en el views.py de cada app respectivamente:

        from django.shortcuts import render, redirect
        from personal.forms import AprendizForm
        from personal.models import Aprendiz

Creamos la vista :

def aprendiz(request):
    aprendices= Aprendiz.objects.all()
    #items= Aprendiz.objects.raw('SELECT * FROM personal_aprendiz')
    if request.method == 'POST':
        form= AprendizForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('personal-aprendiz')
    else:
        form= AprendizForm()
        context={
            "aprendices": aprendices,
            "form":form
        }
    return render(request, "personal/aprendiz.html",context)

Se asocia una nueva url en el urls.py de cada app respectivamente

        urlpatterns = [
               path('aprendiz/', aprendiz, name='personal-aprendiz'),
        ]
En el urls.py principal importamos la libreira include:

       from django.urls import include, path

le agregamos a urlpatterns:
        
        path('', include('personal.urls'))

#####################################
Creando template
#####################################
agregamos las librerias de Crispy forms y las vinculamos en settings.py en INSTALLED_APPS:

         'crispy_forms',
         'crispy_bootstrap5',

Enseguida de INSTALLED_APPS definimos las siguientes constantes:
     
        CRISPY_ALLOWED_TEMPLATE_PACKS = "bootstrap5"
        CRISPY_TEMPLATE_PACK = "bootstrap5"

Añadir los estilos y js de bootstrap a la carpeta static
En la carpeta de plantillas, en partials en el archivo body.hmtl vincular los estilos de bootstrap

    <link href="{% static 'css/bootstrap.min.css' %}" rel="stylesheet">
    <script src="{% static 'js/bootstrap.bundle.min.js' %}"></script>
    <script src="{% static 'js/jquery-3.2.1.slim.min.js' %}"></script>
    <script src="{% static 'js/jquery-3.5.1.min.js' %}"></script>
    <script src="{% static 'js/jquery.dataTables.min.js' %}"></script>
    <link rel="stylesheet" href="{% static 'css/jquery.dataTables.min.css' %}">

    <script src="{% static 'js/carousel-code.js' %}"></script>
    <script src="{% static 'js/toast-code.js' %}"></script>
    <script src="{% static 'js/tabla-proyecto.js' %}"></script>
    <script src="{% static 'js/jquery.dataTables.min.js' %}"></script>

En settings.py vincular la carpeta static
 
        STATICFILES_DIRS = [
            BASE_DIR / 'nombre\static'
        ]

Al html principal le cargamos crispy:
  
        {% load crispy_forms_tags %}

Ejemplo de formulario:

      <form action="" method="POST">
                {% csrf_token %}
                {{ form|crispy }}
                <input class="btn btn-success btn-block" 
                type="submit" Value="Agregar Aprendiz">
       </form>


















