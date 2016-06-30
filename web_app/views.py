from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.views.generic import View
from web_app.forms import LoginForm
from django.contrib.auth.models import User
from web_app.models import ERP_User

# Create your views here.
class HomeView(View):
    def get(self,request):
        return render(request,"home.html")

class RegisterView(View):
    def get(self,request):
        return render(request, "register.html")
    def post(self, request):
        e_user = ERP_User()
        e_user.first_name = request.POST.get('fname')
        e_user.last_name = request.POST.get('lname')
        e_user.email = request.POST.get('email')

        user = User.objects.create_user(request.POST['username'], e_user.email, request.POST['password'])
        user.last_name = e_user.last_name
        user.first_name = e_user.first_name
        user.save()

        e_user.user = user
        e_user.save()

        return render(request,"login.html")

class LoginView(View):
    def get(self,request):
        return render(request,"login.html")
