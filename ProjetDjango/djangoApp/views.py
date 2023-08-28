from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.shortcuts import render, redirect
from .forms import SignUpForm, LoginForm
from django.contrib.auth import authenticate, login, logout

from django.urls import reverse_lazy
from django.views.generic import CreateView, UpdateView, DeleteView, ListView, View
from django.shortcuts import get_object_or_404
from django.http import FileResponse
from .models import Matiere, Filiere, Projet, Devoir, Matieretest, Cour, User
from .forms import FiliereForm, ProjetForm, DevoirForm, SignUpFormEnseignant, SignUpFormEtudiant, SignUpFormAdimin, CourForm
# Create your views here.


def index(request):
    # return render(request, 'templateApp/squellete.html')
    return render(request, 'templateApp/templateAdmin/index.html')

# formulaire d'enregistrement d'un administrateur


def formulaireAdmin(request):
    msg = None
    if request.method == 'POST':
        form = SignUpFormAdimin(request.POST)
        if form.is_valid():
            user = form.save()
            msg = 'user created'
            return redirect('login')
        else:
            msg = 'form is not valid'
    else:
        form = SignUpFormAdimin()
    return render(request, 'templateApp/templateAdmin/formulaireAdmin.html', {'form': form, 'msg': msg})


# formulaire d'enregistrement d'un enseigant
def formulaireEnseignant(request):
    msg = None
    if request.method == 'POST':
        form = SignUpFormEnseignant(request.POST)
        if form.is_valid():
            user = form.save()
            matieres_selected = form.cleaned_data['matiere_enseignant']
            user.save()  # Sauvegarder l'utilisateur pour obtenir un ID utilisateur

            # Ajouter les matières associées à l'utilisateur
            user.matiere_enseignant.set(matieres_selected)
            msg = 'user created'
            return redirect('login')
        else:
            msg = 'form is not valid'
    else:
        form = SignUpFormEnseignant()
    return render(request, 'templateApp/templateAdmin/formulaireEnseignant.html', {'form': form, 'msg': msg})

# formulaire d'enregistrement d'un etudiant


def formulaireEtudiant(request):
    msg = None
    if request.method == 'POST':
        form = SignUpFormEtudiant(request.POST)
        if form.is_valid():
            user = form.save()
            msg = 'user created'
            return redirect('login')
        else:
            msg = 'form is not valid'
    else:
        form = SignUpFormEtudiant()
    return render(request, 'templateApp/templateAdmin/formulaireEtudiant.html', {'form': form, 'msg': msg})


def registerFunction(request):
    msg = None
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            msg = 'user created'
            return redirect('login')
        else:
            msg = 'form is not valid'
    else:
        form = SignUpForm()
    return render(request, 'djangoApp/registerPage.html', {'form': form, 'msg': msg})


def loginFunction(request):
    form = LoginForm(request.POST or None)
    msg = None
    if request.method == 'POST':
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None and user.is_administrateur:
                login(request, user)
                nomUtilisateur = user.username
                context = {
                    'nomUtilisateur': nomUtilisateur
                }
                return render(request, 'templateApp/templateAdmin/tableau_bord.html', context)
            elif user is not None and user.is_etudiant:
                filiere_etudiant = user.filire_etudiant_id
                matieres_associées = Matiere.objects.filter(
                    filiere__id=filiere_etudiant)
                nomUtilisateur = user.username
                # matieres_associées = Matiere.objects.filter(filiere_matieres__filiere_id=filiere_etudiant)
                context = {
                    'liste_matiere': matieres_associées,
                    'nomUtilisateur': nomUtilisateur
                }
                login(request, user)
                return render(request, 'templateApp/templateAdmin/tableau_bordEtudiant.html', context)
            elif user is not None and user.is_enseignat:
                id_enseignant = user.id
                matieres_associées = Matiere.objects.filter(
                    user__id=id_enseignant)

                nomUtilisateur = user.username
                context = {
                    'liste_matiere': matieres_associées,
                    'nomUtilisateur': nomUtilisateur
                }

                login(request, user)
                return render(request, 'templateApp/templateAdmin/tableau_bord_enseignant.html', context)
            else:
                msg = 'invalid credentials'
        else:
            msg = 'error validating form'
    return render(request, 'templateApp/connexion.html', {'form': form, 'msg': msg})


def logout_utilisateur(request):
    logout(request)
    return redirect('login')


# MATIERE CRUD
class MatiereCreateView(CreateView):
    model = Matiere
    fields = ['nomMatiere']
    template_name = 'templateApp/templateAdmin/formulaireMatiere.html'
    success_url = reverse_lazy('matiere-list')


class MatiereUpdateView(UpdateView):
    model = Matiere
    fields = ['nomMatiere']
    template_name = 'templateApp/templateAdmin/formulaireMatiere.html'
    success_url = reverse_lazy('matiere-list')


class MatiereDeleteView(DeleteView):
    model = Matiere
    template_name = 'templateApp/templateAdmin/matiere_confirm_delete.html'
    success_url = reverse_lazy('matiere-list')


class MatiereListView(ListView):
    model = Matiere
    template_name = 'templateApp/templateAdmin/listeMatiere.html'
    # template_name = 'register/matiere_list.html'
    context_object_name = 'matieres'


# USER admin CRUD

class AdminCreateView(CreateView):
    model = User
    form_class = SignUpFormAdimin
    template_name = 'templateApp/templateAdmin/formulaireAdmin.html'
    success_url = reverse_lazy('admin-list')


class AdminUpdateView(UpdateView):
    model = User
    form_class = SignUpFormAdimin
    template_name = 'templateApp/templateAdmin/formulaireAdmin.html'
    # changer avec la liste les admin
    success_url = reverse_lazy('admin-list')


class AdminDeleteView(DeleteView):
    model = User
    template_name = 'templateApp/templateAdmin/admin_confirn_delete.html'
    success_url = reverse_lazy('admin-list')


class AdminListView(ListView):
    model = User
    template_name = 'templateApp/templateAdmin/listeAdmin.html'
    # template_name = 'register/matiere_list.html'
    context_object_name = 'admins'  # changer avec la liste les admin


# FILIERE CRUD


class FiliereCreateView(CreateView):
    model = Filiere
    form_class = FiliereForm
    # fields=['nomFiliere','matieres']
    template_name = 'templateApp/templateAdmin/formulaireFiliere.html'
    success_url = reverse_lazy('filiere-list')


class FiliereUpdateView(UpdateView):
    model = Filiere
    form_class = FiliereForm
    # fields = ['nomFiliere','matieres']
    template_name = 'templateApp/templateAdmin/formulaireFiliere.html'
    success_url = reverse_lazy('filiere-list')


class FiliereDeleteView(DeleteView):
    model = Filiere
    template_name = 'templateApp/templateAdmin/filiere_confirm_delete.html'
    success_url = reverse_lazy('filiere-list')


class FiliereListView(ListView):
    model = Filiere
    template_name = 'templateApp/templateAdmin/listeFiliere.html'
    context_object_name = 'filieres'

# PROJET CRUD


class ProjetCreateView(CreateView):
    model = Projet
    form_class = ProjetForm
    template_name = 'register/projet_form.html'
    success_url = reverse_lazy('projet-list2')


class ProjetUpdateView(UpdateView):
    model = Projet
    form_class = ProjetForm
    template_name = 'register/projet_form.html'
    success_url = reverse_lazy('projet-list2')


class ProjetListView(ListView):
    model = Projet
    template_name = 'register/projet_list.html'


class ProjetListEView(ListView):
    model = Projet
    template_name = 'register/projet_liste_es.html'


class ProjetDeleteView(DeleteView):
    model = Projet
    template_name = 'register/projet_confirm_delete.html'
    success_url = reverse_lazy('projet-list2')


class ProjetDownloadView(View):
    def get(self, request, pk):
        projet = get_object_or_404(Projet, pk=pk)
        return FileResponse(projet.fichierProjet)

# COURS CRUD


class CourCreateView(CreateView):
    model = Projet
    form_class = CourForm
    template_name = 'register/cour_form.html'
    success_url = reverse_lazy('cour-list')


class CourUpdateView(UpdateView):
    model = Cour
    form_class = CourForm
    template_name = 'register/cour_form.html'
    success_url = reverse_lazy('cour-list')


class CourListView(ListView):
    model = Cour
    template_name = 'register/cour_list.html'


class CourDeleteView(DeleteView):
    model = Cour
    template_name = 'register/cour_confirm_delete.html'
    success_url = reverse_lazy('cour-list')


class CourDownloadView(View):
    def get(self, request, pk):
        cour = get_object_or_404(Projet, pk=pk)
        return FileResponse(cour.fichierCour)

# class ProjetShowView(View):
#     template_name = 'projet_show.html'

#     def get(self, request, pk):
#         projet = get_object_or_404(Projet, pk=pk)
#         context = {'projet': projet}
#         return render(request, self.template_name, context)


def ProjetShowView(request, pk):
    projet = get_object_or_404(Projet, pk=pk)
    devoir_form = DevoirForm(request.POST or None, request.FILES or None)
    if request.method == 'POST':
        # Etudiant.nomEtudiant = request.user.username
        if devoir_form.is_valid():
            devoir = devoir_form.save(commit=False)
            devoir.etudiant = request.user  # L'étudiant actuellement connecté
            devoir.projet = projet
            devoir.save()
            return redirect('projet-soumission')

    context = {
        'projet': projet,
        'devoir_form': devoir_form,
    }
    return render(request, 'register/projet_show.html', context)


def liste_matiere(request):
    liste = Matieretest.objects.all().values()
    context = {
        'listes': liste
    }
    return render(request, 'register/liste_matiere.html', context)


def soummission(request):
    return render(request, 'register/projet_soumission.html')


def admin(request):
    return render(request, 'djangoApp/index.html')


def etudiant(request):
    return render(request, 'djangoApp/login.html')


def enseignant(request):
    return render(request, 'djangoApp/profile.html')


# copier
def registerEnseignantFunction(request):
    msg = None
    if request.method == 'POST':
        form = SignUpFormEnseignant(request.POST)
        if form.is_valid():
            user = form.save()
            matieres_selected = form.cleaned_data['matiere_enseignant']
            user.save()  # Sauvegarder l'utilisateur pour obtenir un ID utilisateur

            # Ajouter les matières associées à l'utilisateur
            user.matiere_enseignant.set(matieres_selected)
            msg = 'user created'
            return redirect('login')
        else:
            msg = 'form is not valid'
    else:
        form = SignUpFormEnseignant()
    return render(request, 'djangoApp/register_enseignant.html', {'form': form, 'msg': msg})

# deja copier


def registerEtudiantFunction(request):
    msg = None
    if request.method == 'POST':
        form = SignUpFormEtudiant(request.POST)
        if form.is_valid():
            user = form.save()
            msg = 'user created'
            return redirect('login')
        else:
            msg = 'form is not valid'
    else:
        form = SignUpForm()
    return render(request, 'djangoApp/register_etudiant.html', {'form': form, 'msg': msg})


# deja copier
def registerAdminFunction(request):
    msg = None
    if request.method == 'POST':
        form = SignUpFormAdimin(request.POST)
        if form.is_valid():
            user = form.save()
            msg = 'user created'
            return redirect('login')
        else:
            msg = 'form is not valid'
    else:
        form = SignUpForm()
    return render(request, 'djangoApp/register_admin.html', {'form': form, 'msg': msg})
