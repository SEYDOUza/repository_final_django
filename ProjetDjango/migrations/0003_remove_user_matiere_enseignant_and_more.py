# Generated by Django 4.1.4 on 2023-08-26 15:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('djangoApp', '0002_alter_user_matiere_enseignant'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='matiere_enseignant',
        ),
        migrations.AddField(
            model_name='user',
            name='matiere_enseignant',
            field=models.ManyToManyField(to='djangoApp.matiere'),
        ),
    ]
