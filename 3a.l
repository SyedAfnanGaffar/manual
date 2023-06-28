/*  Program to count the number of characters , words , spaces and lines from a given input file
	Author : SA
 	Date : 24-June-2023  
*/

%{
	#include<stdio.h>
	int wordCount = 0 , charCount = 0 , lineCount = 0 , blankCount = 0 ;
	char inputfile[20] ;
%}

word [a-zA-ZA0-9]+
eol [\n]

%%
{word} {wordCount++ ; charCount += yyleng ;}
{eol} {lineCount++ ; charCount++ ;}
[" "] {blankCount++ ;}
[\t] {blankCount += 8 ; charCount++ ;}
. {charCount++ ;}

%%

int yywrap()
{
}

int main()
{
	printf("\n Enter the name of the input file ...\n") ;
	scanf("%s" , inputfile) ;
	yyin = fopen(inputfile , "r") ;
	
	yylex() ;

	printf("Number of characters = %d \n" , charCount) ;
	printf("Number of words = %d \n" , wordCount) ;
	printf("Number of spaces = %d \n" , blankCount) ;
	printf("Number of lines = %d \n" , lineCount) ;

return 0 ;
}

