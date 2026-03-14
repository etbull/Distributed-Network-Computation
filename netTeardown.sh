#!/bin/bash

sudo ip netns del orchestrator
sudo ip netns del worker1
sudo ip netns del worker2

sudo ip link del br0

echo "Network torn down"