
tagname = 10.4-5.1.6
docker_user = leoheck
docker_img = $(docker_user)/kicad_auto

all: build_release upload_image

donwload_packages:
	./download.sh

build_release:
	docker build -f Dockerfile -t $(docker_img):$(tagname) .
	# docker build -f Dockerfile -t $(docker_img):latest .

upload_image:
	docker login --username=$(docker_user)
	docker push $(docker_img):$(tagname)
	# docker push $(docker_img):latest

run:
	docker run -a stdin -a stdout -i -t $(docker_img):$(tagname) /bin/bash

# If docker is not installed in the host system
install_docker:
	sudo apt install docker.io
	sudo systemctl enable --now docker
	sudo usermod -aG docker $(USER)

# Remove dockes to claim computer space
# It is good to rebuild the image from scratch
remove_all_images:
	docker system prune -a

clean:
	@ rm -rf *.deb
