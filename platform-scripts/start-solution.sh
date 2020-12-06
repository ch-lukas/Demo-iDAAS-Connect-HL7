echo "*** Cleanup previous sessions ***"
./platform-scripts/amq-streams/stop_kafka.sh > /dev/null 2>&1 &
sleep 5

# Start Zookeeper and Kafka in the background
./platform-scripts/amq-streams/start_kafka.sh

echo "*** Creating sample topics (will take a few minutes) ***"
./platform-scripts/amq-streams/kafkacmd_topics_create-iDAAS-HL7.sh > /dev/null 2>&1 &

echo "*** Starting iDaaS ***"
java -jar ./target/idaas-connect-hl7.jar $@


