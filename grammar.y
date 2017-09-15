%{
#include "stdio.h"
#include "stdlib.h"
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
: expr '\n' { printf("= %d\n", $1); }
;

expr
: expr '+' term { $$ = $1 + $3; }
| expr '-' term { $$ = $1 - $3; }
| term { $$ = $1; }
;

term
: term '*' number { $$ = $1 * $3; }
| term '/' number { $$ = $1 / $3; }
| number { $$ = $1; }
;

number
: NUMBER { $$ = $1; }
| '(' expr ')' { $$ = $1; }
;
%%
int main(int argc, char **argv)
{
	yyparse();
}
