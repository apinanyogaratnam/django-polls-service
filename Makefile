IMAGE := django-polls-service

start:
	python3 manage.py runserver

build:
	docker build -t ${IMAGE} .

run:
	docker run -p 8000:8000 ${IMAGE}

open:
	open http://localhost:8000/polls
