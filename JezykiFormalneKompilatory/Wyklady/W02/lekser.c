#include "global.h"

char leksbuf[BROZM];
int nrwiersza = 1;
int lekswart = BRAK;

int lekser(){
    int t;
    while (1) {
	t = getchar();
	if (t == ' ' || t == '\t');	
	else if (t == '\n')
	    nrwiersza = nrwiersza + 1;
	else if (isdigit(t)) {
	    ungetc(t, stdin);	
	    scanf("%d", &lekswart);
	    return LICZBA;
	} else if (isalpha(t)) {
	    int p, b = 0;
	    while (isalnum(t)) {
		leksbuf[b] = t;
		t = getchar();
		b = b + 1;
		if (b >= BROZM)
		    error("przepelnienie bufora leksera");
	    }
	    leksbuf[b] = EOS;
	    if (t != EOF)
		ungetc(t, stdin);
	    p = znajdz(leksbuf);
	    if (p == 0)
		p = dodaj(leksbuf, ID);
	    lekswart = p;
	    return tabsym[p].symbleks;
	} else if (t == EOF)
	    return KONIEC;
	else {
	    lekswart = BRAK;
	    return t;
	}
    }
}

