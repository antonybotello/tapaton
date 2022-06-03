from django import forms
from gestion.models import Backup

class BackupForm(forms.Form):
    class Meta:
        model= Backup
        fields= ['nombre','archivo','fecha']