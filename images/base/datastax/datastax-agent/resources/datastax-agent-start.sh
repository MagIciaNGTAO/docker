#!/bin/bash

echo "Starting DataStax Agent"
AGENT_ADDR=$(hostname -i)

echo "stomp_interface: $AGENT_ADDR" >> ./conf/address.yaml

/opt/datastax-agent/bin/datastax-agent -f

