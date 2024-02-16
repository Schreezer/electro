import pyotp
from django.core.mail import send_mail
from django.conf import settings

def generate_otp():
    return pyotp.random_base32()

def send_otp_via_email(otp, email):
    subject = 'Your OTP for verification'
    message = f'Your OTP is: {otp}'
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [email]
    send_mail(subject, message, email_from, recipient_list)