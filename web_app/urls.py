from django.conf.urls import url, include
from . import views
from web_app.views import *
import allauth

urlpatterns = [
    url(r'^$',HomeView.as_view(),name='home'),
    url(r'^home/',HomeView.as_view(),name='homepage'),
    url(r'^accounts/', include('allauth.urls')),

]
