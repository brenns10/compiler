%{
#include "stdio.h"
#include "stdlib.h"
int temp = 0;
int yylex(void);
void yyerror(const char * err) {
	fprintf(stderr, "%s\n", err);
	exit(1);
}
%}
%token NUMBER

%%

start
: line start
| /* empty */
;

line
: expr '\n' { printf("OUT: t%d\n", $1); }
;

expr
: expr '+' term {
	$$ = temp++;
	printf("t%d = t%d + t%d\n", $$, $1, $3);
}
| expr '-' term {
	$$ = temp++;
	printf("t%d = t%d - t%d\n", $$, $1, $3);
}
| term { $$ = $1; }
;

term
: term '*' number {
	$$ = temp++;
	printf("t%d = t%d * t%d\n", $$, $1, $3);
}
| term '/' number {
	$$ = temp++;
	printf("t%d = t%d / t%d\n", $$, $1, $3);;
}
| number { $$ = $1; }
;

number
: NUMBER {
	$$ = temp++;
	printf("t%d = %d\n", $$, $1);
}
| '(' expr ')' { $$ = $1; }
;
%%
int main(int argc, char **argv)
{
	yyparse();
}
