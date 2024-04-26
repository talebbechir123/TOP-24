#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void sum_vectors(double *X, int N, int repetitions) {
    double c = 2.0; // Constant value for the sum
    for (int rep = 0; rep < repetitions; rep++) {
        for (int i = 0; i < N; i++) {
            X[i] = X[i] + c;
        }
    }
}

int main(int argc, char **argv) {
    int rank, size;
    int N, repetitions;
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

    // Calculate the number of elements per process
    int elements_per_process = N / size;
    int remainder = N % size;

    // Allocate memory for local vector X
    X = (double *)malloc(elements_per_process * sizeof(double));
    if (X == NULL) {
        printf("Memory allocation failed.\n");
        MPI_Finalize();
        return EXIT_FAILURE;
    }

    // Initialize local vector X
    srand(time(NULL) + rank); // Seed for random number generation
    for (int i = 0; i < elements_per_process; i++) {
        X[i] = (double)(rand() % 100); // Initialize each element of X with a random value (0-99)
    }

    // Add remaining elements to the last process
    if (rank == size - 1 && remainder > 0) {
        X = (double *)realloc(X, (elements_per_process + remainder) * sizeof(double));
        if (X == NULL) {
            printf("Memory allocation failed.\n");
            MPI_Finalize();
            return EXIT_FAILURE;
        }
        for (int i = elements_per_process; i < elements_per_process + remainder; i++) {
            X[i] = (double)(rand() % 100);
        }
    }

    // Measure execution time
    double start_time = MPI_Wtime();

    // Perform the sum operation
    sum_vectors(X, elements_per_process + (rank == size - 1 ? remainder : 0), repetitions);

    double end_time = MPI_Wtime();

    // Print execution time on rank 0
    if (rank == 0) {
        printf("Execution time: %f seconds\n", end_time - start_time);
    }

    // Clean up
    free(X);
    MPI_Finalize();

    return EXIT_SUCCESS;
}
