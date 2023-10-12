# Use the official Python image as the base image
FROM python:3.9

# Set environment variables for Django
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory to /app
WORKDIR /app

# Install dependencies
RUN pip install asgiref==3.3.1 Django==3.1.14 pytz==2020.5 sqlparse==0.4.4 gunicorn

# Copy the current directory contents into the container at /app
COPY . /app/

# Run Django management commands (makemigrations, migrate, createsuperuser)
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('varshas', 'varsha.s8755@gmail.com', 'varsha.s8755@gmail.com')" | python manage.py shell



# Expose the port Gunicorn will run on
EXPOSE 5000

# Define the command to start Gunicorn
CMD gunicorn your_project.wsgi:application --bind 0.0.0.0:5000
