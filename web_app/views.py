from django.shortcuts import render,redirect
from django.http import HttpResponseRedirect
from django.views.generic import View
from web_app.forms import LoginForm
from django.contrib.auth.models import User
# from web_app.models import ERP_User

# test_setup is the deploy script for the ERPNext app
from test_setup import *

# import os
import os

# import models
from web_app.models import User_Sites

# Create your views here.
class HomeView(View):
    def get(self,request):
        return render(request,"home.html")

class IndexView(View):
    def get(self,request):
        if request.user.is_authenticated():
            return HttpResponseRedirect('../home')

        return render(request,"index.html")

class AskSiteDetails(View):
    def get(self,request):
        return render(request,"createsite.html")

class AccessSite(View):
    def post(self,request):
        try:
            site = User_Sites.objects.filter(username=request.user.username)
            print site.get().site_name

            cmd = "bench use " + site.get().site_name
            os.system(cmd)
            cmd = "bench --site " + site.get().site_name + " serve --port 8005"
            os.system(cmd)

            import webbrowser
            webbrowser.open('http://localhost:8005/')

            return render(request,"home.html")
        except:
            print "no site"
            return render(request,"home.html")

class CreateSite(View):
    def post(self,request):
        username = request.user.username
        site_name = request.POST.get('site_name')
        create(username,site_name)

        # if successful
        return render(request,"success.html")

        # else if not success:
            # throw exception or something

def create(username, site_name):
    import re
    newsite = "bench new-site " + site_name
    installapp = "bench --site "+ site_name + " install-app erpnext"

    # NOTETHIS: check if site_name already exists
    print "Creating new site.."
    os.system(newsite)
    print "Installing erpnext to site.."
    os.system(installapp)

    # get database name from site_config.json of new site
    old_dir = os.getcwd()
    path = '/home/testuser/frappe-bench/sites/'+ site_name
    os.chdir(path)
    print os.getcwd()
    with open('site_config.json') as f:
        content = f.readlines()
    tmp = content[1].strip()
    tmp = tmp.split(":")[1]
    db_name = re.sub('\W+','',tmp)
    os.chdir(old_dir)

    # add site to database, mapped to owner
    newsite = User_Sites()
    newsite.username = username
    newsite.db_name = db_name
    newsite.site_name = site_name
    newsite.save()

    print "Done!"
