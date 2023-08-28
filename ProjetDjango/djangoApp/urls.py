from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path
from .views import MatiereCreateView, MatiereUpdateView, MatiereDeleteView, MatiereListView
from .views import FiliereCreateView, FiliereUpdateView, FiliereDeleteView, FiliereListView
from .views import CourCreateView, CourUpdateView, CourDeleteView, CourListView, CourDeleteView, CourDownloadView, AdminCreateView, AdminListView, AdminUpdateView, AdminDeleteView, ProjetListEView
from .views import ProjetCreateView, ProjetUpdateView, ProjetListView, ProjetDeleteView, ProjetDownloadView, ProjetShowView
from djangoApp import views
urlpatterns = [
    path('', views.index, name="pageAdmin"),
    path('formulaire/admin', views.formulaireAdmin, name="formAdmin"),
    path('formulaire/enseignant', views.formulaireEnseignant, name="formEnseignant"),
    path('formulaire/Etudiant', views.formulaireEtudiant, name="formEtudiant"),
    path('register/', views.registerFunction, name="register"),
    path('quitter/', views.logout_utilisateur, name="quitter"),
    # path('inscription/', views.register, name='inscription'),
    path('login/', views.loginFunction, name='login'),
    path('adminpage/', views.admin, name='adminpage'),
    path('etudiant/', views.etudiant, name='etudiantPage'),
    path('enseignant/', views.enseignant, name='enseignant'),
    path('liste/', views.liste_matiere, name='liste_des_matiere'),
    path('register/enseignant', views.registerEnseignantFunction,
         name="registerEnseignant"),
    path('register/etudiant', views.registerEtudiantFunction,
         name="registerEtudiant"),

    # Admin crud url
    path('admin/create/', AdminCreateView.as_view(), name='admin-create'),
    path('admin/', AdminListView.as_view(), name='admin-list'),
    path('admin/<int:pk>/update/',
         AdminUpdateView.as_view(), name='admin-update'),
    path('admin/<int:pk>/delete/',
         AdminDeleteView.as_view(), name='admin-delete'),
    #

    path('register/admin', views.registerAdminFunction, name="registerEtudiant"),
    # Matiere URL

    path('matiere/create/', MatiereCreateView.as_view(), name='matiere-create'),
    path('matiere/<int:pk>/update/',
         MatiereUpdateView.as_view(), name='matiere-update'),
    path('matiere/<int:pk>/delete/',
         MatiereDeleteView.as_view(), name='matiere-delete'),
    path('matiere/', MatiereListView.as_view(), name='matiere-list'),
    # Filiere URL
    path('filiere/create/', FiliereCreateView.as_view(), name='filiere-create'),
    path('filiere/<int:pk>/update/',
         FiliereUpdateView.as_view(), name='filiere-update'),
    path('filiere/<int:pk>/delete/',
         FiliereDeleteView.as_view(), name='filiere-delete'),
    path('filiere/', FiliereListView.as_view(), name='filiere-list'),
    # Projet URL
    path('projet/create/', ProjetCreateView.as_view(), name='projet-create'),
    path('projet/<int:pk>/update/',
         ProjetUpdateView.as_view(), name='projet-update'),
    path('projet/list/', ProjetListView.as_view(), name='projet-list'),
    path('projet/listEs/', ProjetListEView.as_view(), name='projet-list2'),
    path('projet/<int:pk>/delete/',
         ProjetDeleteView.as_view(), name='projet-delete'),
    path('projet/<int:pk>/download/',
         ProjetDownloadView.as_view(), name='projet-download'),
    path('projet/soumission/', views.soummission, name='projet-soumission'),
    path('projet/<int:pk>/show/', ProjetShowView, name='projet-show'),
    # Cour URL
    path('cour/create/', CourCreateView.as_view(), name='cour-create'),
    path('cour/<int:pk>/update/', CourUpdateView.as_view(), name='cour-update'),
    path('cour/list/', CourListView.as_view(), name='cour-list'),
    path('cour/<int:pk>/delete/', CourDeleteView.as_view(), name='cour-delete'),
    path('cour/<int:pk>/download/',
         CourDownloadView.as_view(), name='cour-download'),
    # path('cour/<int:pk>/show/', CourShowView, name='cour-show'),



]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
