#!/bin/bash

# Create namespaces
sudo ip netns add orchestrator
sudo ip netns add worker1
sudo ip netns add worker2

# Create a bridge (virtual switch)
sudo ip link add br0 type bridge
sudo ip link set br0 up

# Create veth pairs and attach to bridge
for i in 1 2; do
    sudo ip link add veth-w$i type veth peer name veth-w$i-br
    sudo ip link set veth-w$i-br master br0
    sudo ip link set veth-w$i-br up
    sudo ip link set veth-w$i netns worker$i
    sudo ip netns exec worker$i ip addr add 10.0.0.$((i+1))/24 dev veth-w$i
    sudo ip netns exec worker$i ip link set veth-w$i up
done

# Orchestrator
sudo ip link add veth-orch type veth peer name veth-orch-br
sudo ip link set veth-orch-br master br0
sudo ip link set veth-orch-br up
sudo ip link set veth-orch netns orchestrator
sudo ip netns exec orchestrator ip addr add 10.0.0.1/24 dev veth-orch
sudo ip netns exec orchestrator ip link set veth-orch up

echo "Network up:"
echo "  orchestrator -> 10.0.0.1"
echo "  worker1      -> 10.0.0.2"
echo "  worker2      -> 10.0.0.3"