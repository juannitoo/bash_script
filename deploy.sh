#!/bin/bash

####################################################################
#
# Description : déploiement à la volée de conteneur docker
# date : 30/07/2022
#
# ./deploy.sh --arg
####################################################################
function show_help(){
  echo "
  Script basique de déploiement de conteneurs réalisé via xavki sur youtube
  Options :
  - --help : affiche l'aide
  - --create : lancer des conteneurs docker arg:number:nbre de conteneur
  - --drop : supprimer les conteneurs créer par deploy.sh
  - --ip : ip des conteneurs
  - --start : redémarrage des conteneurs du script
  - --stop : arrête les conteneurs du script
  "
}

if [ "$1" == "--help" ];then
  # $1 est le 1er arg du script
  show_help

elif [ "$1" == "--create" ];then
  echo ""
  echo "L'option choisie est $1"
  echo ""
  # test pour savoir si un second argument est présent
  # pas d'espace pour définir une variable
  nb_machines=1
  [ "$2" != "" ] && nb_machines=$2

  # recuperation de l'id max, awk -F pr definir separateur, -v pour def une variable
  # le format, c'est du template go ...
  min=1
  max=0
  idmax=`docker ps -a --format '{{ .Names }}' | awk -F "-" -v user=$USER '$0 ~ user"-alpine" {print $3}' | sort -r | head -1`
  echo "idmax : ${idmax}"
  min=$(($idmax+1))
  max=$(($min+$nb_machines-1))

  # On boucle sur le nbre de machines a faire
  for i in $(seq $min $max);do
    echo "docker run -tid --name $USER-alpine-$i alpine:latest"
    docker run -tid --name $USER-alpine-$i alpine:latest
  done
  echo "${nb_machines} machines créées"

elif [ "$1" == "--drop" ];then
  echo ""
  echo "L'option choisie est $1"
  echo ""
  echo "docker rm -f $USER-alpine"
  echo 'Drop ts les conteneurs jean-alpine'
  echo "docker rm -f \$(docker ps -a \| grep \$USER-alpine | awk '{print \$1}')"
  echo "recupere les id \$1 présent en 1ere colonne de docker ps des conteneurs s'appelant $USER-alpine"
  docker rm -f $(docker ps -a | grep $USER-alpine | awk '{print $1}')  

elif [ "$1" == "--ip" ];then
  echo ""
  echo "L'option choisie est $1"
  echo ""
  for conteneur in $(docker ps -a | grep $USER-alpine | awk '{print $1}');do
    docker inspect --format='{{.Name}} -- {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $conteneur
  done

elif [ "$1" == "--start" ];then
  echo ""
  echo "L'option choisie est $1"
  echo ""
  docker start $(docker ps -a | grep $USER-alpine | awk '{print $1}')

elif [ "$1" == "--stop" ];then
  echo ""
  echo "L'option choisie est $1"
  echo ""
  docker stop $(docker ps -a | grep $USER-alpine | awk '{print $1}')

else
  show_help
fi
