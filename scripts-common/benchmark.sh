#!/bin/bash

rm -f console.log

(
echo "Run benchmarks..."

./install.sh

# adapt to your own settings

target_host=`hostname -s`
uname_long=`uname -a`

if [ $target_host == "jhillers-MBP" ] ; then
  JVMS="
/Library/Java/JavaVirtualMachines/1.6.0_37-b06-434.jdk/Contents/Home \
/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home \
/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home"
    
elif [ $target_host == "raspberrypi" ] ; then
  # assume that the JavaVMs are installed ./JavaVMs-Installed
  __cwd=`pwd`
  JVMS="
/usr/lib/jvm/jdk-8-oracle-arm-vfp-hflt \
$__cwd/JavaVMs-Installed/ejdk-8u33-fcs-linux-arm-sflt-jre-full \
$__cwd/JavaVMs-Installed/ejre-7u75-fcs-b13-linux-arm-vfp-hflt-server_headless-18_dec_2014 \
/usr/lib/jvm/java-7-openjdk-armhf \
/usr/lib/jvm/java-1.5.0-gcj-4.7 \
/usr/lib/jvm/java-6-openjdk-armhf"

# special notation for string contains string when running in busybox
elif [ -z "${uname_long##*-WR4.3.0.0*}" ] ; then
  # assume that the JavaVMs are installed ./JavaVMs-Installed
  __cwd=`pwd`
  JVMS="
/usr/lib/javaSE \
$__cwd/JavaVMs-Installed/ejdk-8u33-fcs-linux-arm-sflt-jre-full \
$__cwd/JavaVMs-Installed/ejre-7u75-fcs-b13-linux-arm-vfp-sflt-client_headless-18_dec_2014"

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
