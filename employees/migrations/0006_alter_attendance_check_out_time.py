# Generated by Django 3.2.9 on 2021-12-06 13:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employees', '0005_auto_20211206_1552'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attendance',
            name='check_out_time',
            field=models.TimeField(default=None, null=True),
        ),
    ]
