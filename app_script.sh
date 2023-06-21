#!/bin/bash

# Folosire Zenity pentru afisare GUI




init=0

while [ $init -eq 0 ]
do
response=$(zenity --entry --title="Aplicatie Practica 2023" --text="                                              Environment de invatare pentru studenti \n\n  Selecteaza una dintre optiuni: \n \n 1. Verificare utilizatori \n 2. Verificare acces fisiere, permisiuni \n 3. Verificare continut fisiere \n 4. Verificare diff-uri pe fisiere \n 5. Iesire aplicatie \n " --width=600 --height=400)

# Verificare raspuns utilizator

if [[ "$response" == "1" || "$response" == "2" || "$response" == "3" || "$response" == "4" || "$response" == "5" ]]; then
    echo "Opțiunea este validă: $response"
    init=1
else
    # Utilizați Zenity pentru a afișa un mesaj de eroare
    zenity --error --title="Eroare" --text="Opțiunea nu este validă!"
    
fi


done

if [ $response -eq 1 ]
then
	./utilizatori.sh
	./app_script.sh
fi

if [ $response -eq 5 ]
then
	exit 0

fi

if [ $response -eq 2 ]
then
        ./permisiuni.sh
        ./app_script.sh
fi



