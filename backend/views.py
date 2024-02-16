from rest_framework.views import APIView
from rest_framework.response import Response
from django.utils import timezone
from datetime import timedelta
from .models import User
from .utils import generate_otp, send_otp_via_email

class RequestOTP(APIView):
    def post(self, request):
        email = request.data.get('email')
        user, created = User.objects.get_or_create(email=email)
        otp = generate_otp()
        user.otp = otp
        user.otp_created = timezone.now()
        user.save()
        send_otp_via_email(otp, email)
        return Response({'message': 'OTP sent to email.'})

class VerifyOTP(APIView):
    def post(self, request):
        email = request.data.get('email')
        otp = request.data.get('otp')
        try:
            user = User.objects.get(email=email)
            if timezone.now() > user.otp_created + timedelta(minutes=5):
                return Response({'error': 'OTP has expired.'})
            if user.otp == otp:
                user.otp = None
                user.save()
                return Response({'message': 'OTP verified successfully.'})
            else:
                return Response({'error': 'Invalid OTP.'})
        except User.DoesNotExist:
            return Response({'error': 'User not found.'})
