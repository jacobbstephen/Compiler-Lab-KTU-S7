%{
    #include<stdio.h>   
    void check(int num);
%}

%%
[0-9]+      {check(atoi(yytext));}
.           {printf("NOT A Valid Number\n");}
%%

void check(int num){

    if(num % 2 == 0) printf("EVEN\n");
    else printf("ODD\n");
                
}

int main(){
    printf("Enter the Number: ");
    yylex();
    return 0;

}

int yywrap(){
    return 1;
}