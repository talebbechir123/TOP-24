#!/bin/bash

# Compile the MPI ping-pong code
mpicc vect-sum.c -o vect  

# Define the range of vector sizes
vector_sizes=(128 256 512 1024 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152 4194304 8388608 16777216)

# Create a .dat file
output_file="mpi_sum_vectors_results.dat"
echo "# Vector Size  Execution Time (seconds)" > $output_file

# Loop over each vector size
for size in "${vector_sizes[@]}"
do
    echo "Vector size: $size"
    # Run the MPI sum vectors code with the current vector size
    result=$(mpirun -np 4 ./vect $size 100)
    # Extract the execution time from the result
    time=$(echo $result | awk '{print $3}')
    # Append the result to the .dat file
    echo "$size $time" >> $output_file
done

echo "Results saved to $output_file"
