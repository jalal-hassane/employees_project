import ctypes
from datetime import datetime, timedelta
from enum import Enum

import phonenumbers
from django.core.exceptions import ObjectDoesNotExist
from django.http import HttpResponse
from django.shortcuts import redirect
# Create your views here.
from django.template import loader

from employees.models import Employee, Attendance


# todo create global function to check if employee has checked in, checked out or took a day off
class EmployeeStatus(Enum):
    FIRST_LOGIN = 0
    CHECKED_IN = 1
    CHECKED_OUT = 2
    DAY_OFF = 3


def check_employee_status(employee):
    attendance = Attendance.objects.filter(employee_public_id=employee, date=datetime.now().date())
    if not attendance.exists():
        return EmployeeStatus.FIRST_LOGIN
    last_attendance_record = attendance.last()  # get last attendance record
    if last_attendance_record.is_day_off:
        return EmployeeStatus.DAY_OFF
    if last_attendance_record.check_out_time is not None:
        print('checked out')
        return EmployeeStatus.CHECKED_OUT
    else:
        return EmployeeStatus.CHECKED_IN


""" 
Render front end pages, start the view with render
"""


def render_alert(request, message):
    template = loader.get_template('alert.html')
    context = {
        'alert': message,
    }
    return HttpResponse(template.render(context, request))


def render_login_page(request):
    try:
        logged_in = request.COOKIES['logged_in'] or False
        if logged_in:
            username = request.COOKIES['username']
            employee = Employee.objects.get(username=username)
            status = check_employee_status(employee)
            checked_in = checked_out = day_off = False
            if status == EmployeeStatus.CHECKED_IN:
                checked_in = True
            elif status == EmployeeStatus.CHECKED_OUT:
                checked_out = True
            elif status == EmployeeStatus.DAY_OFF:
                day_off = True
            return render_landing_page(request, employee, checked_in, checked_out, day_off)
    except KeyError:
        pass
    template = loader.get_template('login.html')
    return HttpResponse(template.render({}, request))


def render_landing_page(request, employee, checked_in, checked_out, disable_all):
    template = loader.get_template('landing.html')
    attendance = Attendance.objects.filter(employee_public_id=employee)

    s = total = 0
    if attendance.exists():
        for att in attendance:
            s += att.attendance
        total = round(round(s / 3600, ndigits=2) * employee.hour_rate, ndigits=2)

    context = {"employee": employee, "checked_in": checked_in, "checked_out": checked_out,
               "total": total, "disable_all": disable_all}
    response = HttpResponse(template.render(context, request))
    response.set_cookie('logged_in', True, max_age=120)
    response.set_cookie('username', employee.username, max_age=120)
    response.set_cookie('password', employee.password, max_age=120)
    print("setting new cookies")
    return response


def render_edit_info_page(request, employee):
    template = loader.get_template('edit_info.html')
    context = {"employee": employee}
    return HttpResponse(template.render(context, request))


def render_attendance_page(request, attendance):
    template = loader.get_template('attendance.html')
    context = {"attendance": attendance}
    return HttpResponse(template.render(context, request))


""" Actions """


def action_login(request):
    get_request = request.GET
    print(get_request)
    username = get_request.get('username')
    password = get_request.get('password')
    try:
        employee = Employee.objects.get(username=username)
        if employee.password == password:
            print("login succeeded")
            status = check_employee_status(employee)
            checked_in = checked_out = day_off = False
            if status == EmployeeStatus.CHECKED_IN:
                checked_in = True
            elif status == EmployeeStatus.CHECKED_OUT:
                checked_out = True
            elif status == EmployeeStatus.DAY_OFF:
                day_off = True
            return render_landing_page(request, employee, checked_in, checked_out, day_off)
        else:
            alert = "Wrong Credentials"
    except ObjectDoesNotExist:
        alert = "Username Not Found"
    return render_alert(request, alert)


def action_edit_info(request):
    get_request = request.GET
    print(get_request)
    public_id = get_request.get('public_id')
    first_name = get_request.get('first_name')
    last_name = get_request.get('last_name')
    phone_number = get_request.get('phone_number')
    leb_phone = phonenumbers.parse('+961' + phone_number)
    if not phonenumbers.is_possible_number(leb_phone):
        ctypes.windll.user32.MessageBoxW(0, "The phone number you entered is not valid!", "Validation Error", 0)
        return redirect(request.META['HTTP_REFERER'])
    email = get_request.get('email')
    try:
        employee = Employee.objects.get(public_id=public_id)
        employee.first_name = first_name
        employee.last_name = last_name
        employee.phone_number = phone_number
        employee.email = email
        employee.save()
        # return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    except ObjectDoesNotExist:
        print("object does not exist", public_id)
    print("PATH", request.path_info)
    return redirect(request.META['HTTP_REFERER'])
    # return HttpResponse(HttpResponseRedirect(reverse('render_edit_info')))
    # return render_edit_info_page(request, employee)


def action_check_in(request):
    print('user checkin')
    get_request = request.GET
    print("check_in", get_request)
    public_id = get_request.get('public_id')
    employee = {}
    try:
        employee = Employee.objects.get(public_id=public_id)
        # add attendance record
        print("Date", str(datetime.now().date()))
        print("Time", str(datetime.now().time()))
        print("Employee", employee)
        attendance = Attendance(date=datetime.now().date(), employee_public_id=employee,
                                check_in_time=datetime.now().time()
                                )

        print("Attendance", attendance)
        attendance.save()
    except ObjectDoesNotExist:
        print("object does not exist", public_id)
    return render_landing_page(request, employee, True, False, False)
    pass


def action_check_out(request):
    print('user checkout')
    get_request = request.GET
    print("check_out", get_request)
    public_id = get_request.get('public_id')
    employee = {}
    try:
        employee = Employee.objects.get(public_id=public_id)
        # add attendance record
        attendance = Attendance.objects.filter(employee_public_id=employee)
        print("Found attendances", str(attendance))
        m_attendance = attendance.last()
        print("Found attendance", str(m_attendance))
        print("Found attendance", str(m_attendance.check_in_time))
        m_attendance.check_out_time = datetime.now().time()

        enter_delta = timedelta(hours=m_attendance.check_in_time.hour,
                                minutes=m_attendance.check_in_time.minute,
                                seconds=m_attendance.check_in_time.second)
        exit_delta = timedelta(hours=m_attendance.check_out_time.hour,
                               minutes=m_attendance.check_out_time.minute,
                               seconds=m_attendance.check_out_time.second)
        difference_delta = exit_delta - enter_delta

        m_attendance.attendance = difference_delta.seconds
        m_attendance.save()
    except ObjectDoesNotExist:
        print("object does not exist", public_id)
    return render_landing_page(request, employee, False, True, False)
    pass


def action_mark_day_off(request):
    get_request = request.GET
    public_id = get_request.get('public_id')
    employee = {}
    try:
        employee = Employee.objects.get(public_id=public_id)
        m_attendance = Attendance(date=datetime.now().date(), employee_public_id=employee, is_day_off=True)
        m_attendance.save()
    except ObjectDoesNotExist:
        print("object does not exist", public_id)
    return render_landing_page(request, employee, False, False, True)
    pass


def action_previous_attendance(request):
    get_request = request.GET
    public_id = get_request.get('public_id')
    try:
        employee = Employee.objects.get(public_id=public_id)
        attendance = Attendance.objects.filter(employee_public_id=employee).order_by('-date', '-is_day_off')
        return render_attendance_page(request, attendance)
    except ObjectDoesNotExist:
        print("object does not exist", public_id)


def open_edit_page(request):
    get_request = request.GET
    public_id = get_request.get('public_id')
    try:
        employee = Employee.objects.get(public_id=public_id)
        return render_edit_info_page(request, employee)
    except ObjectDoesNotExist:
        print("object does not exist", public_id)
