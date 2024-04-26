#!/bin/bash

# Compile the MPI ping-pong code
mpicc ping-pong-actual.c -o ping_pong_actualc

# Define the range of message sizes (multiples of 32 bytes)
message_sizes=(32 64 96 128 160 192 224 256 288 320 352 384 416 448 480)

# Create a .dat file
output_file="mpi_ping_pong_results_32bytes.dat"
echo "# Message Size (bytes)  Time (seconds)" > $output_file

# Loop over each message size
for size in "${message_sizes[@]}"
do
    echo "Message size: $size bytes"
    # Run the MPI ping-pong code with the current message size
    result=$(mpirun -np 2 ./ping_pong_actualc $size)
    # Extract the time from the result
    time=$(echo $result | awk '{print $2}')
    # Append the result to the .dat file
    echo "$size $time" >> $output_file
    # Wait for a second before the next measurement
    sleep 2
done

echo "Results saved to $output_file"