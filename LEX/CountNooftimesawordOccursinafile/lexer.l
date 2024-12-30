%{
    #include<stdio.h>
    #include<string.h>  
    char word[100];
    FILE* fp;
    int count = 0;
    void check(char text[]);
%}

%%
[a-zA-Z]+      {check(yytext);}
.               {}
%%

void check(char text[]){
    if(!strcmp(word, yytext)) count++;
}

int main(){
    printf("Enter the word: ");
    scanf("%s", word);
    fp = fopen("input.txt", "r");
    yyin = fp;
    yylex();
    printf("Count = %d\n", count);
    return 0;

}

int yywrap(){
    return 1;
}