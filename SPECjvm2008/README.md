# SPECjvm2008

## Results

These results have been measured until now.

| Date/User | OS/JavaVM | ops/m | Results |
| --------- | --------- | ----- | ------- |
| 2015-05-17/jochenhiller | mac-javase8-u45-64bit-server | 212.5 ops/m | [./results/mac-javase8-u45-64bit-server](./results/mac-javase8-u45-64bit-server) |
| 2015-05-18/jochenhiller | linux-jdk-8-oracle-arm-vfp-hflt-32bit-client | 6.64 ops/m | [./results/raspi2-linux-jdk-8-oracle-arm-vfp-hflt-32bit-client](./results/raspi2-linux-jdk-8-oracle-arm-vfp-hflt-32bit-client) |

## Run the tests

Download scripts to install and run the tests on your target platform.

```
curl -s -o install.sh https://raw.githubusercontent.com/JochenHiller/jvm-perftests/master/SPECjvm2008/install.sh
curl -s -o run.sh https://raw.githubusercontent.com/JochenHiller/jvm-perftests/master/SPECjvm2008/run.sh
curl -s -o benchmark.sh https://raw.githubusercontent.com/JochenHiller/jvm-perftests/master/scripts-common/benchmark.sh
chmod u+x *.sh
# adapt benchmark.sh to your environment, then run the benchmarks
# adapt means:
#   set JAVA_HOME
#   adapt memory settings, number of runs
./benchmark.sh
# see results at ./specjvm2008/results
```

## Details 

### Installation

SPECjvm2008 can be downloaded from http://spec.org/jvm2008. It has to be installed on target platform and can run then the benchmarks.

Script to install the benchmark suite: [./install.sh](./install.sh)
```
curl -s -o SPECjvm2008_1_01_setup.jar http://spec.cs.miami.edu/downloads/osg/java/SPECjvm2008_1_01_setup.jar
export SPECJVM_HOME=`pwd`/specjvm2008
java -jar SPECjvm2008_1_01_setup.jar -DUSER_INSTALL_DIR=$SPECJVM_HOME -i silent
# fix wrong script file
dos2unix $SPECJVM_HOME/report.sh
# make a trial run
cd specjvm2008
java -jar SPECjvm2008.jar -wt 5s -it 5s -bt 2 compress
cd ..
```

### Running benchmark

As of now, the SPECjvm2008 benchmarks "startup.compiler.sunflow,compiler.sunflow" are NOT running wth JavaSE 8. See https://groups.google.com/forum/#!topic/adopt-openjdk/VOHTJTMfGWM.

So these tests "startup.compiler.sunflow,compiler.sunflow" have to be taken out of all benchmark suite when testing JavaSE 8.

Note:
* Running the benchmark from another folder than installation folder did *NOT* work as described in http://spec.org/jvm2008/docs/FAQ.html#Q3.6
* Putting the results in another folder did *NOT* work as described in http://spec.org/jvm2008/docs/UserGuide.html#RunningTheBenchmark
* "derby" test needs on Raspberry Pi at least 400m heap memory (-Xmx400m)
* "scimark.fft.large" test needs on Raspberry Pi at least 600m heap memory (-Xmx600m)

Script to run one benchmark: [./run.sh](./run.sh)
```
cd specjvm2008
# runs ALL tests
# java -jar SPECjvm2008.jar
# run only tests for JavaSE 8
java -Xmx600m -jar SPECjvm2008.jar startup.helloworld startup.compiler.compiler  startup.compress startup.crypto.aes startup.crypto.rsa startup.crypto.signverify startup.mpegaudio startup.scimark.fft startup.scimark.lu startup.scimark.monte_carlo startup.scimark.sor startup.scimark.sparse startup.serial startup.sunflow startup.xml.transform startup.xml.validation compiler.compiler compress crypto.aes crypto.rsa crypto.signverify derby mpegaudio scimark.fft.large scimark.lu.large scimark.sor.large scimark.sparse.large scimark.fft.small scimark.lu.small scimark.sor.small scimark.sparse.small scimark.monte_carlo serial sunflow xml.transform xml.validation
cd ..
```

There is a script to run the whole benchmark suite for different JavaVMs: [./benchmark.sh](./benchmark.sh)

This script has to be adapted to your specific settings for JavaVM installation, versions etc.

### MacOSX

These considerations have to be known when running the benchmark suite on MacOSX:
* Change energy saving settings to
  * Sleep: Never
  * Display sleep: Never
  * Put hard disk to sleep: NO
  * Enable Power Nap: NO
* The whole test run needs up to 2 hours

### Raspberry Pi

Note:
* install dos2unix package for fixing scripts

```
sudo apt-get install dos2unix
```

TODO

## References

* http://stackoverflow.com/questions/9257835/cant-install-specjvm2008
* https://jira.codehaus.org/browse/RVM-480
* https://www.java.net/forum/topic/jdk/java-se-snapshots-project-feedback/java-8-and-specjvm2008-stuck-startupcompilersunflow
* https://groups.google.com/forum/#!topic/adopt-openjdk/VOHTJTMfGWM

## Open Issues

* run tests over night on MacOSX
* check which tests run on JavaSE Embedded
