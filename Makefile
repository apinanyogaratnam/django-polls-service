IMAGE := django-polls-service
REMOTE_IMAGE := ghcr.io/apinanyogaratnam/django-polls-service
TAG_VERSION := 0.0.1

start:
	python3 manage.py runserver

build:
	docker build -t ${IMAGE} .

run:
	docker run -p 8000:8000 ${IMAGE}

open:
	open http://localhost:8000/polls

auth:
	grep -v '^#' .env.local | grep -e "CR_PAT" | sed -e 's/.*=//' | docker login ghcr.io -u USERNAME --password-stdin

tag:
	docker tag ${IMAGE} ${REMOTE_IMAGE}:${TAG_VERSION}
	git tag -m 'v${TAG_VERSION}' v${TAG_VERSION}

push:
	docker push ${REMOTE_IMAGE}:${TAG_VERSION}
	git push --tags
