#!/bin/bash

echo "Starting DataStax Agent"

if [ -n "$OPSCENTER_PORT_61620_TCP_ADDR" ] ; then
  echo "Adding OpsCenter $OPSCENTER_PORT_61620_TCP_ADDR to address.yaml"
  echo "stomp_interface: $OPSCENTER_PORT_61620_TCP_ADDR" >> /opt/datastax-agent/conf/address.yaml
else 
  echo "ERROR: OPSCENTER_PORT_61620_TCP_ADDR variable not set. Will not be able to reach OpsCenter." 1>&2
fi

/opt/datastax-agent/bin/datastax-agent -f

