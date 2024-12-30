%{
    #include<stdio.h>  
    #include<stdbool.h> 
    #include<math.h> 
%}

%%
[0-9]+      {
                int num = atoi(yytext);
                
                if(num == 1 || num == 0) printf("NOT Prime\n");
                bool prime = true;
                for(int i = 2; i <= sqrt(num); i++){
                    if(num % i == 0) prime = false;
                }
                if(prime) printf("Prime\n");
                else printf("NOT Prime\n");
            }

.           {printf("NOT Prime\n");}
%%

int main(){
    printf("Enter the Number: ");
    yylex();
    return 0;

}

int yywrap(){
    return 1;
}