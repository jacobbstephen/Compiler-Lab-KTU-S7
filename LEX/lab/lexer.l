%{
#include <stdio.h>
#include<stdbool.h>
#include<string.h>
#include<ctype.h>

int vowels = 0;
int consonants = 0;
char string[100] = "";

void findAnswer(char ch);

%}

%%

[a-zA-Z\n\t ]        { findAnswer(yytext[0]); }

.                    {}

%%

bool isVowel(char ch) {
    return (ch == 'A' || ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U' || 
            ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' );
}

bool allUpper() {
    for(int i = 0; i < strlen(string); i++) {
        if(islower(string[i])) return false;
    }
    return true;
}

void append(char ch) {
    int len = strlen(string);
    string[len] = ch;
    string[len + 1] = '\0';
}

void findAnswer(char ch) {
    if (isalpha(ch)) { 
        if (isVowel(ch)) vowels++;
        else consonants++;
    }
    if (ch != ' ' && ch != '\t' && ch != '\n') {
        append(ch);
    } else {
        if (strlen(string) > 0 && allUpper()) {
            printf("Uppercase Word: %s\n", string);
        }
        string[0] = '\0';
    }
}

int main() {
    printf("Enter a sentence: ");
    yylex(); 
    
    printf("Number of vowels: %d\n", vowels);
    printf("Number of consonants: %d\n", consonants);
    return 0;
}

int yywrap() {
    return 1;
}