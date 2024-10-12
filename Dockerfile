FROM python:3

WORKDIR /data

RUN pip install django==3.2

COPY . .
# Adding a delay to wait for database to be ready (optional)
RUN python -c "import time; time.sleep(10)"

RUN python manage.py migrate

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:8000"]


