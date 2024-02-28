#include "global.h"

#define SYMMAX 100		

char leksemy[LEKSMAX];
int ostatniznak = -1;		
int ostatnielem = 0;

int znajdz(char *s){
    int p;
    for (p = ostatnielem; p > 0; p = p - 1)
	if (strcmp(tabsym[p].leksem, s) == 0)
	    return p;
    return 0;
}

int dodaj(char *s, int symbleks){
    int dlug;
    dlug = strlen(s);		
    if (ostatnielem + 1 >= SYMMAX)	
	error("tablica symboli jest pelna");
    if (ostatniznak + dlug + 1 >= LEKSMAX)
	error("tablica symboli jest pelna");
    ostatnielem = ostatnielem + 1;
    tabsym[ostatnielem].symbleks = symbleks;
    tabsym[ostatnielem].leksem = &leksemy[ostatniznak + 1];
    ostatniznak = ostatniznak + dlug + 1;
    strcpy(tabsym[ostatnielem].leksem, s);
    return ostatnielem;
}
