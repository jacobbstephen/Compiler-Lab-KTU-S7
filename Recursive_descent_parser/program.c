/*
E -> iE1
E1 -> +iE1|-iE1 | e
*/

#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
int lookahead = 0;
char input[] = "i+i-i$"; 


bool match(char t){
    if(input[lookahead] == t)
        lookahead++;
    else printf("ERROR\n");
}
void E1(){
    if(input[lookahead] == '+'){
        if(match('+') && input[lookahead] == 'i') match('i');
        else{
            printf("ERROR\n");
            return;
        }
        E1();
    }
    else if(input[lookahead] == '-'){
        if(match('-') && input[lookahead] == 'i') match('i');
        else{
            printf("ERROR\n");
            return;
        }
        E1();
    }
    else return;
}
void E (){
    if(input[lookahead] == 'i'){
        if(match('i')) E1();
    }
}

int main(){
    E();
    if(input[lookahead] == '$')
        printf("Parsing Successful\n");
    else    
        printf("Parsing Unsuccessful\n");
    return(0);
}