
tagname = 10.4-5.1.6
docker_user = leoheck
docker_img = leoheck/kicad_auto

donwload_packages:
	./download.sh

build_release:
	docker build -f Dockerfile -t $(docker_img):$(tagname) .
	docker build -f Dockerfile -t $(docker_img):latest .

upload_image:
	docker login --username=$(docker_user)
	docker push $(docker_img):$(tagname)
	docker push $(docker_img):latest

# If docker is not installer int the host system
install_docker:
	sudo apt install docker.io
	sudo systemctl enable --now docker
	sudo usermod -aG docker $(USER)

clean:
	@ rm -rf *.deb
