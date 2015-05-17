#!/bin/bash

rm -f console.log

(
echo "Run SPECjvm2008 benchmarks..."

./install.sh

# adapt to your own settings

target_host=`hostname -s`
if [ $target_host == "jhillers-MBP" ] ; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_37-b06-434.jdk/Contents/Home
  ./run.sh
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/dk1.7.0_51.jdk/Contents/Home
  ./run.sh
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
  ./run.sh
elif [ $target_host == "raspberrypi" ] ; then
  export JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-arm-vfp-hflt
  ./run.sh
  export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-armhf
  ./run.sh
  export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-armhf
  ./run.sh
  export JAVA_HOME=/usr/lib/jvm/java-1.5.0-gcj-4.7
  ./run.sh
else
  echo "Define your configuration first here"
fi

) 2>&1 | tee console.log
