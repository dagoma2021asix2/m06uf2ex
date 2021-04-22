#!/bin/bash

function install_pkg {
	echo -n "Paquet a instalar: "
	read paquet

	sudo apt install $paquet
	echo "Paquet instal·lat."
	}

if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1
fi

clear

cont='s'
while [ $cont == 's' ]
do
	install_pkg
	echo -n "Vols continuar? (1=Si): "
	read tmp
	if [ $tmp != 1 ]
	then
		cont='f'
	fi
done
exit 20
