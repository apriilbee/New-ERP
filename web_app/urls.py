from django.conf.urls import url
from . import views
from web_app.views import *

urlpatterns = [
    url(r'^$',HomeView.as_view(),name='home'),
    url(r'^register/', RegisterView.as_view(),name='register'),
    url(r'^login/', LoginView.as_view(),name='login'),
]
