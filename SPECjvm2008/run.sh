#!/bin/bash

echo "Running SPECjvm2008 for Java $JAVA_HOME"

cd specjvm2008

# make a dry run for fast testing
java -jar SPECjvm2008.jar -ikv -wt 5s -it 5s -bt 2 compress

# runs ALL tests
# java -jar SPECjvm2008.jar

# run only tests for JavaSE 8
# java -jar SPECjvm2008.jar startup.helloworld startup.compiler.compiler  startup.compress startup.crypto.aes startup.crypto.rsa startup.crypto.signverify startup.mpegaudio startup.scimark.fft startup.scimark.lu startup.scimark.monte_carlo startup.scimark.sor startup.scimark.sparse startup.serial startup.sunflow startup.xml.transform startup.xml.validation compiler.compiler compress crypto.aes crypto.rsa crypto.signverify derby mpegaudio scimark.fft.large scimark.lu.large scimark.sor.large scimark.sparse.large scimark.fft.small scimark.lu.small scimark.sor.small scimark.sparse.small scimark.monte_carlo serial sunflow xml.transform xml.validation

cd ..
