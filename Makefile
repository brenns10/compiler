.PHONY: all clean

all: main
clean:
	rm -f lex.yy.c y.tab.c y.tab.h *.o main

lex.yy.c: lexer.l
	lex lexer.l

y.tab.c y.tab.h: grammar.y
	yacc -d grammar.y

main: lex.yy.c y.tab.c y.tab.h
	gcc -lfl -o main lex.yy.c y.tab.c


