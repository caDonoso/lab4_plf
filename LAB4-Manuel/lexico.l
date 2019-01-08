%option noyywrap
%option yylineno
%{ 
	#include <stdio.h>
	#include <stdlib.h>
	#include "sintactico.tab.h"
%}
saltoLinea [\n]
numerosEnterosPositivos [0-9]+
identificador[a-zA-Z]([a-zA-Z]|[0-9])*
%%
"begin" {return(BEGI);}
"const" {return(CONST);}
"call"  {return(CALL);}
"while" {return(WHILE);}
"do" {return(DO);}
"if" {return(IF);}
"var" {return(VAR);}
"odd" {return(ODD);}
"procedure" {return(PROCEDURE);}
"then" {return(THEN);}
"end" {return(END);}
"." {return(PUNTO);}
":=" {return(DOSPUNTOS_IGUAL);}
"," {return(COMA);}
"+" {return(MAS);}
"-" {return(MENOS);}
"*" {return(MULTIPLICACION);}
"/" {return(DIVISION);}
"(" {return(PARENTISIS_INICIAL);}
")" {return(PARENTISIS_FINAL);}
"#" {return(GATO);}
"<=" {return(MENOR_IGUAL);}
">=" {return(MAYOR_IGUAL);}
";" {return(PUNTO_COMA);}
"<" {return(MENOR);}
">" {return(MAYOR);}
"=" {return(IGUAL);}
{numerosEnterosPositivos} {return (NUMERO);}
{identificador} {return(IDENTIFICADOR);}
(\t|" ")(\t|" ")* {;}
{saltoLinea} {;}
.        {return(OTRACOSA);}
%%
