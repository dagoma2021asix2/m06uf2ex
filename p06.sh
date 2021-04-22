#!/bin/bash

function demanar_fitxer {
	echo -n "Fitxer dins de /etc/default/: "
	read fitxer
	
	ruta_sencera="/etc/default/"
	ruta_sencera=${ruta_sencera}${fitxer}
	
	if [ -f $ruta_sencera ]
	then
		sudo cat $ruta_sencera | grep '^[^#]'
		exit 0
	else
		echo "Error: El fitxer demanat no existeix"
		exit 1
	fi
	
	}

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1
fi

clear

demanar_fitxer
