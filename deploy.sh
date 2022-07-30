#!/bin/bash

####################################################################
#
# Description : déploiement à la volée de conteneur docker
# date : 30/07/2022
#
####################################################################

if [ "$1" == "--help" ];then
# $1 est le 1er arg du script
echo ""
echo "help! tape juste le nom de la commande pour voir l'aide"
echo ""

elif [ "$1" == "--create" ];then
echo ""
echo "L'option choisie est "$1
echo ""
# test pour savoir si un second argument est présent
# pas d'espace pour définir une variable
nb_machine=1
[ "$2" != "" ] && nb_machine=$2

echo "docker run -tid --name $USER-alpine alpine:latest"

echo "${nb_machine} machines créés"

elif [ "$1" == "--drop" ];then
echo ""
echo "L'option choisie est "$1
echo ""
echo "docker rm -f $USER-alpine"
echo 'Drop ts les conteneurs de jean'

elif [ "$1" == "--info" ];then
echo ""
echo "L'option choisie est "$1
echo ""

elif [ "$1" == "--start" ];then
echo ""
echo "L'option choisie est "$1
echo ""

elif [ "$1" == "--ansible" ];then
echo ""
echo "L'option choisie est "$1
echo ""

else
echo "
Options :
 - --help : affiche l'aide
 - --create : lancer des conteneurs
 - --drop : supprimer les conteneurs créer par deploy.sh
 - --info : caractéristiques des conteneurs (ip,nom,user ...)
 - --start : redémarrage des conteneurs
 - --ansible : déploiement arborescence ansible
"
fi
