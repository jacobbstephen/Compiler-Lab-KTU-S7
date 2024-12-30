%{
    #include<stdio.h>
    #include<string.h>
    #include<stdbool.h>
    extern int yylex();
    int yyerror();
    char string[100] = "";    
%}

%token ALPHA NL 

%%

stmt    :    S NL       { check(string); return 0; };
S       :  S ALPHA      { append_character(string, yylval); }
        | 
;

%%

void append_character(char* string, char ch) {
    int len = strlen(string);
    if (len < 99) {
        string[len] = ch;
        string[len + 1] = '\0';
    } else {
        printf("Error: Buffer overflow\n");
    }
}

void check(char* string) {
    int start = 0;
    int end = strlen(string) - 1;
    bool pal = true;
    while(start <= end) {
        if(string[start] != string[end]) {
            pal = false;
            break;
        }
        start++;
        end--;
    }
    printf("appended = %s\n", string);
    if(pal) printf("Palindrome\n");
    else printf("Not Palindrome\n");
}

int main() {
    printf("Enter the string: ");
    yyparse();
    return 0;
}

int yyerror() {
    printf("Invalid String\n");
    return 1;
}
