%{
    #include<stdio.h>    
%}

%%
[0-9]+      {printf("DIGIT\n");}
.           {printf("NOT A DIGIT\n");}
%%

int main(){
    printf("Enter the character: ");
    yylex();
    return 0;

}

int yywrap(){
    return 1;
}