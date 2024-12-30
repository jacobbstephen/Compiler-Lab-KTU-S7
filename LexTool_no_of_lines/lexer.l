%{
    #include<stdio.h>
    int lines = 0;
    int words = 0;
    int characters = 0;

%}

%%

[a-zA-Z]+   {words++; characters += yyleng;}
\n          {lines++;}
.           {characters++;}
%%

int main(){
    yylex();
    printf("Words = %d\n", words);
    printf("Lines = %d\n", lines);
    printf("Characters = %d\n", characters);
    return 0;
}
int yywrap(){
    return 1;
}