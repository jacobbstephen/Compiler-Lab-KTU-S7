%{
    #include<stdio.h>  
%}

%%
[a-zA-Z]+      {printf("ONLY Alphabets are present\n");}
.*              {printf("Other Characters are present\n");}
%%
"a,ab, ma..." +
" '', a,ab, ma..." *

int main(){
    printf("Enter the String: ");
    yylex();
    return 0;

}

int yywrap(){
    return 1;
}