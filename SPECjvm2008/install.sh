#!/bin/bash

echo "Installing SPECjvm2008..."

curl -s -o SPECjvm2008_1_01_setup.jar http://spec.cs.miami.edu/downloads/osg/java/SPECjvm2008_1_01_setup.jar
export SPECJVM_HOME=`pwd`/specjvm2008
java -jar SPECjvm2008_1_01_setup.jar -DUSER_INSTALL_DIR=$SPECJVM_HOME -i silent
# fix wrong script file
dos2unix $SPECJVM_HOME/report.sh
# make a trial run
cd specjvm2008
java -jar SPECjvm2008.jar -wt 5s -it 5s -bt 2 compress
cd ..
