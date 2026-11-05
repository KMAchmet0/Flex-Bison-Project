%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
extern int yylineno;
extern char* yytext;
int yylex();
void yyerror(const char* message);

int errorCount = 0;

void programValid(int errorCount);
void programInvalid(int *errorCount, int line);

%}

/* declare tokens */

%token LITERAL_BOOL LITERAL_CHAR LITERAL_INT LITERAL_DOUBLE LITERAL_STRING NAME_IDENTIFIER NAME_CLASS

%token TOKEN_LCURLY TOKEN_RCURLY TOKEN_LPAREN TOKEN_RPAREN TOKEN_SEMICOLON TOKEN_COMMA TOKEN_COLON TOKEN_ASSIGN TOKEN_DOT
%token TOKEN_PLUS TOKEN_MINUS TOKEN_MULTIPLY TOKEN_DIV TOKEN_LESS_THAN TOKEN_GREATER_THAN TOKEN_EQ TOKEN_NOT_EQ TOKEN_LOGICAL_AND TOKEN_LOGICAL_OR

%token TOKEN_BREAK TOKEN_BOOLEAN TOKEN_CASE TOKEN_CHAR TOKEN_CLASS TOKEN_DEFAULT TOKEN_DO TOKEN_DOUBLE TOKEN_ELSE TOKEN_FOR
%token TOKEN_IF TOKEN_INT TOKEN_NEW TOKEN_OUT TOKEN_PRINT TOKEN_PRIVATE TOKEN_PUBLIC TOKEN_RETURN TOKEN_STRING TOKEN_SWITCH
%token TOKEN_VOID TOKEN_WHILE
%token TOKEN_UNKNOWN

%start Input

%%

Input : /* Empty */
      | Classes { programValid(errorCount); }
      | error { programInvalid(&errorCount, yylineno); }
;

Classes : Classes Class
        | Class
;

Class : TOKEN_PUBLIC TOKEN_CLASS NAME_CLASS TOKEN_LCURLY OptionalMethods TOKEN_RCURLY
;

OptionalMethods : /* Empty */
                | Variables
                | Methods
                | Variables Methods
;

Variables : Variables Variable
          | Variable
;

Variable : OptionalModifier DataType MultipleVariables TOKEN_SEMICOLON
;

OptionalModifier : /* Empty */
                 | Modifier
;

Modifier : TOKEN_PUBLIC
         | TOKEN_PRIVATE
;

DataType : TOKEN_INT
         | TOKEN_CHAR
         | TOKEN_DOUBLE
         | TOKEN_BOOLEAN
         | TOKEN_STRING
;

MultipleVariables : MultipleVariables TOKEN_COMMA SimpleVariable
                  | SimpleVariable
;

SimpleVariable : Member
               | Member TOKEN_ASSIGN Expression
;

Methods : Methods Method
        | Method
;

Method : OptionalModifier DataType Member TOKEN_LPAREN OptionalParameters TOKEN_RPAREN TOKEN_LCURLY OptionalVariables Commands TOKEN_RCURLY
       | OptionalModifier TOKEN_VOID Member TOKEN_LPAREN OptionalParameters TOKEN_RPAREN TOKEN_LCURLY OptionalVariables Commands TOKEN_RCURLY
;

OptionalParameters : /* Empty */ 
                   | Parameters 
;

Parameters : Parameters TOKEN_COMMA Parameter
           | Parameter 
;

Parameter : DataType Member
;

OptionalVariables : /* Empty */
                  | Variables
;

Commands : Commands Command
         | Command
;

Command : Assignment TOKEN_SEMICOLON
        | NAME_CLASS Member TOKEN_ASSIGN NewObject TOKEN_SEMICOLON
        | DoLoop
        | ForLoop
        | IfControl
        | SwitchControl
        | OutPrint
        | Return_
        | TOKEN_BREAK TOKEN_SEMICOLON
        | MethodCall TOKEN_SEMICOLON
;

Assignment : UseMember TOKEN_ASSIGN Expression
;

DoLoop : TOKEN_DO CommandBlock TOKEN_WHILE TOKEN_LPAREN Condition TOKEN_RPAREN TOKEN_SEMICOLON
;

ForLoop : TOKEN_FOR TOKEN_LPAREN Assignment TOKEN_SEMICOLON Condition TOKEN_SEMICOLON Assignment TOKEN_RPAREN CommandBlock
;

IfControl : TOKEN_IF TOKEN_LPAREN Condition TOKEN_RPAREN CommandBlock OptionalElseifs
;

SwitchControl : TOKEN_SWITCH TOKEN_LPAREN Expression TOKEN_RPAREN TOKEN_LCURLY Cases TOKEN_RCURLY
              | TOKEN_SWITCH TOKEN_LPAREN Expression TOKEN_RPAREN TOKEN_LCURLY Cases TOKEN_DEFAULT TOKEN_COLON Commands TOKEN_RCURLY
;

OutPrint : TOKEN_OUT TOKEN_DOT TOKEN_PRINT TOKEN_LPAREN LITERAL_STRING TOKEN_RPAREN TOKEN_SEMICOLON
         | TOKEN_OUT TOKEN_DOT TOKEN_PRINT TOKEN_LPAREN LITERAL_STRING UseMembers TOKEN_RPAREN TOKEN_SEMICOLON
;

Return_ : TOKEN_RETURN TOKEN_SEMICOLON
        | TOKEN_RETURN Expression TOKEN_SEMICOLON
;

CommandBlock : TOKEN_LCURLY Commands TOKEN_RCURLY
;

OptionalElseifs : /* Empty */
                | ElseIfs
                | Else
                | ElseIfs Else
;

ElseIfs : ElseIfs ElseIf
        | ElseIf
;

ElseIf : TOKEN_ELSE TOKEN_IF TOKEN_LPAREN Condition TOKEN_RPAREN CommandBlock
;

Else : TOKEN_ELSE CommandBlock
;

Cases : Cases Case
      | Case
;

Case : TOKEN_CASE Expression TOKEN_COLON Commands
;

UseMembers : UseMembers TOKEN_COMMA UseMember 
           | TOKEN_COMMA UseMember
;

NewObject : TOKEN_NEW NAME_CLASS TOKEN_LPAREN TOKEN_RPAREN
;

MethodCall : UseMember TOKEN_LPAREN OptionalArguments TOKEN_RPAREN
;

OptionalArguments : /* Empty */
                  | Arguments
;

Arguments : Arguments TOKEN_COMMA Expression
          | Expression
;

Condition : Condition TOKEN_LOGICAL_OR Logical
          | Logical
;

Logical : Logical TOKEN_LOGICAL_AND Relation
        | Relation
;

Relation : TOKEN_LPAREN Condition TOKEN_RPAREN
         | Expression TOKEN_LESS_THAN Expression
         | Expression TOKEN_GREATER_THAN Expression
         | Expression TOKEN_EQ Expression
         | Expression TOKEN_NOT_EQ Expression
;

Expression : Expression TOKEN_PLUS Term
           | Expression TOKEN_MINUS Term
           | Term
;

Term : Term TOKEN_MULTIPLY Minus
     | Term TOKEN_DIV Minus
     | Minus
;

Minus : TOKEN_MINUS Primary
      | Primary
;

Primary : TOKEN_LPAREN Expression TOKEN_RPAREN
        | LITERAL_CHAR
        | LITERAL_BOOL
        | LITERAL_INT
        | LITERAL_DOUBLE
        | LITERAL_STRING
        | UseMember
        | MethodCall
        | NewObject
;

UseMember : Member
          | Member TOKEN_DOT Member
;

Member : NAME_IDENTIFIER
       | NAME_CLASS
;

%%

void yyerror(const char *s) {
	/* Commented out because we use our own error handler. */

	//printf("Error: Parsing error - line %d.\n", yylineno);
}

void programValid(int errorCount)
{
	if (errorCount == 0) {
		printf("No errors found\n");
	}
}

void programInvalid(int *errorCount, int line)
{
	printf("Error: Parsing error - line %d.\n", line);

	(*errorCount)++;
	exit(0);
}

int main(int argc, char *argv[]) {

	if (argc >= 2) {
		yyin = fopen(argv[1], "r");
		if (yyin == NULL) {
			yyin = stdin;
			printf("Error: Opening file %s\n", argv[1]);
		} else {
			yyparse();
		  
			if (yyin != NULL) {
				fclose(yyin);
			}
		}		
	} else {
		printf("Error: Missing parameter\n");
	}

	return 0;
}
