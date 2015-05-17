# JavaVM Performance Tests

## Overview

This project has been setup to clarify the performance of different Java Virtual Machine (JavaVM) versions running on mainly embedded hardware. There are no _official_ information from Oracle how a JavaSE Embedded 8 will differ from a JavaSE Embedded 7 version on a specific hardware which will support floating point or not. We would like to know which is the best recommendation running openHAB2/Eclipse SmartHome on Raspberry Pi/BeagleBone and similar hardware platforms.

This project will summarize the experiences, scripts, results of running some tests on different hardware and JavaVM versions.

We will use existing benchmark tests and do not invent new ones. We will see how good these benchmarks will target embedded environments and adapt them where needed or apprpriate.

Note: this is *NO* official benchmark with reliable results, but should give a good understanding how these JavaVMs will perform.

## Macro Benchmarks

Macro benchmarks are benchmarks targeting overall performance behavior of a JavaVM. Note that the existing benchmarks are 5-8 years old and no overall tests have been undertaken or publsihed with JavaSE 7 and JavaSE 8 and even not on embedded platforms.

Available macro benchmarks found:
* DaCapo Benchmark (2009): http://dacapobench.org/
* SPECjvm2008 benchmark (2008): http://spec.org/jvm2008/
* JavaStats benchmark form Uni Gent, Belgium (2007): https://www.elis.ugent.be/en/JavaStats

We will start using SPECjvm2008 as a starting point for running tests on Raspberry Pi.

## Micro Benchmarks

Micro benchmarks are benchmarks targeting specific parts of a Java implementation, mainly  inside the JavaVM or inside an specific algorithms/implementation of own code. Micro benchmarks use a general framework for warmup, repeating tests and standard reporting of results. Micro benchmarks are not targeting very well an overall performance but are listed for completeness here.

Available micro benchmarks found:
* Caliper: https://code.google.com/p/caliper/
* Java Microbenchmarking Harness (JMH): http://openjdk.java.net/projects/code-tools/jmh/

## Running tests with SPECjvm2008

See [./SPECjvm2008/README.md](./SPECjvm2008/README.md)

## References

* Overview of JVM benchmarking application: http://stackoverflow.com/questions/2386873/jvm-benchmarking-application
* Java Virtual Machine Benchmarks for Raspberry Pi: https://www.raspberrypi.org/forums/viewtopic.php?f=34&t=15639

* DaCapo Benchmark (2009): http://dacapobench.org/
* SPECjvm2008 benchmark (2008): http://spec.org/jvm2008/
* JavaStats benchmark form Uni Gent, Belgium (2007): https://www.elis.ugent.be/en/JavaStats

* Caliper: https://code.google.com/p/caliper/
* Article about JMH (german): http://www.heise.de/developer/artikel/JMH-Microbenchmarking-auf-der-Java-Virtual-Machine-2162093.html
* Java Microbenchmarking Harness (JMH): http://openjdk.java.net/projects/code-tools/jmh/

## Open Issues

* Run tests and collection results on
  * MacOSX 10.10.
  * RaspPi 2, RaspPi B+, RaspPi 1
  * own hardware
