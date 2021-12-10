"""employees_project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from employees import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.render_login_page),
    path('login', views.action_login, name='action_login'),
    path('edit', views.open_edit_page, name='render_edit_info'),
    path('edit_info', views.action_edit_info, name='action_edit_info'),
    path('check_in', views.action_check_in, name='action_check_in'),
    path('check_out', views.action_check_out, name='action_check_out'),
    path('mark_day_off', views.action_mark_day_off, name='action_mark_day_off'),
    path('previous_attendance', views.action_previous_attendance, name='action_previous_attendance'),
]
