#!/bin/bash

# Zenity pentru a crea un window
username=$(zenity --entry --title "Verificare utilizator" --width=450 --height=350  --text "Introduceti numele de utilizator")

# Verifica daca utilizatorul exista
getent passwd $username >/dev/null 2>&1


if [ $? -eq 0 ] && [ ! -z "$username" ]; then

    # Utilizeaza find pentru a obtine accesul la fisiere si permisiunile
    file_access=$(find / -user $username -ls 2>/dev/null)

    # Afiseaza accesul la fisiere și permisiunile utilizand Zenity
    echo "$file_access" | zenity --text-info --title "Acces la fisiere si permisiuni" --width=600 --height=600

else
    # In caz ca utilizatorul nu exista, se va afisa un mesaj de eroare
    if [ ! $? -eq 0 ] && [ ! -z "$username" ]; then
    zenity --error --title "Eroare" --text "Utilizatorul $username nu exista!"
    ./permisiuni.sh
    fi
fi

exit 0
