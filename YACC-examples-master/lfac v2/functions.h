#include <stdio.h>
#include <string.h>
#include <stdlib.h>


typedef struct var
{
   int valint;
   char valchar;
   char* valstring;
   float valfloat;
   int valbool;
   char varscope[15];
   char tip[15];
   char nume[64];
   int decl;
   int init;
}var;

typedef struct varval
{
   int valint;
   char valchar;
   char* valstring;
   float valfloat;
   int valbool;
   char tip[15]; 
}varval;

var programvars[256];
int nrvar = 0;
var listdecl[50];
int nrdecl;

int verifdeclvar (var x, char* scopex)
{
    for (int i = 0; i < nrvar; i++)
    {
        if (strcmp(programvars[i].nume, x.nume) == 0)
        {
           if (strcmp(programvars[i].varscope, x.varscope) == 0)
           {
               return 1;
           }
        }
    }
    return -1;
}

var* curentlistdecl (var* list, var x, int lungime)
{
   var* curentlist = (var*)malloc(sizeof(size_t) * (lungime + 1));
   for (int i = 0; i < lungime; i++)
   {
       curentlist[i] = list[i];
   }
   curentlist[lungime] = x;
   return curentlist;
}

void atribuiretiplist(var* list, char* tip2, int lungime, char* scopex)
{
    if (strcmp(tip2, "int") != 0 && strcmp(tip2, "float") !=0 && strcmp(tip2, "char") !=0 && strcmp(tip2, "string") !=0)
    {
      printf ("Variabilei nu ii poate fi atribuit tipul : %s", tip2);
    }
    else
    {
      for (int i = 0; i < lungime; i++)
      {
          strcpy(list[i].tip, tip2);
          strcpy(list[i].varscope, scopex);
      }      
    }
}

void adaugarelist (var list[], int lungime)
{
    for (int i = 0; i < lungime; i++)
    {
        programvars[nrvar] = list[i];
        nrvar++;
    }
}

void initializare (var x, varval v)
{
    if (strcmp(x.tip, v.tip) != 0)
    {
        printf("Variabilei %s nu se poate initializa cu tipul %s de date, trebuie sa folositi tipul %s", x.nume, v.tip, x.tip);
    }
    else
    {
        if (strcmp(x.tip, "float") == 0)
        {
            x.valfloat = v.valfloat;
        }
        if (strcmp(x.tip, "int") == 0)
        {
            x.valint = v.valint;
        }
        if (strcmp(x.tip, "char") == 0)
        {
            x.valchar = v.valchar;
        }
        if (strcmp(x.tip, "string") == 0)
        {
            strcpy(x.valstring, v.valstring);
        }
    }
    
}