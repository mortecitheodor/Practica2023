#!/bin/bash

# Obtinem lista utilizatorilor
users=$(cut -d: -f1 /etc/passwd)

# Textul cu informații despre utilizatori
user_info=""
for user in $users; do
    user_info+="Utilizator: $user\n"
    user_info+="ID utilizator: $(id -u $user)\n"
    user_info+="Grup principal: $(id -gn $user)\n"
    user_info+="Director home: $(eval echo ~$user)\n"
    user_info+="-----\n"
done

# Afisam informatiile cu ajutorul unui window
zenity --info --title "Informatii utilizatori" --text "$user_info" --width=500 --height=300 

exit 0
