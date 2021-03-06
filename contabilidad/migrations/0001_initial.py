# Generated by Django 4.0.4 on 2022-04-28 19:49

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('personal', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Fondo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField(help_text='MM/DD/AAAA', verbose_name='Fecha de Registro')),
            ],
        ),
        migrations.CreateModel(
            name='Tapa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateField(auto_now=True, help_text='MM/DD/AAAA', verbose_name='Fecha de Registro')),
                ('cantidad', models.PositiveIntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('aprendiz', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='personal.aprendiz', verbose_name='Aprendiz')),
            ],
        ),
        migrations.CreateModel(
            name='DetalleFondo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.CharField(choices=[('2500', '2500')], default='2500', max_length=4, verbose_name='Monto')),
                ('pagado', models.BooleanField(default=False)),
                ('equipo', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='personal.equipo', verbose_name='Equipo')),
                ('fondo', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='contabilidad.fondo', verbose_name='Fondo')),
            ],
        ),
    ]
