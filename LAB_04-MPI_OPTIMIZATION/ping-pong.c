#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char** argv) {
    int rank, size;
    unsigned long size_data;
    char* data;
    double t0, t1;
    if (argc != 2) {
        printf("Usage: %s <size_data>\n", argv[0]);
        return 1;
    }
    size_data = atoi(argv[1]);
    data = (char*)malloc(size_data * sizeof(char));
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Request request;
    MPI_Status status;

    if (size != 2) {
        printf("This application is designed to run with 2 processes.\n");
        MPI_Abort(MPI_COMM_WORLD, 1);
    }
    if (rank == 0) {
        t0 = MPI_Wtime();
        MPI_Isend(data, size_data, MPI_CHAR, 1, 0, MPI_COMM_WORLD, &request);
        MPI_Wait(&request, &status);
        t1 = MPI_Wtime();
        printf("%lu\t%g\n", size_data, t1 - t0);
    } else if (rank == 1) {
        MPI_Irecv(data, size_data, MPI_CHAR, 0, 0, MPI_COMM_WORLD, &request);
        MPI_Wait(&request, &status);
    }
    free(data);
    MPI_Finalize();
   
    return 0;
}