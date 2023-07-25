from django.contrib import admin

from .models import EmailCapture


# Register your models here.
@admin.register(EmailCapture)
class AdminEmailCapture(admin.ModelAdmin):
    pass
