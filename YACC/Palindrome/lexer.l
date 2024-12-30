%{
    #include "y.tab.h" 
    extern int yylval;
%}

%%

[a-zA-Z]    { yylval = yytext[0]; return ALPHA; }  
\n          { return NL; }  
.           { return yytext[0]; } 

%%

int yywrap() {
    return 1;   // End of input
}
