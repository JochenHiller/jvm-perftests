# Setup of JavaVMs

## JavaSE Embedded 7

Get a JavaSE 7 Embedded version from http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html?ssSourceSiteId=ocomen#javase7update

This needs license agreement and login to Oracle Network.


```
# assume file is available
ls -l ejre-7u75-fcs-b13-linux-arm-vfp-hflt-client_headless-18_dec_2014.tar.gz
tar xvzf ejre-7u75-fcs-b13-linux-arm-vfp-hflt-client_headless-18_dec_2014.tar.gz
```




zcat ejdk-8u33-fcs-linux-arm-sflt.gz | tar xvf -


pi@raspberrypi ~ $ ls -l JavaSE-7-Embedded/
total 196504
-rw-r--r-- 1 pi pi 33545828 Apr 27 17:54 ejre-7u75-fcs-b13-linux-arm-sflt-headless-18_dec_2014.gz
-rw-r--r-- 1 pi pi 33172551 Apr 27 17:53 ejre-7u75-fcs-b13-linux-arm-vfp-hflt-client_headless-18_dec_2014.gz
-rw-r--r-- 1 pi pi 33883100 Apr 27 17:54 ejre-7u75-fcs-b13-linux-arm-vfp-hflt-server_headless-18_dec_2014.gz
-rw-r--r-- 1 pi pi 33329110 Apr 27 17:54 ejre-7u75-fcs-b13-linux-arm-vfp-sflt-client_headless-18_dec_2014.gz
-rw-r--r-- 1 pi pi 34003310 Apr 27 17:54 ejre-7u75-fcs-b13-linux-arm-vfp-sflt-server_headless-18_dec_2014.gz
-rw-r--r-- 1 pi pi 33272151 Apr 27 17:54 ejre-7u75-fcs-b13-linux-i586-headless-18_dec_2014.gz
pi@raspberrypi ~ $ ls -l JavaSE--Embedded/
ls: cannot access JavaSE--Embedded/: No such file or directory
pi@raspberrypi ~ $ ls -l JavaSE-8-Embedded/
total 424556
-rw-r--r-- 1 pi pi 105920513 Apr  1 07:28 ejdk-8u33-fcs-linux-arm-sflt.gz
-rw-r--r-- 1 pi pi 118402897 Apr 27 17:51 ejdk-8u33-fcs-linux-armv6-vfp-hflt.gz
-rw-r--r-- 1 pi pi 119614825 Apr 27 17:55 ejdk-8u33-fcs-linux-i586.gz
drwxr-xr-x 6 pi pi      4096 Jan 20 18:07 ejdk1.8.0_33
-rw-r--r-- 1 pi pi  10386354 Feb  2 11:35 jdk-8u33-linux-arm-vfp-hflt-demos.gz
-rw-r--r-- 1 pi pi  80392759 Apr  1 07:28 jdk-8u33-linux-arm-vfp-hflt.gz
pi@raspberrypi ~ $


export JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-arm-vfp-hflt


bin/jrecreate.sh --dest xxx --vm all --extension sunpkcs11,gcf,locales,charsets,nashorn,sunec


bin/jrecreate.sh --dest jre-full --vm all --extension sunpkcs11,gcf,locales,charsets,nashorn,sunec
Building JRE using Options {
    ejdk-home: /home/pi/JavaSE-8-Embedded/ejdk1.8.0_33-linux-arm-sflt
    dest: /home/pi/JavaSE-8-Embedded/ejdk1.8.0_33-linux-arm-sflt/jre-full
    target: linux_arm_sflt
    vm: all
    runtime: jre
    debug: false
    keep-debug-info: false
    no-compression: false
    dry-run: false
    verbose: false
    extension: [sunpkcs11, sunec, locales, charsets, nashorn, gcf]
}

Target JRE Size is 50,108 KB (on disk usage may be greater).
Embedded JRE created successfully


