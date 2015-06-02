#!/bin/bash

# this script will install all JavaVMs in folder ./JavaVMs

rm -f console.log

(
echo "Installing JavaVMs..."
echo "Assuming all downloaded files at ./JavaVMs, install into ./JavaVMs-Installed"

if [ -z $JAVA_HOME ] ; then
  echo "Set JAVA_HOME first to create JavaSE 8 profiles!"
  exit 1
fi


ls -al JavaVMs
mkdir -p JavaVMs-Installed
cd JavaVMs-Installed

for jvm in ../JavaVMs/*.gz ; do
  full_jre_name=`echo -n $jvm | sed -e 's/^.*\///g' | sed -e 's/\.gz//g'`
  # echo $full_jre_name
  ZCAT_COMMAND=zcat
  if [ `uname` == Darwin ] ; then ZCAT_COMMAND=gzcat ; fi
  $ZCAT_COMMAND $jvm | tar xf -
  echo " "
  echo " "
  echo "Installed JavaVMs-Installed/$full_jre_name"
  # rename default folder to specific VM name, do that for ejre, ejdk, jdk
  if [ -d ej??1.?.?_?? ] ; then
    mv ej??1.?.?_?? $full_jre_name
  fi
  if [ -d jdk1.?.?_?? ] ; then
    mv jdk1.?.?_?? $full_jre_name
  fi
  
  # for JavaSE Embedded 7
  if [ -f ../JavaVMs-Installed/$full_jre_name/bin/java ] ; then
    # install Unlimited JCE policies of zip is available
    if [ -f ../JavaVMs/UnlimitedJCEPolicyJDK7.zip ] ; then
      # unzip into lib/security, only jar files
      echo "Using UnlimitedJCEPolicies from ./JavaVMsUnlimitedJCEPolicyJDK7 ..."
      unzip -o -d ../JavaVMs-Installed/$full_jre_name-jre-full/lib/security -j \
        ../JavaVMs/UnlimitedJCEPolicyJDK7.zip  *.jar
    fi
    echo "Checking Java version: "
    ../JavaVMs-Installed/$full_jre_name/bin/java -version
    rc=$?
    if [ $rc != 0 ] ; then
      echo "An error like ./java: error while loading shared libraries: libjli.so: ... indicates that you have wrong VM used here"
      echo "See also https://community.oracle.com/thread/2473836"
      echo "An error like ./java: /lib/ld-linux-armhf.so.3: bad ELF interpreter: No such file or directory ... indicates that you have wrong VM used here"
      echo "An error like  Server VM is only supported on ARMv7+ VFP ... indicates that server option is not supported on your platform"
      echo "An error like ./java: can not execute binary ... indicates that you are running on wrong platform"
    fi
  fi
  
  # for JavaSE Embedded 8
  # create a JRE full, with all extensions
  if [ -f ../JavaVMs-Installed/$full_jre_name/bin/jrecreate.sh ] ; then
    echo "JavaSE-8-Embedded: Creating full-jre profile..."
    # with debugging, verbose whats happening
    # add --verbose if more info needed
    ../JavaVMs-Installed/$full_jre_name/bin/jrecreate.sh \
      --vm all --debug \
      --extension sunpkcs11,gcf,locales,charsets,nashorn,sunec \
      --dest ../JavaVMs-Installed/$full_jre_name-jre-full
    # install Unlimited JCE policies of zip is available
    if [ -f ../JavaVMs/jce_policy-8.zip ] ; then
      # unzip into lib/security, only jar files
      echo "Using UnlimitedJCEPolicies from ./JavaVMs/jce_policy-8.zip ..."
      unzip -o -d ../JavaVMs-Installed/$full_jre_name-jre-full/lib/security -j \
        ../JavaVMs/jce_policy-8.zip  *.jar
    fi
    echo "Checking Java version: "
    ../JavaVMs-Installed/$full_jre_name-jre-full/bin/java -version
    rc=$?
    if [ $rc != 0 ] ; then
      echo "An error like ./java: error while loading shared libraries: libjli.so: ... indicates that you have wrong VM used here"
      echo "See also https://community.oracle.com/thread/2473836"
      echo "An error like ./java: /lib/ld-linux-armhf.so.3: bad ELF interpreter: No such file or directory ... indicates that you have wrong VM used here"
      echo "An error like  Server VM is only supported on ARMv7+ VFP ... indicates that server option is not supported on your platform"
      echo "An error like ./java: can not execute binary ... indicates that you are running on wrong platform"
    fi
  fi

done

cd ..
ls -al JavaVMs-Installed


) 2>&1 | tee console.log
