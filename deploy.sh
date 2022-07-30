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

# 1ere boucle de 1 à x machines
for i in $(seq 1 $nb_machine);do
  echo "docker run -tid --name $USER-alpine-$i alpine:latest"
done
echo "${nb_machine} machines créés"

elif [ "$1" == "--drop" ];then
echo ""
echo "L'option choisie est "$1
echo ""
echo "docker rm -f $USER-alpine"
echo 'Drop ts les conteneurs de jean'
echo "docker rm -f \$(docker ps -a \| grep \$USER-alpine | awk '{print \$1}')"
# docker rm -f $(docker ps -a | grep $USER-alpine | awk '{print $1}')  
echo "recupere les id \$1 présent en 1ere colonne de docker ps des conteneurs s'appelant $USER-alpine"

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
