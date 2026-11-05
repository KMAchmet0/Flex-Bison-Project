/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_MYPARSER_TAB_H_INCLUDED
# define YY_YY_MYPARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    LITERAL_BOOL = 258,            /* LITERAL_BOOL  */
    LITERAL_CHAR = 259,            /* LITERAL_CHAR  */
    LITERAL_INT = 260,             /* LITERAL_INT  */
    LITERAL_DOUBLE = 261,          /* LITERAL_DOUBLE  */
    LITERAL_STRING = 262,          /* LITERAL_STRING  */
    NAME_IDENTIFIER = 263,         /* NAME_IDENTIFIER  */
    NAME_CLASS = 264,              /* NAME_CLASS  */
    TOKEN_LCURLY = 265,            /* TOKEN_LCURLY  */
    TOKEN_RCURLY = 266,            /* TOKEN_RCURLY  */
    TOKEN_LPAREN = 267,            /* TOKEN_LPAREN  */
    TOKEN_RPAREN = 268,            /* TOKEN_RPAREN  */
    TOKEN_SEMICOLON = 269,         /* TOKEN_SEMICOLON  */
    TOKEN_COMMA = 270,             /* TOKEN_COMMA  */
    TOKEN_COLON = 271,             /* TOKEN_COLON  */
    TOKEN_ASSIGN = 272,            /* TOKEN_ASSIGN  */
    TOKEN_DOT = 273,               /* TOKEN_DOT  */
    TOKEN_PLUS = 274,              /* TOKEN_PLUS  */
    TOKEN_MINUS = 275,             /* TOKEN_MINUS  */
    TOKEN_MULTIPLY = 276,          /* TOKEN_MULTIPLY  */
    TOKEN_DIV = 277,               /* TOKEN_DIV  */
    TOKEN_LESS_THAN = 278,         /* TOKEN_LESS_THAN  */
    TOKEN_GREATER_THAN = 279,      /* TOKEN_GREATER_THAN  */
    TOKEN_EQ = 280,                /* TOKEN_EQ  */
    TOKEN_NOT_EQ = 281,            /* TOKEN_NOT_EQ  */
    TOKEN_LOGICAL_AND = 282,       /* TOKEN_LOGICAL_AND  */
    TOKEN_LOGICAL_OR = 283,        /* TOKEN_LOGICAL_OR  */
    TOKEN_BREAK = 284,             /* TOKEN_BREAK  */
    TOKEN_BOOLEAN = 285,           /* TOKEN_BOOLEAN  */
    TOKEN_CASE = 286,              /* TOKEN_CASE  */
    TOKEN_CHAR = 287,              /* TOKEN_CHAR  */
    TOKEN_CLASS = 288,             /* TOKEN_CLASS  */
    TOKEN_DEFAULT = 289,           /* TOKEN_DEFAULT  */
    TOKEN_DO = 290,                /* TOKEN_DO  */
    TOKEN_DOUBLE = 291,            /* TOKEN_DOUBLE  */
    TOKEN_ELSE = 292,              /* TOKEN_ELSE  */
    TOKEN_FOR = 293,               /* TOKEN_FOR  */
    TOKEN_IF = 294,                /* TOKEN_IF  */
    TOKEN_INT = 295,               /* TOKEN_INT  */
    TOKEN_NEW = 296,               /* TOKEN_NEW  */
    TOKEN_OUT = 297,               /* TOKEN_OUT  */
    TOKEN_PRINT = 298,             /* TOKEN_PRINT  */
    TOKEN_PRIVATE = 299,           /* TOKEN_PRIVATE  */
    TOKEN_PUBLIC = 300,            /* TOKEN_PUBLIC  */
    TOKEN_RETURN = 301,            /* TOKEN_RETURN  */
    TOKEN_STRING = 302,            /* TOKEN_STRING  */
    TOKEN_SWITCH = 303,            /* TOKEN_SWITCH  */
    TOKEN_VOID = 304,              /* TOKEN_VOID  */
    TOKEN_WHILE = 305,             /* TOKEN_WHILE  */
    TOKEN_UNKNOWN = 306            /* TOKEN_UNKNOWN  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MYPARSER_TAB_H_INCLUDED  */
