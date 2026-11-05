%option noyywrap

%option yylineno

%{
#include <stdio.h>

#include "myParser.tab.h"

%}
%x SINGLELINE MULTILINE
%{

%}

 /* Redefinition of tokens. */

whitespace       [ \t\n\r]+
number           [0-9]+
floating         {number}?("."{number})?([eE][+-]?{number})?"d"
char_lit         \'([^'\\]|\\['"?\\abfnrtv0])\'
str_lit          \"(\\.|[^\"])*\"
boolean_lit      ("true"|"false")
classname        [A-Z][a-zA-Z0-9_]*
id               [a-zA-Z_][a-zA-Z0-9_]*

%%
 
<INITIAL>"//"         { BEGIN(SINGLELINE); }
<SINGLELINE>.*        { /* Ignore content */ }
<SINGLELINE>"\n"      { BEGIN(INITIAL); }
 
<INITIAL>"/*"         { BEGIN(MULTILINE); }
<MULTILINE>(.|\n)     { /* Ignore content */ }
<MULTILINE>"*/"       { BEGIN(INITIAL); }

{whitespace}     {/* Ignore */ }

"{"    { return TOKEN_LCURLY; }
"}"    { return TOKEN_RCURLY; }
"("    { return TOKEN_LPAREN; }
")"    { return TOKEN_RPAREN; }
";"    { return TOKEN_SEMICOLON; }
","    { return TOKEN_COMMA; }
":"    { return TOKEN_COLON; }
"="    { return TOKEN_ASSIGN; }
"."    { return TOKEN_DOT; }
"+"    { return TOKEN_PLUS; }
"-"    { return TOKEN_MINUS; }
"*"    { return TOKEN_MULTIPLY; }
"/"    { return TOKEN_DIV; }
"<"    { return TOKEN_LESS_THAN; }
">"    { return TOKEN_GREATER_THAN; }
"=="   { return TOKEN_EQ; }
"!="   { return TOKEN_NOT_EQ; }
"&&"   { return TOKEN_LOGICAL_AND; }
"||"   { return TOKEN_LOGICAL_OR; }

"break"          { return TOKEN_BREAK; }
"boolean"        { return TOKEN_BOOLEAN; }
"case"           { return TOKEN_CASE; }
"char"           { return TOKEN_CHAR; }
"class"          { return TOKEN_CLASS; }
"default"        { return TOKEN_DEFAULT; }
"do"             { return TOKEN_DO; }
"double"         { return TOKEN_DOUBLE; }
"else"           { return TOKEN_ELSE; }
"for"            { return TOKEN_FOR; }
"if"             { return TOKEN_IF; }
"int"            { return TOKEN_INT; }
"new"            { return TOKEN_NEW; }
"out"            { return TOKEN_OUT; }
"print"("ln")?   { return TOKEN_PRINT; }
"private"        { return TOKEN_PRIVATE; }
"public"         { return TOKEN_PUBLIC; }
"return"         { return TOKEN_RETURN; }
"String"         { return TOKEN_STRING; }
"switch"         { return TOKEN_SWITCH; }
"void"           { return TOKEN_VOID; }
"while"          { return TOKEN_WHILE; }

{boolean_lit}    { return LITERAL_BOOL; }
{classname}      { return NAME_CLASS; }
{id}             { return NAME_IDENTIFIER; }
{char_lit}       { return LITERAL_CHAR; }
{number}         { return LITERAL_INT; }
{floating}       { return LITERAL_DOUBLE; }
{str_lit}        { return LITERAL_STRING; }

.           { return TOKEN_UNKNOWN; }

%%
