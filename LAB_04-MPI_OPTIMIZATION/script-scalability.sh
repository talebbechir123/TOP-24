#!/bin/bash

# MPI executable name
MPI_EXEC="vect-2"

# Define the range of MPI process counts
MIN_PROC=2
MAX_PROC=32
STEP=2

# Define the problem size
PROBLEM_SIZE=1000000

# Number of repetitions for each configuration
REPETITIONS=100

# Output file for results
OUTPUT_FILE="scalability_results.dat"

# Clean up existing output file
rm -f $OUTPUT_FILE

# Loop over MPI process counts
for ((num_proc = $MIN_PROC; num_proc <= $MAX_PROC; num_proc += $STEP))
do
    echo "Testing with $num_proc MPI processes..."

    # Run the MPI program and measure execution time
    execution_time=$(mpirun -np $num_proc ./$MPI_EXEC $PROBLEM_SIZE $REPETITIONS | grep "Average execution time" | awk '{print $4}')

    # Save results to output file
    echo "$num_proc $execution_time" >> $OUTPUT_FILE

    echo "Execution time with $num_proc MPI processes: $execution_time seconds"
    echo "--------------------------------------------"
done

echo "Results saved to $OUTPUT_FILE"
