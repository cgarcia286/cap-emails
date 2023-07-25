from django.contrib.auth import get_user_model
from django.db import models

User = get_user_model()


# Create your models here.
class EmailCapture(models.Model):
    user = models.ForeignKey(
        User,
        blank=True,
        null=True,
        on_delete=models.SET_NULL
    )
    email = models.EmailField()
    timestamp = models.DateTimeField(auto_now_add=True)
    # verified = models.BooleanField(default=False)
    # updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.email
