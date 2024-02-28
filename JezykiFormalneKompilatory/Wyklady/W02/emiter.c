#include "global.h"

void emituj(int s, int swart){
    switch (s) {
    case '+':
    case '-':
    case '*':
    case '/':
	printf("%c ", s);
	break;
    case DIV:
	printf("DIV ");
	break;
    case MOD:
	printf("MOD ");
	break;
    case LICZBA:
	printf("%d ", swart);
	break;
    case ID:
	printf("%s ", tabsym[swart].leksem);
	break;
    case NL:
	printf("\n");
	break;
    default:
	printf("leksem %d, wartosc %d ", s, swart);
    }
}

