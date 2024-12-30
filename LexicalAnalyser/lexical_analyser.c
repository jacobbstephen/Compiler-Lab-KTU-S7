#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>
int main(){

    FILE* ptr = fopen("input.txt", "r");
    int tokens = 0;

    char str[20];
    char ch = fgetc(ptr);
    while(ch != EOF){
        int i = 0;
        if(ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '^' || ch == '='){
            tokens++;
            printf("{%c} is a operator\n", ch);
        }
        else if(ch == ')' || ch == '(' ||ch == ';' ||ch == '"'){
            tokens++;
            printf("{%c} is a special character\n", ch);
        }
        else if(isdigit(ch)){
            tokens++;
            printf("{%c} is a digit\n", ch);
        }
        else if(isalpha(ch)){
            str[i++] = ch;
            ch = fgetc(ptr);
            while(isalnum(ch) && ch != ' '){
                str[i++] = ch;
                ch = fgetc(ptr);
            }
            str[i] = '\0';
            tokens++;
            if(strcmp(str, "int") == 0){
                printf("{%s} is a keyword\n", str);
            }else{

                printf("{%s} is a identifier\n", str);
            }
        }
        ch = fgetc(ptr);
    }
    return(0);
}