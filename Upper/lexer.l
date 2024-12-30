%{
#include <stdio.h>
#include <ctype.h>
int lc = 0, sc = 0, ch = 0, wc = 0;
void convert(char ch);
%}
%%

[A-Za-z]+     { wc++; ch += yyleng; for (int i = 0; i < yyleng; i++) convert(yytext[i]); }
[ \t]         { sc++; printf("%c", yytext[0]); }                        
\n            { lc++; printf("\n"); }          


%%

void convert(char ch) {
    if (islower(ch)) {
        char upper = ch - 'a' + 'A';
        printf("%c", upper); 
    } else if (isupper(ch)) {
        char lower = ch - 'A' + 'a';
        printf("%c", lower); 
    } else {
        printf("%c", ch); // Print character as-is if it's not alphabetic
    }
}

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter input:\n");
    yylex();
    lc++; // Count the last line if no newline at end of input
    printf("\nLine count: %d\n", lc);
    printf("Space count: %d\n", sc);
    printf("Character count: %d\n", ch);
    printf("Word count: %d\n", wc);
    return 0;
}
