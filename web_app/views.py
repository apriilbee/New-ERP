from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.views.generic import View
from web_app.forms import LoginForm
from django.contrib.auth.models import User
#from web_app.models import ERP_User

# Create your views here.
class HomeView(View):
    def get(self,request):
        return render(request,"home.html")

class IndexView(View):
    def get(self,request):
        return render(request,"index.html")
