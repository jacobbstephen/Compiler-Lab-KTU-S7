%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    int yyerror();    
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
stmt: E    {printf("Result =  %d\n", $$); return 0;};

E:    E '+' E     {$$ = $1 + $3;}
    | E '*' E     {$$ = $1 * $3;}
    | E '-' E     {$$ = $1 - $3;}
    | E '/' E     {$$ = $1 / $3;}
    | '(' E ')'   {$$ = $2;}
    | NUMBER      {$$ = $1;}
;

%%

int main(){
    printf("Enter the expression: ");
    yyparse();

}
int yyerror(char *s){
    printf("INVALID expression: ");
    exit (1);
}