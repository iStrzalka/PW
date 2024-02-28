#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define BROZM 128 

#define BRAK -1
#define EOS '\0'

#define LICZBA 256
#define DIV 257
#define MOD 258
#define ID 259
#define KONIEC 260
#define NL 10

int lekswart; 
int nrwiersza;

struct tabsymelem{
       char *leksem;
       int symbleks;
       };

#define LEKSMAX 999		   
struct tabsymelem tabsym[LEKSMAX]; 

int biezacy_leksem;

