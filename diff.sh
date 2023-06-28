#!/bin/bash

# Select Window pentru alegerea primului fisier
file1=$(zenity --file-selection --title="Selecteaza primul fisier")

# Afisare mesaj de eroare in caz ca nu a fost selectat niciun fisier
if [ $? -ne 0 ]; then
    zenity --error --title="Eroare" --text="Nu a fost selectat niciun fisier." --width=300 --height=100
    exit 1
fi

# Select Window pentru alegerea celui de al doilea fisier
file2=$(zenity --file-selection --title="Selectează al doilea fisier")

# Afisare mesaj de eroare in caz ca nu a fost selectat niciun fisier
if [ $? -ne 0 ]; then
    zenity --error --title="Eroare" --text="Nu a fost selectat niciun fisier." --width=300 --height=100
    exit 1
fi

# Se realizeaza diff-ul intre cele doua fisiere
diff_result=$(diff "$file1" "$file2")

# Se verifica daca cele doua fisiere sunt diferite sau nu
if [ -z "$diff_result" ]; then
    zenity --info --title="Rezultat" --text="Nu exista diferente intre fisiere." --width=300 --height=100
else
    # In caz ca sunt diferite, se afiseaza diferentele intr-un window
    zenity --text-info --title="Rezultat" --filename=<(echo "$diff_result") --width=800 --height=600
fi
