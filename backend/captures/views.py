from rest_framework.generics import CreateAPIView

from .models import EmailCapture
from .serializers import EmailCaptureSerializer


# Create your views here.
class EmailCaptureCreateAPIView(CreateAPIView):
    queryset = EmailCapture.objects.all()
    serializer_class = EmailCaptureSerializer

    def perform_create(self, serializer):
        user = self.request.user if self.request.user.is_authenticated else None
        serializer.save(user=user)
