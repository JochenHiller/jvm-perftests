# Setup of JavaVMs

## JavaSE Embedded 7 / 8

Get one or more JavaSE Embedded 7 or 8 versions from http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html. This needs license agreement and login to Oracle Network. Copy the archive file(s) to a folder named "./JavaVMs".

Copy the folder ./JavaVMs to you target platform, e.g. Raspberry Pi.

```
scp JavaVMs/* pi@192.168.0.84:/home/pi/jvm-perftest/JavaVMs
```

## Install on target platform

There is a helper script to install all JavaVM in folder ./JavaVMs on target platform.

```
curl -s -o install-jvms.sh https://raw.githubusercontent.com/JochenHiller/jvm-perftests/master/scripts-common/install-jvms.sh
chmod u+x *.sh
```

For JavaSE Embedded 7 it will simply be unpacked.
For JavaSE Embedded 8 it will use jrecreate.sh to create a full-jre profile. The install folder will be the name of the VM extended by "-jre-full".

## Use in benchmark tests

You can adapt the benchmark.sh to include all JVMs you want to test.
