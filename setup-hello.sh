#!/bin/bash -e
#Assuming ~/omnetpp-summit-hackathon-2018 repo directory and ~/omnetpp-5.3-src-linux.tgz are in home directory 
cd
tar -xzvf omnetpp-5.3-src-linux.tgz
cd omnetpp-5.3
apt-get -y install build-essential gcc g++ bison flex perl qt5-default tcl-dev tk-dev libxml2-dev zlib1g-dev default-jre doxygen graphviz libwebkitgtk-3.0-0
apt-get -y install libopenscenegraph-dev openscenegraph-plugin-osgearth libosgearth-dev
apt-get -y install openmpi-bin libopenmpi-dev
apt-get -y install openscenegraph libopenscenegraph-dev openscenegraph-plugin-osgearth libosgearth-dev
apt-get -y install xinit
#the configure script invokes a tool 'wish' that expects valid $DISPLAY
nohup xinit &
export DISPLAY=:0.0
sleep 10
./configure
export PATH=~/omnetpp-5.3/bin:$PATH
make

cd ~/omnetpp-summit-hackathon-2018/hello/
make
./hello -u Cmdenv -G

#omnetpp
