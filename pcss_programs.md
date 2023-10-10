# Oprogramowanie na serwerze

Instalacja oprogramowania nie jest tak prosta jak na komputerze stacjonarnym. Nie można korzystać z instalacji z repozytoriów oraz graficznych instalatorów. Ponadto środowiska automatyzujące instalacje, takie jak np. conda nie działają.

## Preinstalowane moduły

Na WIKI KDM znajduje [artykuł](https://wiki.man.poznan.pl/kdm/Modu%C5%82y) dobrze opisujący obsługę i zarządzanie modułami preinstalowanymi na serwerze.

## Instalacja oprogramowania

### Instalacja z kodu źródłowego

Na WIKI KDM preferowanym sposobem instalacji jest kompilacja programów z kodu źródłowego. Tamtejszy [tutorial](https://wiki.man.poznan.pl/kdm/Kompilacja_oprogramowania) jest dobrze napisany i wystarczający, aby móc w ten sposób zainstalować potrzebny program.

### Instalacja z paczek binarnych

Nie jest to ujęte na WIKI KDM, ale można skorzystać z instalacji z gotowych paczek binarnych, jeśli są one dostępne (i są w odpowiedniej wersji - Linux 64 bit). 

W takim przypadku należy pobrać plik paczki (najczęściej formatu .tar.gz lub .zip), rozpakować go:

- pliki tar.gz

```
tar -xvzf nazwa_pliku.tar.gz
```

- pliki .zip

```
unzip nazwa_pliku.zip
```

Następnie należy przejść do katalogu z rozpakowanymi plikami i uruchomić plik wykonywalny programu (jeśli jest dostępny) lub sprawdzić plik instalacyjny/readme w poszukiwaniu instrukcji instalacji.

> **Note**
> Po takiej instalacji program nie będzie dostępny globalnie, tylko w obrębie katalogu, w którym został zainstalowany. Aby użyć go z poziomu linii poleceń należy przejść do tego katalogu lub dodać jego ścieżkę do zmiennej PATH, np:
> ```
> export PATH="$PATH:/home/users/<nazwa_uzytkownika>/<sciezka_do_katalogu_z_programem>"
> ```
> Kompletne kroki potrzebne do ustawienia oprogramowania i zlecenia zadania znajdują się tutaj {link}. 
> Może to być również konieczne do wykonania po instalacji z kodu źródłowego.