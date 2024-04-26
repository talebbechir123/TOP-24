set terminal png
set output 'scalability_plot.png'
set xlabel 'Number of MPI Processes'
set ylabel 'Average Execution Time (seconds)'
set title 'Scalability Plot'
set grid
plot 'scalability_results.dat' using 1:2 with linespoints title 'Execution Time'
