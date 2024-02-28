// === Analizator skladniowy === 
// funkcje odpowiadaja symbolom nieterminalnym
// produkcje przetlumaczone na kod tych funkcji

#include "global.h"

parser() {
    //start -> lista KONIEC
    lista();
    pobierz_leksem(KONIEC);
}

lista() {
    switch(biezacy_leksem){
    
        //lista -> wyr ';' lista
        case LICZBA:
        case ID:
        case '(':
        case ';':
            wyr();
            pobierz_leksem(';');
            emituj(NL, BRAK);
            lista();
            break;
            
        //lista -> eps
        default:
            break; 
    }
    
}

wyr(){
    switch(biezacy_leksem){
    
        //wyr -> skl resztaskl
        case LICZBA:
        case ID:
        case '(':
            skl();
            resztaskl();
	    break;
	       
	default:
	    error("blad skladni 'skl'");
    }
}

resztaskl(){
    switch(biezacy_leksem){
        
        //resztaskl -> '+' skl resztaskl
        case '+':
           pobierz_leksem('+');
           skl();
           emituj('+');
           resztaskl();
           break;
           
        //resztaskl -> '-' skl resztaskl          
        case '-':
           pobierz_leksem('-');
           skl();
           emituj('-');
           resztaskl();
           break;
           
        //resztaskl -> eps
        default:
           break;
    }
}

skl(){
    switch(biezacy_leksem){
    
        //skl -> czyn resztaczyn
        case LICZBA:
        case ID:
        case '(':
            czyn();
            resztaczyn();
	    break;
	    
	default:
	    error("blad skladni 'skl'");
    }
}


resztaczyn() {
    int tmp;
    switch(biezacy_leksem){
    
        //resztaczyn -> '*' czyn resztaczyn              
        //resztaczyn -> '/' czyn resztaczyn             
        //resztaczyn -> DIV czyn resztaczyn             
        //resztaczyn -> MOD czyn resztaczyn             
	case '*':
	case '/':
	case DIV:
	case MOD:
	    tmp = biezacy_leksem;
	    pobierz_leksem(tmp);
	    czyn();
	    emituj(tmp, BRAK);
            resztaczyn();
	    break;
	    
        //skl_kont -> eps
	default:
	    break;
	}
}

czyn(){
    switch(biezacy_leksem) {
        
        //czyn -> '(' wyr ')' 
        case '(':
	    pobierz_leksem('(');
	    wyr();
	    pobierz_leksem(')');
	    break;
	    
        //czyn -> LICZBA
        case LICZBA:		
            emituj(LICZBA, lekswart);
	    pobierz_leksem(LICZBA);
	    break;
	
	//czyn -> ID
        case ID:
            emituj(ID, lekswart);
	    pobierz_leksem(ID);
	    break;
	    
        default:
	    error("blad skladni 'czyn'");
    }
}

pobierz_leksem(int s){
    if (biezacy_leksem == s)
	biezacy_leksem = lekser();
    else
	error("blad skladni ?!?");
}
