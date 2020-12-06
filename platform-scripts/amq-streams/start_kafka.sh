source ./platform-scripts/amq-streams/kafka-paths.sh

echo "*** Starting Zookeeper ***"
# Debug mode
#$redHatKafka/bin/zookeeper-server-start.sh $redHatKafka/config/zookeeper.properties
# Silent mode
$redHatKafka/bin/zookeeper-server-start.sh $redHatKafka/config/zookeeper.properties > /dev/null 2>&1 &
sleep 20

echo "*** Starting Kafka ***"
# Debug mode
#$redHatKafka/bin/kafka-server-start.sh $redHatKafka/config/server.properties
# Silent mode
$redHatKafka/bin/kafka-server-start.sh $redHatKafka/config/server.properties > /dev/null 2>&1 &
sleep 20
