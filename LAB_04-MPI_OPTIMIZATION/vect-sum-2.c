#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ROOT 0

void update_elements(double *X, int local_size, int rank, int size) {
    double *recv_buffer = (double *)malloc(2 * sizeof(double));
    MPI_Status status;

    // Exchange boundary elements with neighboring processes
    if (rank != 0) {
        MPI_Send(&X[0], 1, MPI_DOUBLE, rank - 1, 0, MPI_COMM_WORLD);
        MPI_Recv(&recv_buffer[0], 1, MPI_DOUBLE, rank - 1, 0, MPI_COMM_WORLD, &status);
        X[0] = recv_buffer[0];
    }
    if (rank != size - 1) {
        MPI_Send(&X[local_size - 1], 1, MPI_DOUBLE, rank + 1, 0, MPI_COMM_WORLD);
        MPI_Recv(&recv_buffer[1], 1, MPI_DOUBLE, rank + 1, 0, MPI_COMM_WORLD, &status);
        X[local_size - 1] = recv_buffer[1];
    }

    // Compute local updates for interior elements
    for (int i = 1; i < local_size - 1; i++) {
        X[i] = (X[i - 1] + 2 * X[i] + X[i + 1]) / 4;
    }

    free(recv_buffer);
}

double measure_execution_time(int repetitions, double *X, int local_size, int rank, int size) {
    double start_time, end_time;
    start_time = MPI_Wtime();

    for (int rep = 0; rep < repetitions; rep++) {
        update_elements(X, local_size, rank, size);
        // Global synchronization using barrier
        MPI_Barrier(MPI_COMM_WORLD);
    }

    end_time = MPI_Wtime();

    return (end_time - start_time) / repetitions;
}

int main(int argc, char **argv) {
    int rank, size;
    int N, local_size, repetitions;
    double *X;

    if (argc != 3) {
        printf("Usage: %s <vector_size> <repetitions>\n", argv[0]);
        return EXIT_FAILURE;
    }

    N = atoi(argv[1]);
    repetitions = atoi(argv[2]);

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    // Calculate local size
    local_size = N / size;
    if (rank == size - 1) {
        local_size += N % size; // Add remainder to the last process
    }

    // Allocate memory for local vector X
    X = (double *)malloc(local_size * sizeof(double));
    if (X == NULL) {
        printf("Memory allocation failed.\n");
        MPI_Finalize();
        return EXIT_FAILURE;
    }

    // Initialize local vector X
    srand(time(NULL) + rank); // Seed for random number generation
    for (int i = 0; i < local_size; i++) {
        X[i] = (double)(rand() % 100); // Initialize each element of X with a random value (0-99)
    }

    // Measure execution time
    double avg_execution_time = measure_execution_time(repetitions, X, local_size, rank, size);

    // Print average execution time on rank 0
    if (rank == ROOT) {
        printf("Average execution time: %f seconds\n", avg_execution_time);
    }

    // Clean up
    free(X);
    MPI_Finalize();

    return EXIT_SUCCESS;
}
