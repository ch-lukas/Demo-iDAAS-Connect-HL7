source ./platform-scripts/amq-streams/kafka-paths.sh

$redHatKafka/bin/kafka-server-stop.sh $redHatKafka/config/server.properties
$redHatKafka/bin/zookeeper-server-stop.sh $redHatKafka/config/zookeeper.properties

rm -rf $redHatKafka/logs/kafka-logs $redHatKafka/logs/zookeeper
