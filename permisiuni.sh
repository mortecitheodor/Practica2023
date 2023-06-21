#!/bin/bash

# Foloseste Zenity pentru a obține numele de utilizator
username=$(zenity --entry --title "Verificare utilizator" --width=450 --height=350  --text "Introduceti numele de utilizator")

# Verifica daca utilizatorul exista
getent passwd $username >/dev/null 2>&1


if [ $? -eq 0 ] && [ ! -z "$username" ]; then

    # Utilizatorul există

    # Utilizează find pentru a obține accesul la fișiere și permisiunile
    file_access=$(find / -user $username -ls 2>/dev/null)

    # Afiseaza accesul la fisiere și permisiunile utilizand Zenity
    echo "$file_access" | zenity --text-info --title "Acces la fisiere si permisiuni" --width=600 --height=600

else
    # Utilizatorul nu exista
    if [ ! $? -eq 0 ] && [ ! -z "$username" ]; then
    zenity --error --title "Eroare" --text "Utilizatorul $username nu exista!"
    ./permisiuni.sh
    fi
fi

exit 0
