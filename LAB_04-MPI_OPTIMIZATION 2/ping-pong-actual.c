#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>



int main(int argc, char** argv) {
    int NUM_REPEATS =10;
    int rank, size;
    unsigned long size_data;
    char* data;
    double t_start, t_end, total_time = 0.0, average_time;
    
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    
    if (argc != 2) {
        if (rank == 0) {
            printf("Usage: %s <size_data>\n", argv[0]);
        }
        MPI_Finalize();
        return 1;
    }
    
    size_data = atol(argv[1]);
    data = (char*)malloc(size_data * sizeof(char));
    
    if (size != 2) {
        if (rank == 0) {
            printf("This application is designed to run with 2 processes.\n");
        }
        MPI_Finalize();
        free(data);
        return 1;
    }
    
    MPI_Request request;
    MPI_Status status;

    // Synchronize all processes before message exchange
    MPI_Barrier(MPI_COMM_WORLD);

    for (int i = 0; i < NUM_REPEATS; i++) {
        t_start = MPI_Wtime();
        if (rank == 0) {
            MPI_Isend(data, size_data, MPI_CHAR, 1, 0, MPI_COMM_WORLD, &request);
            MPI_Recv(data, size_data, MPI_CHAR, 1, 0, MPI_COMM_WORLD, &status);
            MPI_Wait(&request, &status);
        } else if (rank == 1) {
            MPI_Recv(data, size_data, MPI_CHAR, 0, 0, MPI_COMM_WORLD, &status);
            MPI_Isend(data, size_data, MPI_CHAR, 0, 0, MPI_COMM_WORLD, &request);
            MPI_Wait(&request, &status);
        }
        t_end = MPI_Wtime();

        total_time += (t_end - t_start);
    }
    
    // Calculate average time
    average_time = total_time / NUM_REPEATS;
    
    if (rank == 0) {
        printf("Message size: %lu bytes, Average Time: %g seconds\n", size_data, average_time);
    }
    
    free(data);
    MPI_Finalize();
    return 0;
}
