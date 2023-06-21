from django.urls import path
from .views import (
HomeView,
CourseView,
CourseCreateView,
course_single,
AssignmentCreateView,
AssignmentView,
AssignmentDeleteView,
AssignmentSubmissionView,
AssignmentSubmissionListView,
AssignmentSubmissionDelete,
AssSubmissionEnterMarks
)
from django.conf import settings
from django.conf.urls.static import static

app_name = "core"

urlpatterns = [
                  path('', HomeView.as_view(), name='home'),
                  path('course/', CourseView.as_view(), name='course'),
                  path('course-create/', CourseCreateView.as_view(), name='course-create'),
                  path('assignment-create/', AssignmentCreateView.as_view(), name='assignment-create'),
                  path('assignment/', AssignmentView.as_view(), name='assignment-list'),
                  path('<pk>/delete/', AssignmentDeleteView.as_view(), name='delete-assignment'),
                  path('<int:id>/course-view/', course_single, name='course-view'),
                  path('assignment-submission/', AssignmentSubmissionView.as_view(), name='assignment-submission'),
                  path('assignment-submission-list', AssignmentSubmissionListView.as_view(), name='assignment-submission-list'),
                  path('<pk>/delete/', AssignmentSubmissionDelete.as_view(), name='assignment-submission-delete'),
                  path('assignment-submission-list/<pk>',AssSubmissionEnterMarks.as_view(),name="enter-mark")
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
