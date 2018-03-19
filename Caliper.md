# Caliper Microbenchmarks

Caliper is a microbenchmarking tool developed by Google. For more details see
* code base: https://github.com/google/caliper
* documentation: https://github.com/google/caliper/wiki

The project and documentation is not completely up to date, but there is maintenance on project from time to time.


## How to build Caliper

Caliper (https://github.com/google/caliper) does not provide any recent release builds. For that reason there is below a short description how to build a jar-with-dependencies including examples and tutorial to run them in an easy way. It is based on code base from 2018-03-18.

```
git clone https://github.com/google/caliper.git
cd caliper

# Android build does not work out-of-box
# So disable it manually by commenting out caliper-android from ./pom.xml
mv pom.xml pom-ORI.xml
cat pom-ORI.xml | sed -e 's|<module>caliper-android</module>|<!-- <module>caliper-android</module> -->|g' >pom.xml

# add create jar-with-dependencies to caliper/pom.xml
mv caliper/pom.xml caliper/pom-ORI.xml
cat caliper/pom-ORI.xml | sed -e 's|</project>|\
  <build>\
    <plugins>\
      <plugin>\
        <artifactId>maven-assembly-plugin</artifactId>\
        <version>3.1.0</version>\
        <configuration>\
          <descriptorRefs>\
            <descriptorRef>jar-with-dependencies</descriptorRef>\
          </descriptorRefs>\
        </configuration>\
        <executions>\
          <execution>\
            <id>make-assembly</id>\
            <phase>package</phase>\
            <goals>\
              <goal>single</goal>\
            </goals>\
          </execution>\
        </executions>\
      </plugin>\
    </plugins>\
  </build>\
\
</project>|g' >caliper/pom.xml

# now build
mvn clean install -am -pl caliper
(cd caliper-examples ; mvn clean install ; cd ..)

# now build a version with all dependencies and examples included
rm -rf ./target
mkdir -p target/jar/META-INF
cd target/jar
jar xf ../../caliper/target/caliper-HEAD-SNAPSHOT-jar-with-dependencies.jar
cp -r ../../caliper-examples/target/classes/* .
cp -r ../../caliper/target/classes/* .
cd ../..
echo "Main-Class: com.google.caliper.runner.CaliperMain" >target/jar/META-INF/MANIFEST.MF
echo "Premain-Class: com.google.monitoring.runtime.instrumentation.AllocationInstrumenter" >>target/jar/META-INF/MANIFEST.MF
echo "Can-Redefine-Classes: true" >>target/jar/META-INF/MANIFEST.MF
echo "Can-Retransform-Classes: true" >>target/jar/META-INF/MANIFEST.MF
TODAY=`date +%Y-%m-%d`
echo "Jar'ing target/caliber-HEAD-$TODAY-all.jar, be patient..."
jar cMfm target/caliber-HEAD-$TODAY-all.jar META-INF/MANIFEST.MF -C target/jar .

# check if build is working
java -jar target/caliber-HEAD-$TODAY-all.jar 

# run some benchmarks to test
java -jar target/caliber-HEAD-$TODAY-all.jar examples.ArraySortBenchmark
java -jar target/caliber-HEAD-$TODAY-all.jar examples.CompressionSizeBenchmark
java -jar target/caliber-HEAD-$TODAY-all.jar examples.DemoBenchmark
# extend your favourite tests
# see https://github.com/google/caliper/tree/master/caliper-examples/src/main/java/examples
```
