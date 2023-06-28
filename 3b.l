/*	Program to count the numbe of comment lines in a given C program . Also eliminate them and copy it to a separate file.
	Author : SA
	Date : 24-July-2023 
*/

%{
	#include<stdio.h>
	int commentCount = 0 ;
%}

%x CMNT

%%

"/*" {BEGIN CMNT;}
<CMNT>. ;
<CMNT>"*/" {BEGIN 0 ; commentCount++ ;}

%%

int yywrap()
{}

int main(int argc , char *argv[])
{
	if(argc != 3)
	{
		printf("Usage : %s <src_file>  <dest_file> \n" , argv[0]) ;
		return 0 ;
	}

	yyin = fopen(argv[1],"r") ;
	yyout = fopen(argv[2],"w") ;
	
	yylex() ;

	printf("\n Number of multiline comments = %d" , commentCount) ;
	return 0 ;
} 
