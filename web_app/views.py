from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.views.generic import View
from web_app.forms import LoginForm
from django.contrib.auth.models import User
# from web_app.models import ERP_User

# test_setup is the deploy script for the ERPNext app
from test_setup import *


# Create your views here.
class HomeView(View):
    def get(self,request):
        return render(request,"home.html")

class IndexView(View):
    def get(self,request):
        return render(request,"index.html")

class AskSiteDetails(View):
    def get(self,request):
        return render(request,"createsite.html")

class CreateSite(View):
    def post(self,request):
        # get site name here then do commands [bench new-site, bench install-site, etc]
        site_name = request.POST.get('site_name')
        print site_name


        # if success,
        #   cd frappe_bench/sites/site_name
        #   open site_config && get db_name
        #   make query: add user_id, db_name, and site_name to user_site then return:
        return render(request,"success.html")

        # else if not success:
            # throw exception or something
