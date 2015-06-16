# Setup of JavaVMs

## JavaSE Embedded 7 / 8

Get one or more JavaSE Embedded 7 or 8 versions from http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html. This needs license agreement and login to Oracle Network. Copy the archive file(s) to a folder named `./JavaVMs`.

If you want to install the Unlimited JCE Policies, download them also from 
* `UnlimitedJCEPolicyJDK7.zip`: http://www.oracle.com/technetwork/java/javase/downloads/jce-7-download-432124.html
* `jce_policy-8.zip`: http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html
and put them into `./JavaVMs` folder.
* If you want to increase installation time on host, you can generate JavaSE Embedded 8 jre-full version and put that as tar.gz file into `./JavaVMs` folder

Copy the folder `./JavaVMs` to you target platform, e.g. Raspberry Pi.

```
scp JavaVMs/* pi@<ip>:/home/pi/jvm-perftest/JavaVMs
```

## Install on target platform

There is a helper script to install all JavaVM in folder `./JavaVMs` on target platform. Set `JAVA_HOME` to an existing installation of JavaSE 7 or 8 (will be needed to create jre-full profile).

Sample for Raspberry Pi:

```
export JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-arm-vfp-hflt
curl -s -o install-jvms.sh https://raw.githubusercontent.com/JochenHiller/jvm-perftests/master/scripts-common/install-jvms.sh
chmod u+x *.sh
./install-jvms.sh
```

For JavaSE Embedded 7 the archive file will simply be unpacked.
For JavaSE Embedded 8 and a pre-installed version the archive file will simply be unpacked.
For JavaSE Embedded 8 the archive file will be unpacked. The jrecreate.sh will be used to create a full-jre profile. The install folder will be the name of the VM extended by `-jre-full`.
If ZIP files present, the Unlimited JCE Policies will be installed into `../lib/security` and will replace the original ones.

## JavaVMs supported on Raspberry Pi

These JavaVMs are successfully running on Raspberry Pi. Soft-Floating versions are NOT supported due to missing OS support. See also https://community.oracle.com/thread/2473836.
You can use pre-installed versions of jre-full version to minimize installation time on embedded device.


```
ejdk-8u33-fcs-linux-armv6-vfp-hflt-jre-full.gz
jdk-8u33-linux-arm-vfp-hflt.gz
ejre-7u75-fcs-b13-linux-arm-vfp-hflt-client_headless-18_dec_2014.gz
ejre-7u75-fcs-b13-linux-arm-vfp-hflt-server_headless-18_dec_2014.gz
```

## Use in benchmark tests

You can adapt the benchmark.sh to include all JVMs you want to test.


## References

* http://stackoverflow.com/questions/19856324/exception-in-thread-main-java-security-invalidkeyexception-illegal-key-size-o
* http://www.oracle.com/technetwork/java/javase/downloads/jce-7-download-432124.html
* http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html
