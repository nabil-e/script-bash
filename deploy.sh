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
# liste de l'ID des containers
container_id=$(docker ps -a | grep $USER-alpine | awk '{print $1}')
echo ""
# si option create
if [ "$1" == "--create" ];then
	echo ""
	echo "notre option est --create"
	echo ""
	
	nbr_machine=1
	[ "$2" != "" ] && nbr_machine=$2
# init min et max
	min=1
	max=0
# récupération de l'id max	
	idmax=`docker ps -a --format '{{ .Names }}' | awk -F "-" -v user=$USER '$0 ~ user"-alpine" { print $4 }' | sort -r | head -1`
	echo "idmax: , ${idmax}"
# redéfinition de min et max	
	min=$(($idmax + 1))
	max=$(($idmax + $nbr_machine))
# création du/des container(s)
	for i in $(seq $min $max);do
		docker run -tid --name $USER-alpine-$i alpine:latest
		echo "container $USER-alpine-$i créé"
	done
	echo "J'ai créé ${nbr_machine} containers"

# si option drop
elif [ "$1" == "--drop" ];then
	echo "Suppression des containers ..."
	echo ""

	docker rm -f $container_id

	echo "container supprimé"

# si option start
elif [ "$1" == "--start" ];then
	echo "Redémarrage des containers"
	echo ""
	docker start $container_id
	echo "Redémarrage terminé"
# si option infos
elif [ "$1" == "--infos" ];then
	echo ""
	echo "Information des containers"
	echo ""
	for container in $container_id;do
		docker inspect -f '  => {{.Name}} - {{.NetworkSettings.IPAddress}}' $container
	done

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