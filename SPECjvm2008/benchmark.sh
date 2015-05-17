#!/bin/bash

rm -f console.log

(
echo "Run SPECjvm2008 benchmarks..."

./install.sh

# adapt to your own settings

export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0_37-b06-434.jdk/Contents/Home
./run.sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/dk1.7.0_51.jdk/Contents/Home
./run.sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
./run.sh

) 2>&1 | tee console.log
