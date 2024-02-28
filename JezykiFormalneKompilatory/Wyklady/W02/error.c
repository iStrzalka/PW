#include "global.h"

void error(char *m){
    fprintf(stderr, "BLAD: linia %d: %s\n", nrwiersza, m);
    exit(1);
}
