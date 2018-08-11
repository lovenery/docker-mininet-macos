#!/bin/bash

# Start Open vSwitch
service openvswitch-switch start
ovs-vsctl set-manager ptcp:6640

# Interactive
bash

# Stop (can ignore this line haha)
service openvswitch-switch stop
