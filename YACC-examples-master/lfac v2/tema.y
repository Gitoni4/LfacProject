%{
#include "functions.h"
extern FILE* yyin;
extern char* yytext;
extern int yylineno;

%}


%union 
{ 
  int valINT;
  float valFLOAT;
  char valCHAR;
  char* valSTRING;
  int valBOOL;
  var variabila;
  var* varvector;
  varval valoare;
}

%token VAR PRINT NR RETURN TIPVAR ID SINGLECHAR STRING BGIN END MAIN IF CLASS INTERN EXTERN INT ELSE RETRN AND OR EQUAL GE LE GL THEN WHILE DO CHAR BOOL FLOAT NRFLOAT FALSE TRUE
%type <valINT> NR
%type <valFLOAT> NRFLOAT
%type <valSTRING> ID STRING TIPVAR
%type <variabila> declaratie 
%type <varvector> listadeclaratie 
%type <varvector> listedeclaratie
%type <valoare> initializare
%type <valCHAR> SINGLECHAR
 

%start program
%left '+' '-'
%left '*' '/'

%%

program: clase functii declaratii instructiuni 

clase: clasa 
     | clase clasa 
     ;

clasa: CLASS ID '{' corpclasa '}' ';'
     ;

corpclasa: INTERN ':' varinterne EXTERN ':' varexterne
         ;

varinterne: declaratii
          ;

varexterne: declaratii
          ;

functii: functie 
       | functii functie 
       ;

functie: ID '(' argumente ')' '-' '>' TIPVAR '{' bloc '}' ';'
       ;

argumente: TIPVAR ID 
         | TIPVAR ID ',' argumente
         ;

declaratii:  listedeclaratie ';'
    	   | declaratii listedeclaratie ';'	
     	   ;

listedeclaratie: VAR TIPVAR listadeclaratie ';' 
                 { 
                     atribuiretiplist($3, $2, nrdecl, "global"); 
                     adaugarelist($3, nrdecl); 
                 }
               ;

listadeclaratie: listadeclaratie ',' declaratie 
                 {
                     if (verifdeclvar($3, "global") == 1) 
                     {  
                          printf("Variabila : %s a fost deja declarata", $1->nume);
                          $$ = $1;
                     }    
                     else
                     {
                          $$ = curentlistdecl($1, $3, nrdecl);  
                     }
                 }
               | declaratie 
                 { 
                     if (verifdeclvar($1, "global") == 1) 
                     {  
                          printf("Variabila : %s a fost deja declarata", $1.nume);
                     }
                     else
                     {
                            nrdecl = 0;
                            $$ = curentlistdecl (NULL, $1, nrdecl);
                     }
                 }
               ;

declaratie: ID { strcpy($$.nume, $1); }
          | ID '-' '>' initializare 
            { 
              strcpy($$.nume, $1); 
              initializare($$, $4); 
            }
          ;

initializare: NR
              { 
                 strcpy($$.tip, "int");
                 $$.valint = $1;   
              }
            | NRFLOAT
              {
                     strcpy($$.tip, "float");
                     $$.valfloat = $1;
              }
            | SINGLECHAR
              {
                     strcpy($$.tip, "char");
                     $$.valchar = $1;
              }
            |  STRING 
              {
                     strcpy($$.tip, "string");
                     strcpy($$.valstring, $1);
              }  
            ; 
      
instructiuni: MAIN BGIN bloc END  
     	     ;
     
bloc: instructiune 
    | instructiune bloc
    ;

instructiune: ID '-' '>' expresie  ';'
            | ID '[' NR ']' '-' '>' expresie ';'
            | PRINT '(' NR ')' ';'
            | PRINT '(' ID ')' ';'
            | instrIF ';'
            | instrWHILE ';'
            | RETRN ID ';'
            | RETRN NR ';'
            | RETRN NRFLOAT ';'
            | RETRN BOOL ';'
            ;

instrIF: IF '(' listaexprIF ')' THEN '{' bloc '}' 
       | IF '(' listaexprIF ')' THEN '{' bloc '}' ELSE '{' bloc '}'
       ;

listaexprIF: expresieIF AND listaexprIF
           | expresieIF OR listaexprIF
           | expresieIF
           ;

expresieIF: expresie  EQUAL  expresie
          | expresie  LE  expresie
          | expresie  GE  expresie
          | expresie  GL  expresie
          ;

instrWHILE: WHILE '(' listaexprWHILE ')' DO '{' bloc '}'
          ;
         
listaexprWHILE: expresieWHILE AND listaexprWHILE
              | expresieWHILE OR listaexprWHILE
              | expresieWHILE { printf("gata aici\n"); }
              ;

expresieWHILE: expresie  EQUAL  expresie { printf("gata si aici\n"); }
             | expresie  LE  expresie
             | expresie  GE  expresie
             | expresie  GL  expresie
             ;

expresie: expresie '+' expresie 
	 | expresie '-' expresie 
	 | expresie '*' expresie 
	 | expresie '/' expresie 
        | NR 
        | NRFLOAT 
        | ID 
        | SINGLECHAR 
        ;

%%

int yyerror(char * s)
{
  printf("\n!!!  eroare: %s la linia:%d\n",s,yylineno);
}



int main(int argc, char** argv)
{
  yyin=fopen(argv[1],"r");
  yyparse();
}