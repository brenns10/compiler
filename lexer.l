%{
#include "y.tab.h"
%}
DIGIT	[0-9]
SPACE	[ \t]
%%
{DIGIT}+	yylval = atoi(yytext); return NUMBER;
{SPACE}+	/* nop */
\n		return '\n';
.		return yytext[0];
