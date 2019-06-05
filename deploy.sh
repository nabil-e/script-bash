#!/bin/bash

########################################################
#
# Description : lancement d'une plateforme de conteneurs
#
# Auteur : nabil-e
#
# Date : 05/06/2019
#
########################################################
# si option create
if [ "$1" == "--create" ];then
	echo ""
	echo "notre option est --create"
	echo ""

# si option drop
elif [ "$1" == "--drop" ];then
	echo ""
	echo "notre option est --drop"
	echo ""

# si option start
elif [ "$1" == "--start" ];then
	echo "notre option est --start"
	echo ""

# si option infos
elif [ "$1" == "--infos" ];then
	echo ""
	echo "notre option est --infos"
	echo ""

# si option ansible
elif [ "$1" == "--ansible" ];then
	echo ""
	echo "notre option est --ansible"
	echo ""
	
# si aucune option affichage de l'aide
else

echo "

Options :

	--create : si aucun chiffre 2 conteneurs sinon x conteneurs seront créés

	--drop : pour supprimer les conteneurs créés via ce script par ${USER}

	--start : pour redémarrer les conteneurs

	--infos : pour récapituler les infos des conteneurs (user, ip, nom...)

	--ansible : pour créer une base de dev pour ansible

"
fi