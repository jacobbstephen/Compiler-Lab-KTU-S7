%{
    #include<stdio.h>
    #include<stdlib.h>
    extern int yylex();
    int yyerror();
%}

%token NUMBER LETTER UND NL

%%

valid   : variable NL   {printf("Valid Identifier\n"); return 0;}
        | variable      {printf("Valid Identifier\n"); return 0;}
;

variable    : LETTER alphanumeric
            | UND alphanumeric
            | LETTER
            | UND
;

alphanumeric    : LETTER alphanumeric
                | UND alphanumeric
                | NUMBER alphanumeric
                | LETTER
                | NUMBER
                | UND
;
%%


int main(){
    printf("Enter the Identifier: ");
    yyparse();
    return 0;
}

int yyerror(char *s){
    printf("Invalid Identifier\n");
    return 1;
}

