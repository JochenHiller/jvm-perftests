# openHAB2

## Results

These results have been measured until now.

| Date/User | OS/JavaVM | Startup time | Results |
| --------- | --------- | ----- | ------- |
| 2015-05-30/jochenhiller | Mac (JavaSE 6/7/8, client/server) | 13-14 sec | [./results/mac](./results/mac) |
| 2015-05-30/jochenhiller | Rasp Pi 1 B/B+ | 190-200 sec | [./results/raspberry-pi](./results/raspberry-pi) |
| 2015-05-30/jochenhiller | Rasp Pi 2 | 75-110 sec | [./results/raspberry-pi](./results/raspberry-pi) |

## Details

This benchmark will simply start openHAB2 with some standard add-on bundles. It will measure until openHAB2 is up and running.
This is not a thorough test but give some good indicators of running openHAB2 on different JavaVMs in embedded environments.

## Run the tests

Download scripts to install and run the tests on your target platform.

```
curl -s -o install.sh https://raw.githubusercontent.com/JochenHiller/jvm-perftests/master/openHAB2/install.sh
curl -s -o run.sh https://raw.githubusercontent.com/JochenHiller/jvm-perftests/master/openHAB2/run.sh
curl -s -o benchmark.sh https://raw.githubusercontent.com/JochenHiller/jvm-perftests/master/scripts-common/benchmark.sh
chmod u+x *.sh
# adapt benchmark.sh to your environment, then run the benchmarks
#   set JVMS to your JavaVMs to test
./benchmark.sh
# see results at ./openHAB2-results
```

## References

* https://github.com/openhab/openhab2/blob/2.0.0-alpha2/docs/sources/installation/demo.md

## Open Issues

* run tests on MacOSX
* run tests on Rasp Pi B, B+, Rasp Pi 2, with OpenJDK, JavaSE 7/8 Embedded
