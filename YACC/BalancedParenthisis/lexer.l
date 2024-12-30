%{
    #include "y.tab.h"    
%}

%%
[(]     {return Lpar;}
[)]     {return Rpar;}
[\n]    {return NL;}
.       {return yytext[0];}
%%

int yywrap(){
    return 1;
}