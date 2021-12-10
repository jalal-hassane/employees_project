from django.core.exceptions import ValidationError
from django.db import models


def only_int(value):
    if not value.isdigit():
        raise ValidationError('Oops. We only accept digits here')


# Create your models here.
class Employee(models.Model):
    public_id = models.CharField(max_length=30, primary_key=True)
    username = models.CharField(max_length=30, default="")
    password = models.CharField(max_length=30, default="")
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=30)
    phone_number = models.CharField(max_length=8, validators=[only_int])
    title = models.CharField(max_length=30)
    department = models.CharField(max_length=30)
    # below fields are managed by the administrator
    vacation_days = models.IntegerField(default=0)
    is_full_time_employee = models.BooleanField(default=True)
    hour_rate = models.DecimalField(default=0.0, max_digits=4, decimal_places=2)


class Attendance(models.Model):
    date = models.DateField(default=None)
    employee_public_id = models.ForeignKey(Employee, on_delete=models.CASCADE)
    check_in_time = models.TimeField(default=None, null=True)
    check_out_time = models.TimeField(default=None, null=True)
    # this is the difference between check_in_time and check_out_time
    attendance = models.DecimalField(default=0.0, max_digits=12, decimal_places=2)
    is_day_off = models.BooleanField(default=False)
