#!/bin/bash

rm -f console.log

(
echo "Run benchmarks..."

./install.sh

# adapt to your own settings

target_host=`hostname -s`
if [ $target_host == "jhillers-MBP" ] ; then
  JVMS="
/Library/Java/JavaVirtualMachines/1.6.0_37-b06-434.jdk/Contents/Home \
/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home \
/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home"
    
elif [ $target_host == "raspberrypi" ] ; then
  JVMS="
/usr/lib/jvm/jdk-8-oracle-arm-vfp-hflt \
/usr/lib/jvm/java-7-openjdk-armhf \
/usr/lib/jvm/java-1.5.0-gcj-4.7 \
/usr/lib/jvm/java-6-openjdk-armhf"
else
  echo "Define your configuration first here"
  JVMS=""
fi

for jvm in $JVMS ; do
  export JAVA_HOME=$jvm
  if [ -f $JAVA_HOME/bin/java ] ; then
    ./run.sh
  else
    echo "Could not find $JAVA_HOME/bin/java, skipping..."
  fi
done

) 2>&1 | tee console.log
