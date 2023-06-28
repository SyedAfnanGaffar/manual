/*  Program to evaluate an arithmetic expression involving operators +,-,*,/
    Author : SA
    Date : 26-June-2023
*/

%{
    #include"5b.tab.h"
%}

%%

[0-9]+ {yylval = atoi(yytext) ; return NUM ;}
[\t] ;
[\n] {return 0 ;}
. {return yytext[0] ;}

%%

int yywrap() {}

