#!/bin/bash

# Afiseaza dialogul pentru selectarea fisierului
file_path=$(zenity --file-selection --title "Selecteaza fisierul")

# Verifica daca fisierul a fost selectat
if [ -n "$file_path" ]; then
    # Citeste continutul fisierului
    file_content=$(cat "$file_path")
    
    # Afiseaza continutul fisierului intr-o caseta de dialog
    zenity --text-info --title "Continutul fisierului" --filename="$file_path" --width=1000 --height=800 --editable --text="$file_content" >/dev/null 2>&1
else
    # Daca nu a fost selectat niciun fisier, afiseaza un mesaj de eroare
    zenity --error --title "Eroare" --text "Nu a fost selectat niciun fisier."
fi


