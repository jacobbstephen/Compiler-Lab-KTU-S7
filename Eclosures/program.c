#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define size 3
int noOfStates;

void closure(int state, int  epsilonTransitions[][noOfStates], int visited[]){
    for(int i = 0; i < noOfStates; i++){
        if(epsilonTransitions[state][i] == 1 && !visited[i]){
            printf(", q%d", i);
            visited[i] = 1;
            closure(i,epsilonTransitions, visited);
        }
    }
    return;
}

int main()
{
    FILE *fp = fopen("input.txt", "r");
    char state1[size], state2[size], transition[size];

    printf("Enter no of States: ");
    scanf("%d", &noOfStates);

    int epsilonTransitions[noOfStates][noOfStates];
    memset(epsilonTransitions, 0, sizeof(epsilonTransitions));
    int visited[noOfStates];


    while (fscanf(fp, "%s %s %s", state1, transition, state2) != EOF)
    {
        if (!strcmp(transition, "e")){
            epsilonTransitions[state1[1] - '0'][state2[1] - '0'] = 1;
        }
    }
    
    printf("EPSILON CLOSURE\n");
    for(int i = 0; i < noOfStates; i++){
        printf("q%d => { q%d", i, i);
        memset(visited, 0, sizeof(visited));
        visited[i] = 1;
        closure(i, epsilonTransitions, visited);
        printf(" }\n");
    }
}