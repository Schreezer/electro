from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import EmailValidator

class User(AbstractUser):
    email = models.EmailField(unique=True, validators=[EmailValidator])
    otp = models.CharField(max_length=6, blank=True, null=True)