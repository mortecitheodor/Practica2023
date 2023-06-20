#!/bin/bash

# Utilizați Zenity pentru a afișa o fereastră de dialog cu titlu, mesaj și câmp de text de dimensiuni mai mari
response=$(zenity --entry --title="Aplicatie Practica 2023" --text="Environment de invatare pentru studenti" --width=400 --height=200)

# Verificați dacă utilizatorul a introdus un răspuns și afișați-l
if [[ -n "$response" ]]; then
    echo "Răspunsul utilizatorului: $response"
else
    echo "Nu ați introdus niciun răspuns."
fi
