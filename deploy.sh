#!/bin/bash

####################################################################
#
# Description : déploiement à la volée de conteneur docker
# date : 30/07/2022
#
# ./deploy.sh --arg
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
  nb_machines=1
  [ "$2" != "" ] && nb_machines=$2

  # recuperation de l'id max, awk -F pr definir separateur, -v pour def une variable
  min=1
  max=0
  idmax=`docker ps -a --format '{{ .Names }}' | awk -F "-" -v user=$USER '$0 ~ user"-alpine" {print $3}' | sort -r | head -1`
  echo "idmax : ${idmax}"
  min=$(($idmax+1))
  max=$(($min+$nb_machines))
  # pour test sans docker on supprime 1 pour cohérence
  max=$(($max-1))

  # 1ere boucle de 1 à x machines
  for i in $(seq $min $max);do
    echo "docker run -tid --name $USER-alpine-$i alpine:latest"
  done
  echo "${nb_machines} machines créés"

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
