source ./platform-scripts/amq-streams/kafka-paths.sh

## Operational Topics for Platform
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic opsmgmt_platformtransactions
## HL7
## Inbound to iDAAS Platform by Message Trigger
## Facility: MCTN
## Application: MMS
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mms_adt
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mms_orm
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mms_oru
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mms_rde
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mms_sch
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mms_vxu
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mms_mfn
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mms_mdm
## HL7
## Facility By Application by Message Trigger
## Facility: MCTN
## Application: MMS
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_adt
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_orm
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_oru
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_rde
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_sch
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_vxu
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mfn
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mctn_mdm
## HL7
## Enterprise By Application by Message Trigger
## Facility: MCTN
## Application: MMS
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mms_adt
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mms_orm
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mms_oru
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mms_rde
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mms_sch
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mms_vxu
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mms_mfn
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic mms_mdm
## HL7
## Enterprise by Message Trigger
## Application: MMS
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic ent_adt
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic ent_orm
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic ent_oru
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic ent_rde
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic ent_sch
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic ent_vxu
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic ent_mfn
$redHatKafka/bin/kafka-topics.sh --delete --bootstrap-server localhost:9092 --topic ent_mdm
