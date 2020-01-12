/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    VAR = 258,
    PRINT = 259,
    NR = 260,
    RETURN = 261,
    TIPVAR = 262,
    ID = 263,
    SINGLECHAR = 264,
    STRING = 265,
    BGIN = 266,
    END = 267,
    MAIN = 268,
    IF = 269,
    CLASS = 270,
    INTERN = 271,
    EXTERN = 272,
    INT = 273,
    ELSE = 274,
    RETRN = 275,
    AND = 276,
    OR = 277,
    EQUAL = 278,
    GE = 279,
    LE = 280,
    GL = 281,
    THEN = 282,
    WHILE = 283,
    DO = 284,
    CHAR = 285,
    BOOL = 286,
    FLOAT = 287,
    NRFLOAT = 288,
    FALSE = 289,
    TRUE = 290
  };
#endif
/* Tokens.  */
#define VAR 258
#define PRINT 259
#define NR 260
#define RETURN 261
#define TIPVAR 262
#define ID 263
#define SINGLECHAR 264
#define STRING 265
#define BGIN 266
#define END 267
#define MAIN 268
#define IF 269
#define CLASS 270
#define INTERN 271
#define EXTERN 272
#define INT 273
#define ELSE 274
#define RETRN 275
#define AND 276
#define OR 277
#define EQUAL 278
#define GE 279
#define LE 280
#define GL 281
#define THEN 282
#define WHILE 283
#define DO 284
#define CHAR 285
#define BOOL 286
#define FLOAT 287
#define NRFLOAT 288
#define FALSE 289
#define TRUE 290

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 11 "tema.y" /* yacc.c:1909  */
 
  int valINT;
  float valFLOAT;
  char valCHAR;
  char* valSTRING;
  int valBOOL;
  var variabila;
  var* varvector;
  varval valoare;

#line 135 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
