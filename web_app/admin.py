from django.contrib import admin
from web_app import models

# Register your models here.

@admin.register(models.User_Sites)
class UserSiteAdmin(admin.ModelAdmin):
     list_display = ('username','site_name','db_name')
