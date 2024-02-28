#include "global.h"

struct tabsymelem slowaklucz[] = {
    "div", DIV,
    "mod", MOD,
    0, 0
};

void init(){
    //inicjalizacja tablicy symboli
    struct tabsymelem *p;
    for (p = slowaklucz; p->symbleks; p++)
	dodaj(p->leksem, p->symbleks);

    //inicjalizacja leksera
    biezacy_leksem=0;
    pobierz_leksem(0);
}
