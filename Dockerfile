FROM setsoft/kicad_debian:latest
MAINTAINER Leandro Heck <leoheck@gmail.com>
LABEL Description="KiCad with KiPlot and other automation scripts"

COPY *.deb /

RUN	apt-get update
RUN	apt-get -y install --no-install-recommends make
RUN	apt-get -y install --no-install-recommends git
RUN	apt-get -y install --no-install-recommends ssh
RUN	apt-get -y install --no-install-recommends tar
RUN	apt-get -y install --no-install-recommends wget
RUN	apt-get -y install --no-install-recommends ca-certificates
RUN	apt -y install --no-install-recommends ./*.deb
RUN	apt-get -y autoremove
RUN	rm /*.deb
RUN	rm -rf /var/lib/apt/lists/*
