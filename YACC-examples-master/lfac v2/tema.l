%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#include <string.h>
%}

%option noyywrap

%%

class { return CLASS; }
intern { return INTERN; }
extern { return EXTERN; }
"int" | "char" | "float" | "bool" | "string"  { yylval.valSTRING = strdup(yytext); return TIPVAR; }
\' [a-zA-Z0-9] \' { return SINGLECHAR; } 
main { return MAIN; }
return { return RETRN; }
var { return VAR; }
begin { return BGIN; }
print { return PRINT; }
if { return IF; }
then { return THEN; }
else { return ELSE; }
while { return WHILE; }
do { return DO; }
true { return TRUE; }
false { return FALSE; }
and { return AND; }
or { return OR; }
equal { return EQUAL; }
le { return LE; }
gl { return GL; }
ge { return GE; }
end { return END; }
[a-zA-Z][a-zA-Z]* { yylval.valSTRING = strdup(yytext); return ID; }
[1-9][0-9]* { yylval.valINT = atoi(yytext);return NR; }
[1-9][0-9]*\.[0-9]+ { yylval.valFLOAT = atof(yytext); return NRFLOAT; }
\"[a-zA-Z0-9]*\" { yylval.valSTRING = strdup(yytext); return STRING; } 
[ \t\f]+ ;
"\r\n"|"\n" {yylineno++;}
. {return yytext[0];}

%%


