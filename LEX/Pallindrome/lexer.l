%{
    #include<stdio.h>  
    #include<string.h>
    #include<stdbool.h>
    void check(char string[]);
%}

%%
[a-zA-Z]+      {check(yytext);}
.           {printf("NOT A palindrome\n");}
%%

void check(char string[]){

    int start = 0;
    bool pal = true;
    int end = strlen(string) - 1;
    while(start <= end){
        if(string[start] != string[end]) {
            pal = false;
            break;
        }
        start++; end--;
    }
    if(pal) printf("Palindrome\n");
    else printf("Not Palindrome\n"); 
                
}

int main(){
    printf("Enter the String: ");
    yylex();
    return 0;

}

int yywrap(){
    return 1;
}