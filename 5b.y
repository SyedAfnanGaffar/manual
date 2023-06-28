%{
    #include<stdio.h>
%}

%token NUM

%left '+''-'
%left '/''*'

%%

| e:e'+'e {$$=$1+$3;}
|   e'-'e {$$=$1-$3;}
|   e'*'e {$$=$1*$3;}
|   e'/'e {$$=$1/$3;}
|   NUM {$$=$1;}
expr:e {printf("Valid Expression\n") ; printf("Result : %d" , $1) ; return 0 ;}

%%

int main()
{
    printf("Enter an arithmetic expression \n") ;
    yyparse() ;
    return 0 ;
}

int yyerror()
{
    printf("Invalid Expression\n") ;
    return 0 ;
}