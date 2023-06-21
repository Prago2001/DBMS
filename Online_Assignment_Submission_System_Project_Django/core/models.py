from django.db import models
from django.db.models.deletion import CASCADE
from authentication.models import User
from django.utils import timezone


class Course(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    course_name = models.CharField(max_length=100)
    course_image = models.ImageField(upload_to='media')
    teacher_name = models.CharField(max_length=50)
    teacher_details = models.TextField()
    course_description = models.TextField()
    created_at = models.DateField(default=timezone.now)
    end_date = models.CharField(max_length=20)
    class Meta:
        ordering = ['id']

    def __str__(self):
        return self.course_name


class Assignment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    course_name = models.ForeignKey(Course,on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    content = models.TextField()
    marks = models.CharField(max_length=20)
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.title


# class Exam(models.Model):
#     user = models.ForeignKey(User, on_delete=models.CASCADE)
#     title = models.CharField(max_length=100)
#     content = models.TextField()
#     marks = models.CharField(max_length=20)
#     duration = models.CharField(max_length=100)
#     created_at = models.DateTimeField(default=timezone.now())

#     def __str__(self):
#         return self.title


class AssignmentSubmission(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.ForeignKey(Assignment,on_delete=models.CASCADE)
    course_name = models.ForeignKey(Course,on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    university_id = models.CharField(max_length=100)
    content = models.TextField(null=True, blank=True)
    file = models.FileField(upload_to="media",null=True, blank=True)
    marksObtained = models.IntegerField(null=True,blank=True)

    def __str__(self):
        return self.university_id


# class ExamSubmission(models.Model):
#     user = models.ForeignKey(User, on_delete=models.CASCADE)
#     name = models.CharField(max_length=100)
#     university_id = models.CharField(max_length=100)
#     content = models.TextField(null=True, blank=True)
#     file = models.FileField(null=True, blank=True)

#     def __str__(self):
#         return self.university_id
