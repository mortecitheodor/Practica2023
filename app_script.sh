#!/bin/bash

# Utilizați Zenity pentru a afișa o fereastră de dialog cu titlu, mesaj și câmp de text de dimensiuni mai mari
response=$(zenity --entry --title="Aplicatie Practica 2023" --text="Environment de invatare pentru studenti: " --width=400 --height=200)

# Verificați dacă utilizatorul a introdus un răspuns
if [[ -n "$response" ]]; then
    echo "Răspunsul utilizatorului: $response"
else
    # Utilizați Zenity pentru a afișa un nou window cu mesajul "Nu ați introdus niciun mesaj!"
    zenity --info --title="Eroare" --text="Nu ați introdus niciun mesaj!"
fi
