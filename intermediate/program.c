
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
#include<stdbool.h>

#define MAX 20

char postfix[MAX];
char input[MAX];
int tempvar = 0;

bool isOperator(char op){
    return (op == '+' || op == '-' || op == '*' || op == '/'); 
}

char* newTemp(){
    char* tempName = (char *) malloc(10 * sizeof(char));
    sprintf(tempName, "t%d", tempvar++);
    return tempName;
}
int precedence(char ch){
    switch(ch){
        case '+':
        case '-':
            return 1;
        case '*':
        case '/':
            return 2;
        default:
            return 0;
    }
}

void convertToPostfixExpression(){
    char stack[MAX];
    int top = -1;
    int k = 0;
    for(int i = 0; i < strlen(input); i++){
        if(isalnum(input[i])){
            postfix[k++] = input[i];
        }else if(isOperator(input[i])){
            while(top != -1 && 
            precedence(stack[top]) >= precedence(input[i])){
                postfix[k++] = stack[top--];
            }
            stack[++top] = input[i];
        }
    }
    while(top != -1){
        postfix[k++] = stack[top--];
    }
    postfix[k] = '\0';
}

void generateIntermediateCode(){
    char stack[MAX][MAX];
    int top = -1;

    for(int i = 0; i < strlen(postfix); i++){
        if(isalnum(postfix[i])){
            char operand[2] = {postfix[i], '\0'};
            strcpy(stack[++top], operand);
        }else if(isOperator(postfix[i])){
        
            char op1[MAX], op2[MAX], result[MAX];
            strcpy(op2, stack[top--]);
            strcpy(op1, stack[top--]);
            char* temp = newTemp();
            printf("%s = %s %c %s\n", temp, op1, postfix[i], op2);
            strcpy(stack[++top], temp);

        }
    }
    printf("Final Result : %s\n", stack[0]);
}

int main(){
    printf("Enter the expression: ");
    scanf("%s",input);

    // convert to postfix
    convertToPostfixExpression();


    printf("%s\n",postfix);

    // generateIntermediateCode
    generateIntermediateCode();
    
    return(0);
}