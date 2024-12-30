#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define MAX_STACK_SIZE 20

int main() {
    // Define the productions
    // E -> E + E | E * E | (E) | i
    char productions[4][4] = {"E+E", "E*E", "(E)", "i"};
    char stack[MAX_STACK_SIZE];
    int top = 0;
    // char input[] = "i*i+i$";
    char input[] = "(i)*(i)$";
    int input_len = strlen(input);

    printf("Stack\t\tString\t\tAction\n");

    stack[0] = '\0';

    for (int i = 0; i < input_len; ) {
        // ACCEPT
        if (top == 1 && stack[0] == 'E' && input[i] == '$') {
            printf("%s\t\tACCEPT\n", stack);
            printf("\nParsing Successful\n");
            return 0;
        }

        bool reduced = false;

        // Reduction
        for (int j = 0; j < 4; j++) {
            int rhs_len = strlen(productions[j]);
            if (top < rhs_len) continue;

            if (!strcmp(stack + top - rhs_len, productions[j])) {
                // Perform reduction
                reduced = true;
                top -= rhs_len;
                stack[top++] = 'E';
                stack[top] = '\0';
                printf("%s\t\t%s\t\tReduce by %s\n", stack, input + i, productions[j]);
                break;
            }
        }
        // SHIFT AND ERROR
        if (!reduced) {
            if (input[i] == '$') {
                printf("Parsing Unsuccessful\n");
                return 1;
            }
            stack[top++] = input[i++];
            stack[top] = '\0'; 
            printf("%s\t\t%s\t\tShift %c\n", stack, input + i, input[i - 1]);
        }
    }
    return 0;
}

