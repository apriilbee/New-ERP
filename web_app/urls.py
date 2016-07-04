from django.conf.urls import url, include
from . import views
from web_app.views import *
import allauth

urlpatterns = [
    url(r'^$',IndexView.as_view(),name='index'),
    url(r'^home/',HomeView.as_view(),name='home'),
    url(r'^accounts/', include('allauth.urls')),

]
