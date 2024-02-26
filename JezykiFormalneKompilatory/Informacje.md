### MATERIAŁY DO KURSU:
## Wykłady
### Wykład 1. Wprowadzenie
Cel przedmiotu - metody przetwarzania tekstu. Kompilatory, interpretery, translatory. Przykłady wykorzystania technologii tego typu (języki programowania, opisu danych, formatowania, DSL).
Przykład z języka naturalnego i prosty element z języków programowania. Analiza struktury zdania, tworzenie drzewa składni.\
Omówienie ogólnej wewnętrznej struktury kompilatora (preprocesor, analiza leksykalna, analiza składniowa, analiza semantyczna, generowanie kodu pośredniego, optymalizacja, generowanie kodu wynikowego). Rozróżnienie przód i tył kompilatora.\
Demonstracja etapów analizy na przykładzie clang.
## Wykład 2. Mój pierwszy język i analizator składniowy
Przykład bardzo prostej gramatyki w BNF. Wyjaśnienie elementów gramatyki: produkcja, symbol terminalny, nieterminalny, symbol startowy. Demonstracja stopniowego rozszerzania możliwości języka programowania poprzez dopisywanie kolejnych produkcji. Budowanie drzew wyprowadzenia.
Omówienie budowy i działania prostego analizatora leksykalno-składniowego. Zasady przenoszenia gramatyki na kod analizatora opartego na rekurencyjnym wywoływaniu funkcji. Prosty analizator leksykalny. Połączenie analizatora leksykalnego ze składniowym. Obsługa błędów. Przykłady w Pythonie (walidator) i C (konwerter).
## Wykład 3. Analizator leksykalny - wyrażenia regularne
Język regularny, a wyrażenie regularne. Mapowanie elementów wyrażenia regularnego na operacje na językach (suma, złączenie, domknięcie Kleenego, domknięcie dodatnie). Prawa algebraiczne dla wyrażeń regularnych. Skróty w wyrażeniach POSIX (., [], +, ?, ^, $ ), Perl (\d, \s, \S). Niedeterministyczny automat skończony. Przekształcanie: wyrażenie regularne -> drzewo wyrażenia -> NFA (NAS). Przykłady.
## Wykład 4. Piszemy kompilator 1
Wprowadzenie do środowiska ANTLR i LLVM. Omówienie kolejnych etapów przetwarzania. Przykłady demonstrujące możliwości ANTLR (przód kompilatora) oraz eksperymentowanie z narzędziami LLVM (tył kompilatora). Połączenie wszystkich etapów i stworzenie pierwszego kompilatora do języka PLwypisz.
## Wykład 5. Implementacja wyrażeń regularnych
Operacja domknięcia-epsilon. Metody determinizacji automatu skończonego na przykładach. Minimalizacja deterministycznego automatu skończonego (DAS, ang. DFA), na przykładach. Potencjalne problemy: ślepe końce w DFA, DFA większe od NFA. Implementacja (przechowywanie automatu (macierz sąsiedztwa, tablica przejść, wektory przejść), śledzenie pracy automatu). Przykłady: łączenie wielu wyrażeń jak w analizatorze leksylalnym, zachłanność wyrażeń, zliczanie dopasowań, podstawienia.
## Wykład 6. Piszemy kompilator 2
Techniki i przykłady ich wykorzystania do tworzenia kompilatora w technologii ANTLR+LLVM.
Przykład readwrite (wywoływanie funkcji bibliotecznych, tablica symboli-zmiennych).
Przykład simplecalc (obsługa wyrażeń artmetycznych przy pomocy stosu, sygnalizacja błędów).
Przykład realcalc (dwa typy zmiennych, tablica zmiennych z typami, kolejność wykonywania działań, rzutowanie jawne i niejawne).
Definicje: typowanie silne i słabe, statyczne i dynamiczne.
## Wykład 7. Generator analizatorów leksykalnych - Lex
Zasada działania i schemat generatorów analizatorów leksykalnych. Generator analizatorów leksykalnych (Lex/Flex). Struktura i składnia plików *.l. Omówienie schematu generowania plików wynikowych w C. Przedstawianie kolejnych możliwości na przykładach: counter.l, wc.l, calc.l, romans.l, comment_density.l
## Wykład 8. Piszemy kompilator 3
Techniki i przykłady ich wykorzystania do tworzenia kompilatora w technologii ANTLR+LLVM.
Przykład block (sterowanie logiką przepływu programu, komenda br, instrukcja warunkowe)
Przykład loop (pętle przy pomocy br, kontekst symbolu za pomocą cxt.getParent())
Przykład function (tworzenie funkcji, argumenty, zwracanie wyniku, zakresy zmiennych).
Optymalizacja reprezentacji pośredniej przy pomocy opt.
## Wykład 9. Formalizmy analizy składniowej
Klasyfikacja Chomskiego. Gramatyka bezkontekstowa. Wyprowadzenie, drzewo wyprowadzenia. Wyprowadzenie lewostronne i prawostronne. Jednoznaczość wyprowadzenia. Przykłady niejednoznaczności (piorytet operatorów, wiszący else). Analiza zstępująca i wstępująca. Analiza przewidująca - wymagania odnośnie gramatyki, eliminacja lewostronnej rekurencji, faktoryzacja lewostronna.
## Wykład 10. Generator analizatorów składniowych - Yacc
Schemat działania generatorów analizatorów składniowych. Generator analizatorów leksykalnych (Yacc/Bison). Łączenie z generatorem Lex/Flex. Struktura i składnia plików *.y. Omówienie schematu generowania plików wynikowych w C. Przedstawianie kolejnych możliwości na przykładach calc1(%token), calc2(yylval, akcje sematyczne, $$, $1), calc3(%union, %type). Walidator programów w języku Pascal.
## Wykład 11. Analiza zstępująca
Analiza zstępująca. Rekurencyjny analizator przewidujący. Nierekurencyjny analizator ze stosem. Śledzenie pracy analizatora nierekurencyjnego. Definicje operacji LOOKAHEAD, FIRST i FOLLOW.
Tworzenie tablicy analizatora na przykładach.
Warunki na gramatykę LL(1), LL(2), LL(n).
## Wykład 12. Analiza wstępująca
Analiza wstępująca. Pojęcie redukcji i uchwytu redukcji. Zasada działania analizatora redukującego opartego na stosie. Tablica akcji i przejść. Śledzenie pracy analizatora opartego na operacjach przesunięcia (shift) i redukcji (reduce).
Tworzenie analizatora SLR. Pojęcia: sytuacja, domknięcie sytuacji, zbiór sytuacji równoważnych, gramatyka wzbogacona. Algorytm konstruowania tablicy analizatora SLR. Przykłady dla prostych gramatyk.
Podgląd analizatorów generowanych przez Yacc/Bison -r all
## Wykład 13. Kompilowanie kompilatorów i różności
Gramatyki inne niż BNF (PEG, Wijngaardena, ABNF, EBNF, TBNF)
Strategie bootstrappingu, czyli kompilowania kompilatora.
## Wykład 14. Powtórka przed egzaminem
Rozwiązywanie przykładowych zadań egzaminacyjnych.

## Materiały dodatkowe:
- http://craftinginterpreters.com/
- https://cs.lmu.edu/~ray/notes/languagedesignnotes/
- https://ohmjs.org/editor/

## Informacje z karty przedmiotu:
### Cel przedmiotu:
Celem przedmiotu jest przygotowanie studenta do tworzenia i korzystania z narzędzi analizy kodu źródłowego. Jest to uniwersalna wiedza przydatna przy definiowaniu tekstowej komunikacji pomiędzy człowiekiem, a maszyną. Dotyczy ona wszystkich języków programowania, języków zapytań, a także języków opisujących dane, czy ich formatowanie. Słuchacze wykładu zostaną zapoznani z zasadami analizy leksykalnej, składniowej i semantycznej. Przedstawione są także podstawowe techniki wykorzystywane na etapie kodu pośredniego.\
W ramach przedmiotu każdy student samodzielnie projektuje prosty język programowania oraz implementuje jego kompilator przy wykorzystaniu narzędzi ANTLR i LLVM.
### Treści merytoryczne:
Wykłady:
- Wprowadzenie do przedmiotu. Przedstawienie tematyki i regulaminu przedmiotu.
- Wprowadzenie do kompilacji. Etapy przetwarzania kodu źródłowego. Na podstawie 1 rozdziału podręcznika.
- Prosty kompilator jednoprzebiegowy w języku C (definicja prostej gratyki, notacja Backusa_Naura (BNF), analiza składniowa przy pomocy rekurencyjnych wywołań funkcji). Na podstawie 2 rozdziału podręcznika.
- Prosty kompilator jednoprzebiegowy w języku C (analiza leksykalna, obsługa tablicy symboli). Na podstawie 2 rozdziału podręcznika.
- Analiza leksykalna cz.1, Schemat analizatora leksykalnego, generator analizatorów leksykalnych (Lex/flex) (rozdział 3)
- Analiza leksykalna cz.2, Wyrażenia regularne, Tworzenie drzewa wyrażenia regularnego, Niedeterministyczny Automat Skończony, Deterministyczny Automat Skończony, Przekształcanie NAS na DAS, Redukcja DAS, (rozdział 3)
- Analiza składniowa cz.1, Rola analizatora składniowego. Obsługa błędów składniowych. Gramatyka bezkontekstowa, gramatyka kontekstowa. Formalna definicja gramatyki. Wyprowadzenia i drzewa wyprowadzeń. Lewostronne i prawostronne wyprowadzenie. Niejednoznaczność gramatyki. Gramatyki regularne. Poprawianie gramatyki (Eliminacja lewostronnej rekurencji, Eliminowanie niejednoznaczności, Faktoryzacja lewostronna). Przykłady języków kontekstowych. (rozdział 4)
- Analiza składniowa cz.2, Analiza zstępująca, Rekurencyjne analizator przewidujący, Nierekurencyjny analizator ze stosem (budowa tablicy analizatora, zbiory FIRST i FOLLOW), Analizator LL(n), Odzyskiwanie kontroli po błędach
- Analiza składniowa cz.3, Analiza wstępująca, Zasada działania analizatora redukującego opartego na stosie, Analizatory LR,
- Analiza składniowa cz.4, Tworzenie tablic analizatorów SLR (operacja domknięcia, operacja przejścia),
- Analiza składniowa cz.5, Generatory analizatorów składniowych: YACC (zasada działania, składnia plików, przykłady)
- Wprowadzenie do programu ANTLR.
- Podstawy translacji sterowana składnią. Akcje semantyczne. Artybuty symboli. Atrybuty synezowane i dziedziczone. Abstrakcyjne drzewo składni (AST), a graf (DAG) dla wyrażeń.

Ćwiczenia:
- Napisanie prostego analizatora leksykalno-składniowego przy pomocy rekurencyjnych wywołań funkcji.
- Napisanie programu do analizy i dopasowywania wyrażeń regularnych.
- Zaprojektowanie języka programowania i napisanie interpretera dla tego języka.

Metody oceny:
- Zadanie projektowe
- Egzamin pisemny (pytania otwarte i zadania projektowe)