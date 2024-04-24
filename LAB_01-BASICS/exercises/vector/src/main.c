/**
 * \file main.c
 * \brief LAB 01: Part 1 - Compilation
 **/

#include "compute.h"

#include <locale.h>
#include <stdio.h>

#define VECTOR_SIZE 32U
#define REPEAT 30000000U

/**
 * \brief Print header info.
 */
static void print_info(void) {
    setlocale(LC_ALL, "");
    puts("*******************************************************");
    puts("           M1 CHPS - TOP LAB_01: Compilation\n");
    puts("                   VECTOR ADDITION");
    puts("-------------------------------------------------------");
    printf("VECTOR SIZE:   %'u\n", VECTOR_SIZE);
    printf("REPETITIONS:   %'u\n", REPEAT);
}

int main(void) {
    print_info();
    compute(VECTOR_SIZE, REPEAT);
    return 0;
}
