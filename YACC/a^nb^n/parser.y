%{
    #include<stdio.h>
    extern int yylex();
    int yyerror();    
%}

%token A B NL

%%

stmt    :   S NL     {printf("Valid String\n"); return 0;};
S       :   A S B
        | 
;

%%

int main(){
    printf("Enter the string: ");
    yyparse();
    return 0;
}

int yyerror(){
    printf("Invalid String\n");
    return 1;
}