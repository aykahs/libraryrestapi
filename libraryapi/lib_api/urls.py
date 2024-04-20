from . import views
from django.urls import path
from rest_framework_simplejwt import views as jwt_views
from .views import MyCustomTokenObtainPairView
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
urlpatterns = [
        # path('token', TokenObtainPairView.as_view(), name='token_obtain_pair'),
        # path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
        path('token', MyCustomTokenObtainPairView.as_view(), name='token_obtain_pair'),
        path('config/store', views.storeConfig),
        path('books', views.allBooks),
        path('books/create', views.BookStore),
        path('books/update/<str:pk>', views.BookUpdate),
        path('config/all', views.allConfig),
        path('config/update/<str:pk>', views.updateConfig),
        path('student/register', views.userRegister),
        path('student/book', views.userBooks),
        path('student-requested-books/<str:pk>', views.userRequestedBook),
        path('all-requested-books', views.requestedBooks),
        path('student-requested-book-calculation/<str:pk>', views.UserrequestedBookCalculation),
        path('student-return-books/<str:pk>', views.userReturnBooks)


        
        


]