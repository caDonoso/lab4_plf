%{
	#include <stdio.h>
	#include <stdlib.h>
	extern int yylex () ;
	extern int yylineno; 
	extern FILE* yyin;
	void yyerror(char *s);
	
%}
%token NUMERO
%token CONST
%token VAR
%token PROCEDURE
%token CALL
%token BEGI
%token END
%token IF
%token THEN
%token WHILE
%token DO
%token ODD
%token PUNTO
%token DOSPUNTOS_IGUAL
%token COMA
%token MAS
%token MENOS
%token MULTIPLICACION
%token DIVISION
%token PARENTISIS_INICIAL
%token PARENTISIS_FINAL
%token GATO
%token MENOR_IGUAL
%token MAYOR_IGUAL
%token PUNTO_COMA
%token MENOR
%token MAYOR
%token IGUAL
%token IDENTIFICADOR
%token OTRACOSA
%%
programa: bloque PUNTO
;
bloque: A B C instruccion
;

A: CONST D PUNTO_COMA | 
;

B: VAR E PUNTO_COMA | 
;

C: PROCEDURE IDENTIFICADOR PUNTO_COMA bloque PUNTO_COMA C | 
;

D: IDENTIFICADOR IGUAL NUMERO COMA D | IDENTIFICADOR IGUAL NUMERO
;

E: IDENTIFICADOR COMA E | IDENTIFICADOR
;

instruccion: IDENTIFICADOR DOSPUNTOS_IGUAL expresion | CALL IDENTIFICADOR | BEGI instruccion F END | IF condicion THEN instruccion | WHILE condicion DO instruccion | 
;

F: PUNTO_COMA instruccion F | 
;

expresion: G termino H
;

G: MAS | MENOS | 
;

H: MAS termino H | MENOS termino H | 
;

termino: factor I
;

I: MULTIPLICACION factor I | DIVISION factor I | 
;

factor: IDENTIFICADOR | NUMERO | PARENTISIS_INICIAL expresion PARENTISIS_FINAL
;

condicion: ODD expresion | expresion IGUAL expresion | expresion GATO expresion | expresion MENOR expresion | expresion MENOR_IGUAL expresion | expresion MAYOR expresion | expresion MAYOR_IGUAL expresion
;
%%
void yyerror(char *s){
	printf("Error sint%cctico en la l%cnea: %d\n",160,161,yylineno);
}
int main(int argc, char** argv){
	if(argc==1){
		printf("Error: Falta par%cmetro en la l%cnea de comandos.\n",160,161);
		printf("Uso: sintactico.exe archivo\n");
		exit(1);
	}
	if(argc>2){
		printf("Error: Demasiados par%cmetros en la l%cnea de comandos.\n",160,161);
		printf("Uso: sintactico.exe archivo\n");
		exit(1);
	}
	yyin=fopen(argv[1],"r");
	if(yyin==NULL){
		printf("Error: El archivo de entrada no existe.\n");
		exit(1);
	}
	
	if(yyparse()!=1){
		printf("An%clisis sint%cctico concluido.\n",160,160);
	}

	fclose(yyin);
	return 0;
}
