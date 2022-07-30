#!/bin/bash

####################################################################
#
# Description : déploiement à la volée de conteneur docker
# date : 30/07/2022
#
####################################################################
echo "
Options :
 - --create : lancer des conteneurs
 - --drop : supprimer les conteneurs créer par deploy.sh
 - --infos : caractéristiques des conteneurs (ip,nom,user ...)
 - --start : redémarrage des conteneurs
 - --ansible : déploiement arborescence ansible
"
