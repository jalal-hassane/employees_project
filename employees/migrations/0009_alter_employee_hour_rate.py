# Generated by Django 3.2.9 on 2021-12-06 14:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employees', '0008_auto_20211206_1642'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employee',
            name='hour_rate',
            field=models.DecimalField(decimal_places=0, default=0.0, max_digits=2),
        ),
    ]
