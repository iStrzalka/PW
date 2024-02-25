# Wyklad
- Wyklad bedzie prowadzacy wprost z ksiazki XYZ
- 5 Laboratorium bedzie nt najwazniejszych elementow z wykladow

## System oceniania
- Egzamin       80 pkt
- Laboratorium  20 pkt

## Typy modeli uczenia maszynowego
- Klasyfikacja - wyniki binarne
- Regresja - estymacja wyniku realnego
- Grupowanie danych w klastry o centrach reprezentujących dany klaster
- Transformacja danych 
  - redukcja wymiaru wektorów wejściowych
  - separacja sygnałów zmieszanych - Blind source separation

## Reprezentacja danych
- wektorowa
- macierzowa
- tensorowa - układ macierzy ustawionych jedna za drugą, używana głównie w uczeniu głębokim

## Normalizacja danych
- Używana po to by uniformować dane do takich gdzie nie będzie istniały dane, 
które przez model mogą zostać uznane za całkowicie bezużyteczne (przykład z danymi $10^{-3}$ i $10^6$)
- Techniki normalizacji danych
  - Standaryzacja statystyczna - powszechnie stosowane rozwiązanie
    - $x_{ij} := \frac{x_{ij} - norm(x_i)}{std(x_i)}$
  - Normalizacja typu min/max
    - $x_{ij} := \frac{x_{ij} - min(x_i)}{max(x_i) - min(x_i)} , x_{ij} \in [0, 1]$
  - Normalizacja typu skalującego
    - $x_{ij} := \frac{x_{ij}}{\alpha}$, gdzie $\alpha$ to współczynik skalujący, często mediana, średnia, min

## Problem brakujących danych
- Niekiedy dane mogą posiadać puste pola, nie zero, a NULLe.
- Techniki rozwiązania problemu
  - Usunięcie rekordu - możliwe tylko kiedy ilość rekordów z brakami jest wystarczająco procentowo niska.
  - Uzupełnianie braków
    - Zastąpienie braku poprzez średnią z sąsiadów  - często się nie da
    - Zastąpienie braku poprzez mediane z kolumny   - również 
    - Grupowanie danych z pominięciem rekordów z brakującymi danymi a potem uzupełnianie danych z danego klastra

## Problem wartości odstających (outlier)
- Niekiedy dane mogą posiadać wartości, które zaburzają analizowane wartości np. średnich, min, max
- Zniekształca nam proces analizy
- Techniki rozwiązania problemu uniknięcia wpływu outlierów na analizowwane dane
  - Jeśli możliwe - usunięcie outlierów np. poprzez obcięcie Wilsonowskie
  - Zastąpienie wartości średnich (mean) na mediane
  - Zbudowanie modelu minimalizującego wpływ outlierów

## Modele uczenie maszynowego
# Regresja liniowa
- Regresja może być liniowa i nieliniowa
- Liniowa zakłada że $y = \sum_i{a_i * x_i}$
- Nieliniowa zakłada że $y = f(x_1, x_2, \dots, x_n)$

# Regresja liniowa dzieli się na:
- prosta        $y = a_0 + a_1*x_1$
- wielokrotna   $y = a_0 + a_1*x_1 + ... + a_n*x_n$

# Zastosowanie regresja liniowego
- model przekroju liniowego 
- regresja liniowa jest nieodłączną częścią przetwarzania zaawansowanego danych
- współczynniki $a_i$ regresji liniowej dają informację o znaczeniu danej zmiennej.
  - Jeśli $|a_i|$ istotnie mały to $x_i$ nie wpływa istotnie na wynik
  - Jeśli $|a_i|$ istotnie duży to $x_i$ ma istotnie duży wpływ na wynik

# Problem regresji liniwej
- Dla i-tego rekordu ($x_i$) $\rightarrow$ ($d_i$)
  - $y_i = a_0 + a_1*x_1 + ... a_n*x_n$
- Przy p rekordach tworzy się układ równań
  - $Xa = D$, gdzie $X \in R^{p \times m + 1}, a \in R^m, D \in R^p$

Poszukujemy rozwiązania na równanie
$$min_a |Xa - D|^2$$

Rozwiązania:
- Rozwiązanie klasyczne 
  - $Xa = D\textnormal{ // }\cdot X^T$
  - $X^T \cdot X \cdot a = X^T * D\textnormal{ // }\cdot (X^T \cdot X)^{-1}$
  - $a = ((X^T \cdot X)^{-1} \cdot X^T) \cdot D$ 
  - $a = X^+ * D$
  - Ale matma tu nie matmuje więc robimy
  - Regularyzacja rozwiązania : $X^+ = (X^T \cdot X + \epsilon \cdot I)^{-1} \cdot X^T$, gdzie $\epsilon$ to współczynnik regularyzacji.
- Zastosowanie SVD - Singular Value Decomposition
  - $X = USV^T$, 
    - gdzie $U, V$ - macierze ortogonalne (ważnym elementem jest fakt $U^{-1} = U^T$)
    - gdzie $S$    - macierz pseudodiagonalna,
    - wartości $s_i$ - wartości osobilwe $s_1 > s_2 > ... > s_n$
  - $X = \sum_i{S_i \cdot U_i \cdot V_i^T}$ 
  - $X \approx U_r \cdot S_r \cdot V_r^T$, gdzie r to jest liczba istotnych wartości $s_i > 10^{-6}$
  - $X^+ = (V_r^T)^{-1} \cdot S_r*{-1} \cdot U_r^{-1}$
  - $X^+ = V \cdot S_r^{-1} \cdot U_r^{-1}$
  - Czyli $Xa = d \longrightarrow a = X^+ \cdot d$

# Funckje w matlabie które będziemy badać na labach:
- regress $\leftarrow$ regresja zwykla
- robustfit $\leftarrow$ regresja krzepka odporna na outliery 