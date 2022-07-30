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

elif [ "$1" == "--drop" ];then
echo ""
echo "L'option choisie est "$1
echo ""

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
