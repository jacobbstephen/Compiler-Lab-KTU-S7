%{
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <ctype.h>

int vowels = 0;
int consonants = 0;
char string[100] = "";

void findAnswer(char *word);
%}

%%

[aeiouAEIOU]              { vowels++; }    
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] { consonants++; }

[a-zA-Z]+                 { findAnswer(yytext); }

.                         { }

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

void findAnswer(char *word) {
    // Check if the word is uppercase and print
    if (strlen(word) > 0 && allUpper()) {
        printf("Uppercase Word: %s\n", word);
    }
}

int main() {
    printf("Enter a sentence: ");
    yylex();  // Start lexical analysis
    
    printf("Number of vowels: %d\n", vowels);
    printf("Number of consonants: %d\n", consonants);
    return 0;
}

int yywrap() {
    return 1;
}
