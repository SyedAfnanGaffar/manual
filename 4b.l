/*
    Program to check whether a given sentence is simple or compund
    Author : SA
    Date : 26-June-2023
*/

%{
    #include<stdio.h>
%}

ws [ \n\t]

%%
{ws}"and"{ws}|{ws}"AND"{ws}|{ws}"or"{ws}|{ws}"OR"{ws}|{ws}"but"{ws}|{ws}"BUT"{ws}|{ws}"because"{ws}|{ws}"nevertheless"{ws} {printf("compound sentence\n") ; exit(0) ;}
. ;
\n return 0 ;

%%

int yywrap() {}

int main()
{
    printf("\n Enter a sentence \n") ;
    yylex() ;
    printf("Simple sentence\n") ;
    exit(0) ;
}