#!/bin/bash

gcc orchestrator.c -o orchestrator
gcc worker.c -o worker

echo "Worker and Orchestror Compiled"