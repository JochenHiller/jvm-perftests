#!/bin/bash

echo "Installing SPECjvm2008..."


# on some devices the SPECjvm2008 tests can NOT be installed on device
# so install on another host
if [ -f specjvm2008.tar.gz ] ; then
  echo "Unpacking pre-installed version of SPECjvm2008..."
  zcat specjvm2008.tar.gz | tar xvf -
  exit 1


else 

  if [ -z $JAVA_HOME ] ; then
    echo "Set JAVA_HOME first to unpack SPECjvm2008!"
    exit 1
  fi

  # check if curl can be called, some embedded systems only use wget
  curl 2>/dev/null
  rc=$?
  if [ $rc -eq 2 ] ; then
    curl -s -o SPECjvm2008_1_01_setup.jar http://spec.cs.miami.edu/downloads/osg/java/SPECjvm2008_1_01_setup.jar
  else
    wget --no-check-certificate --quiet -O SPECjvm2008_1_01_setup.jar http://spec.cs.miami.edu/downloads/osg/java/SPECjvm2008_1_01_setup.jar
  fi

  export SPECJVM_HOME=`pwd`/specjvm2008
  $JAVA_HOME/bin/java -jar SPECjvm2008_1_01_setup.jar -DUSER_INSTALL_DIR=$SPECJVM_HOME -i silent
  # fix wrong script file
  dos2unix $SPECJVM_HOME/report.sh
  
fi

# make a trial run
cd specjvm2008
$JAVA_HOME/bin/java -jar SPECjvm2008.jar -wt 5s -it 5s -bt 2 compress
cd ..
