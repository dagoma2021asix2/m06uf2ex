#!/bin/bash

function demanar_correu {
	REGEX='^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\.[A-Za-z]{2,63}$'
	RUTA="/etc/blackmail.list"
	
	echo -n "Escriu el teu correu: "
	read mail
	
	if [[ $mail =~ $REGEX ]]
	then
		#add to file
		#echo $mail
		if [ -f $RUTA ]
		then
			echo $mail >> $RUTA
		else
			sudo touch $RUTA
			echo $mail >> $RUTA
		fi
		
		exit 0
	else
		echo "El mail no es correcte."
		exit 5
	fi
	
	}

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1
fi

clear

demanar_correu
