from setsoft/kicad_auto:latest

maintainer Leandro Heck <leoheck@gmail.com>
label Description="Kicad automations tools"

# For add-apt-repository
run apt-get update

run apt-get install -y apt-transport-https
run apt-get install -y ca-certificates
run apt-get install -y gnupg-agent
run apt-get install -y software-properties-common
run apt-get install -y apt-utils

# Test to see if the latest git versions helps to
# make actions/checkout@v2 from GitHub work with private submodules
#run add-apt-repository -y ppa:git-core/ppa
#run apt-get -y update

run apt-get install -y --no-install-recommends git
run apt-get install -y --no-install-recommends ssh
run apt-get install -y --no-install-recommends tar
run apt-get install -y --no-install-recommends wget
run apt-get install -y --no-install-recommends curl

run apt-get install -y --no-install-recommends m4
run apt-get install -y --no-install-recommends rsync
run apt-get install -y --no-install-recommends mercurial
run apt-get install -y --no-install-recommends darcs
run apt-get install -y --no-install-recommends opam
run apt-get install -y --no-install-recommends pkg-config
run apt-get install -y --no-install-recommends libgmp-dev
run apt-get install -y --no-install-recommends libpcre3-dev

run apt-get install -y --no-install-recommends perl
run apt-get install -y --no-install-recommends lsb-release
run apt-get install -y --no-install-recommends python3-tk

#=======================================
# jnavila/PlotKicadSch
#=======================================

# STABLE VERSION
# run opam init -c 4.09.0 --disable-sandboxing -a && \
# 	opam switch 4.09.0 && \
# 	eval $(opam config env) && \
# 	opam update && \
# 	opam install -y plotkicadsch

# GITHUB VERSION
run git clone https://github.com/jnavila/plotkicadsch.git && \
	cd plotkicadsch && \
	opam init -c 4.09.0 --disable-sandboxing -a && \
	opam switch 4.09.0 && \
	eval $(opam config env) && \
	opam pin add -y kicadsch . && \
	opam pin add -y plotkicadsch . && \
	opam update -y && \
	opam install -y plotkicadsch

run ln -sf /root/.opam/4.09.0/bin/plotgitsch /usr/local/bin/plotgitsch

#=======================================
# Gasman2014/KiCad-Diff
#=======================================

# run git clone https://github.com/leoheck/KiCad-Diff
run git clone https://github.com/Gasman2014/KiCad-Diff
run cp -f KiCad-Diff/*.py /usr/local/bin

#=======================================
# INTI-CMNB/kicad-automation-scripts
#=======================================

# Test this new branch with DRC/ERC filter
# This is going to be added to Kiplot later by set-soft

run git clone https://github.com/INTI-CMNB/kicad-automation-scripts.git kicad-automation-scripts && \
	cd ./kicad-automation-scripts && \
    git checkout drc_errors

run ln -sf ./kicad-automation-scripts/src/pcbnew_do /usr/local/bin/pcbnew_do
run ln -sf ./kicad-automation-scripts/src/eeschema_do /usr/local/bin/eeschema_do

#=======================================

run apt-get -y autoremove
run rm -rf /var/lib/apt/lists/*
