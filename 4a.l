/*	Lex program to recognize a valid arithmetic expression and to recognize identifiers and operators present and print them separately
	Author : SA
	Date : 25-June-2023
*/

%{
	#include<stdio.h>
	int ext(int) ;
	int a[]={0,0,0,0} , valid = 1 , operandCount = 0 , bracketCount = 0 , i ;
%}

%x oper

%%

"(" {bracketCount++ ; }
")" {bracketCount-- ; }
[a-zA-Z0-9]+ {BEGIN oper ; operandCount++ ; }
<oper>"+" {if(valid){valid = 0 ; i = 0 ;} else ext(0) ;}
<oper>"-" {if(valid){valid = 0 ; i = 1 ;} else ext(0) ;}
<oper>"*" {if(valid){valid = 0 ; i = 2 ;} else ext(0) ;}
<oper>"/" {if(valid){valid = 0 ; i = 3 ;} else ext(0) ;}
<oper>"(" {bracketCount++ ;}
<oper>")" {bracketCount-- ;}
<oper>[a-zA-Z0-9]+ {
						operandCount++ ; 
						if(valid == 0)
						{
							valid = 1 ; a[i]++ ;
						}
					 	else ext(0) ;
					}
<oper>"\n" {if(valid == 1 && bracketCount == 0){printf("Valid expression\n") ; return 0 ;}else ext(0) ; }
.\n {ext(0) ;}

%%

int yywrap() {}

int ext(int x)
{
	printf("\n Invalid Expression \n") ;
	exit(0) ;
} 

int main()
{
	printf("\nEnter an arithmetic expression \n") ;
	yylex() ;
	printf("Number of operands = %d\n" , operandCount) ;
	printf("Number of + = %d\n" , a[0]) ;
	printf("Number of - = %d\n" , a[1]) ;
	printf("Number of * = %d\n" , a[2]) ;
	printf("Number of / = %d\n" , a[3]) ;
	return 0 ;
}
