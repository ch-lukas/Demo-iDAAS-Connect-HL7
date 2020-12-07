# Demo-iDAAS-Connect-HL7
Demonstration for iDAAS Connect HL7. iDAAS-Connect-HL7 specifically ONLY deals with enabling 
iDAAS to process the healthcare industry standard HL7 based transactions ONLY. This demo repository
will only demonstrate (ADT, ORM, ORU) while the full repository
will support the following HL7 messages (ADT, ORM, ORU, MFN, MDM, PHA, SCH and VXU) 
from any vendor and any version of HL7 v2.

This solution contains three supporting directories. The intent of these artifacts to enable
resources to work locally: <br/>
1. platform-scripts: support running amq, amq-streams (kafka) and doing very specific things with 
Kafka such as: creating/listing and deleting topics needed for this solution
and also building and packaging the solution as well. All the scripts are named to describe their capabilities <br/>
2. platform-testdata: sample transactions to leverage for using the platform. 

## Scenario: Integration 
This repository follows a very common general facility based implementation. The implementation
is of a facility, we have named MCTN for an application we have named MMS. This implementation 
specifically defines one HL7 socket server endpoint per datatype mentioned above.

### Integration Data Flow Steps
 
1. Any external connecting system will use an HL7 client (external to this application) will connect to the specifically defined HL7
Server socket (one socket per datatype) and typically stay connected.
2. The HL7 client will send a single HL7 based transaction to the HL7 server.
3. iDAAS Connect HL7 will do the following actions:<br/>
    a. Receive the HL7 message. Internally, it will audit the data it received to 
    a specifically defined topic.<br/>
    b. The HL7 message will then be processed to a specifically defined topic for this implementation. There is a 
    specific topic pattern -  for the facility and application each data type has a specific topic define for it.
    For example: MCTN_MMS_ADT, MCTN_MMS_ORM, etc. <br/>
    c. An acknowledgement will then be sent back to the hl7 client (this tells the client he can send the next message,
    if the client does not get this in a timely manner it will resend the same message again until he receives an ACK).<br/>
    d. The acknowledgement is also sent to the auditing topic location.<br/>
    
## Laptop Prep
This section will cover how to setup your Windows machine to be able to run iDaaS.

Requirements:
1.  Windows 10

Configuration used for this tutorial:
1.  Windows 10 VM based on VirtualBox (e.g. `https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/`)
2.  VM with 4gb memory and 2 CPU
3.  Visual Studio Code (latest version)
4.  7Zip

Software that comes pre-bundled in this project (e.g. `platform-software`)
1.  apache-maven-3.6.3
2.  java-1.8.0 (iDaaS is compiled using Java 8, but you can still have Java 11 glbally installed if you require additional Visual Studio Code Extensions)
3.  Red Hat Integration (e.g. Camel, AMQ, AMQ-Streams/Kafka)

### Setup Instructions
#### Git Installation
1.  Download Git from `https://github.com/git-for-windows/git/releases/download/v2.29.2.windows.2/Git-2.29.2.2-64-bit.exe` 
2.  Install using defaults

#### Project Download
1.  Create "Projects" folder (tip try and make the path as short as possible and do not use spaces or underscores)
2.  Open PowerShell --> Navigate to your newly created folder (e.g. `C:\Projects`)
3.  Clone this iDaaS demo project by typing `git clone https://github.com/ch-lukas/Demo-iDAAS-Connect-HL7.git`

#### Visual Studio Code Prep
1.  Install if you do not already have a copy (e.g. `https://code.visualstudio.com/download`)
2.  Open Visual Studio Code
3.  Load project by clicking on `File/Open Folder` --> Select project (e.g. `C:\Projects\Demo-iDAAS-Connect-HL7`)
3.  We need to activate and prepare the terminal --> Click `Terminal/New Terminal` --> Click on the drop-down box that currently says `1: powershell` and select `Select Default Shell` and select `Git Bash` --> Close the terminal and re-open it (it should now have bash selected)

## Build Solution
Within the code base you can find the local build commands in the /platform-scripts directory
1.  Run the build-solution.sh script (from the project root --> `./platform-scripts/build-solution.sh`)
It will run the maven commands to build and then package up the solution. The package will use the usual settings
in the pom.xml file. It pulls the version and concatenates the version to the output jar it builds.
Additionally, there is a copy statement to remove any specific version, so it outputs idaas-connect-hl7.jar

## Running the iDaaS Solution

Once built you can run the solution by executing `./platform-scripts/start-solution.sh`. 
The script will startup Zookeeper, Kafka and the iDaaS server.

It is possible to overwrite configuration by:
1. Providing parameters via command line e.g.
`./start-solution.sh --idaas.adtPort=10009`
2. Creating an application.properties next to the idaas-connect-hl7.jar in the target directory
3. Creating a properties file in a custom location `./start-solution.sh --spring.config.location=file:./config/application.properties`

Supported properties include:
```properties
idaas.kafkaBrokers=localhost:9092 #a comma separated list of kafka brokers e.g. host1:port1,host2:port2
#ports to listen for HL7 messages on
idaas.adtPort=10001 
idaas.ormPort=10002
idaas.oruPort=10003
idaas.rdePort=10004
idaas.mfnPort=10005
idaas.mdmPort=10006
idaas.schPort=10007
idaas.vxuPort=10008
```

## Testing the Solution

The test and see if everything is working:
1.  You can download a tool such as KafkaTool `https://www.kafkatool.com/download2/kafkatool_64bit.exe`. Please note that this is free only for non-commerial use (refer to their Ts & Cs for more information)
2.  Example setup: `Cluster name=iDaas`, `Kafka Cluster Version=2.5` --> Save --> You can now view Brokers and Topics

# Getting Involved
Here are a few ways you can get or stay involved.
 
## Ongoing Enhancements
We maintain all enhancements within the Git Hub portal under the 
<a href="https://github.com/RedHat-Healthcare/iDAAS-Connect-HL7/projects" target="_blank">projects tab</a>

## Defects/Bugs
All defects or bugs should be submitted through the Git Hub Portal under the 
<a href="https://github.com/RedHat-Healthcare/iDAAS-Connect-HL7/issues" target="_blank">issues tab</a>

## Chat and Collaboration
You can always leverage <a href="https://redhathealthcare.zulipchat.com" target="_blank">Red Hat Healthcare's ZuilpChat area</a>
and find all the specific areas for iDAAS-Connect-HL7. We look forward to any feedback!!

If you would like to contribute feel free to, contributions are always welcome!!!! 

Happy using and coding....

