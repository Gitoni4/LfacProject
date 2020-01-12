lex tema.l
yacc -d tema.y
gcc lex.yy.c y.tab.c -ly -o tema

