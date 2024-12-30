%{
    #include<stdio.h>  
    #include<math.h>  
    void check(int num);
%}

%%
[0-9]+      {check(atoi(yytext));}
.           {printf("NOT A Valid Number\n");}
%%

void check(int num){
    int n = num;
    int count = 0;
    while(n != 0){
        n = n / 10;
        count++;
    }
    n = num;
    int res = 0;
    while(n > 0){
        res += pow(n % 10, count);
        n /= 10;
    }
    if(num == res) printf("Amstrong\n");
    else printf("Not Amstrong\n");
}

int main(){
    printf("Enter the Number: ");
    yylex();
    return 0;

}

int yywrap(){
    return 1;
}