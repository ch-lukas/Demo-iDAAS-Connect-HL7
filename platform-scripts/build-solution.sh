echo "*** Building iDAAS - Connect HL7 ***"
cd ./
JAVA_HOME=./platform-software/java-1.8.0 ./platform-software/apache-maven-3.6.3/bin/mvn clean install
echo "*** Maven Build Completed ***"
