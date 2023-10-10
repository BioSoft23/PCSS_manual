# Obsługa Pythona

## Standardowa instalacja środowiska (najlepsza opcja)

1. Aby móc aktywować Pythona, trzeba uruchomić interaktywny tryb:

```bash
srun --pty /bin/bash
```

2. Po otrzymaniu zasobów i uruchomieniu interaktywnej konsoli na węźle, ładujemy moduł Pythona:
   
```bash
module load python
```

Domyślnie jest ładowany Python 3.5.1. Jeżeli chcemy wybrać inna wersje, trzeba wpisać `python/<wersja>`. Lista dostępnych preinstalowanych wersji pythona znajduje się na liście wszystkich preinstalowanych modułów (czyli tak naprawdę programów):

```bash
module avail
```

Aktualnie dostępne są następujące wersje pythona:

```
python/2.7.12
python/2.7.14
python/2.7.3
python/3.10.7
python/3.2.3
python/3.5.1(default)
python/3.7.0
python/3.7.10_gcc930
python/3.7.3
python/3.8.0
python/3.8.8
python/3.9.2
```

3. Sprawdźmy czy faktycznie jest załadowana odpowiednia wersja uruchamiając interaktywną konsole pythona:

```bash
python
```

4. Tworzymy środowisko pythona i je aktywujemy:

```bash
python -m venv <ścieżka dla venv>
source <ścieżka dla venv>/bin/activate
```

5. Będąc w środowisku można instalować paczki:

```bash
pip install <nazwa_paczki>
```

lub zainstalować z listy paczek, uźywając pliku `requirements.txt` (zwykle tak się nazywa):

```bash
pip install -r requirements.txt
```

6. Następnym razem, jeżeli wejdziemy w tryb interaktywny lub jeśli zleci się zadanie, to trzeba pamiętać o załadowaniu odpowiedniej wersji pythona i aktywacji środowiska.


## Instalacja paczek dla użytkownika

1. Kroki 1-3 z poprzedniego punktu trzeba powtórzyć
2. Instalujemy paczkę bez środowiska - zaleca się użycie `--user` aby ją przypisać do użytkownika, przez co może być później wykorzystana:

```bash
pip install --user <nazwa_paczki>
```

Miejscem instalacji paczki jest katalog domowy użytkownika:

```
/home/users/<uzytkownik>/.local/lib/<python_wersja>/site-packages/
```

3. Jeżeli chcemy użyć paczki w dowolnym, innym miejscu, należy dodać te paczkę do zmiennej pythona:

```
export PYTHONPATH=$PYTHONPATH:/home/users/<uzytkownik>/.local/lib/<python_wersja>/site-packages/
```

4. Na koniec upewniamy się, że paczka działa uruchamiając konsole pythona i importując zainstalowaną paczkę:

```
python

Python 3.5.1 (default, Feb 24 2016, 11:24:22)
[GCC 4.8.2 20140120 (Red Hat 4.8.2-14)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import <nazwa_paczki>
```

5. Przy każdym kolejnym użyciu zainstalowanych tak paczek, trzeba pamiętać o dodawaniu katalogu z paczkami dla danej wersji pythona do zmiennej pythona - nie jest ona zapisywana pomiędzy sesjami na węzłach.


## Instalacja nowej wersji pythona

[Tutorial](https://wiki.man.poznan.pl/kdm/Instalacja_Pythona_z_poziomu_u%C5%BCytkownika#Instalacja_nowej_wersji_Pythona_w_katalogu_domowym) dostępny na stronie PCSS jest poprawny i w pełni wystarczający do instalacji nowej wersji pythona na węźle obliczeniowym. Naturalnie, wraz z nowszymi wersjami pythona, pewne zależne biblioteki mogą być wymagane w nowszej wersji, niż te, które są dostępne na serwerze. Wtedy należy zainstalować je ręcznie i skonfigurować ich ścieżki. Nie ma tutaj jednego rozwiązania, wszystko zależne od tego czego brakuje (niestety).
