# Generated by Django 3.2.9 on 2021-12-06 14:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employees', '0010_alter_employee_hour_rate'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attendance',
            name='attendance',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=2),
        ),
    ]
