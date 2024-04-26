set terminal png
set output 'mpi_sum_vectors_plot.png'
set xlabel 'Vector Size (bytes)'
set ylabel 'Execution Time (seconds)'
set logscale x
plot 'mpi_sum_vectors_results.dat' using 1:2 with lines title 'Execution Time vs. Vector Size'
