/*  Program to recognize the number of identifiers in a given input file
    Author : SA
    Date : 26-June-2023
*/

%{
    #include<stdio.h>
    int identifierCount ;
%}

e [=][ ]*[0-9]+
ws [ (\r\n)\t]*
identifier [_a-zA-Z][_a-zA-Z0-9]*
dataType "int"|"float"|"clear"|"double"|"long"|"short"|"unsigned"

%x defn

%%
{dataType} {BEGIN defn ;}
<defn>{ws}{identifier}{ws}\, {identifierCount++ ; }
<defn>{ws}{identifier}{ws}\; {identifierCount++ ; BEGIN 0 ;}
<defn>{ws}{identifier}{ws}{e}{ws}\, {identifierCount++ ; }
<defn>{ws}{identifier}{ws}{e}{ws}\; {identifierCount++ ; BEGIN 0 ;}
<*>. ;
<*>\n ;

%%

int yywrap() {}

int main(int argc , char *argv[])
{
    if(argc != 2)
    {
        printf("\n Usage : \n %s <src_file>\n" , argv[0]) ;
        exit(0) ;
    }
    
    yyin = fopen(argv[1] , "r") ;

    yylex() ;

    printf("The number of identifiers in the source file are: %d\n" , identifierCount) ;
}
