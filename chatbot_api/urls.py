
from django.contrib import admin
from django.urls import path
from . import views
from apis import views as aviews
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('api/chat/', aviews.chat, name='chat'),
    path('api/train/', aviews.train, name='train'),
]
