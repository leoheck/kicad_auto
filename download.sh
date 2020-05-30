#!/bin/bash

donwload_release()
{
	release_url=$1
	curl \
		-s $release_url | \
		grep "browser_download_url.*deb" | \
		cut -d : -f 2,3 | \
		tr -d \" | \
		wget -i -
}

rm -f *.deb

donwload_release https://api.github.com/repos/INTI-CMNB/kicad-automation-scripts/releases/latest 
donwload_release https://api.github.com/repos/INTI-CMNB/InteractiveHtmlBom/releases/latest 
donwload_release https://api.github.com/repos/INTI-CMNB/kiplot/releases/latest 
donwload_release https://api.github.com/repos/INTI-CMNB/KiBoM/releases/latest 
