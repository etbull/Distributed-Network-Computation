# Setting up worker nodes
sudo ip netns exec worker1 ./worker &
sudo ip netns exec worker2 ./worker &
sleep 2

# Setting up conductor node
sudo ip netns exec orchestrator ./orchestrator