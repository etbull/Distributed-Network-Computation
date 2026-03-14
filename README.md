# Distributed-Network-Computation
This project allows for programs to be ran faster by running them across multiple nodes

## Instructions

### Steps for Initial Setup
1. To setup the environment, you first need to run ```netSetup.sh```. You might need to run ```chmod +x netSetup.sh netTeardown.sh compile.sh run.sh``` if you haven't before
2. Next, to run scripts in an namespace, the general form is ```sudo ip netns exec <namespace> <command>```
3. You need to compile the orchestrator and worker script first with ```gcc orchestrator.c -o orchestrator``` and ```gcc worker.c -o worker```
4. Alternativey, run ```./compile.sh``` to do step 3 automatically
5. Finally, to run the orchestrator and the worker, run ```./run.sh```

### Steps for Continued Runs
1. If you start up, start with ```./netSetup.sh```
2. To compile changes, run ```./compile.sh```
3. To run, do ```./run.sh```