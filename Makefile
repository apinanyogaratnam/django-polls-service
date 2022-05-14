IMAGE := django-polls-service

start:
	python3 manage.py runserver

build:
	docker build -t ${IMAGE} .
