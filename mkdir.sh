#!/bin/zsh

if [ "$#" -ne 1 ]; then
 echo "Le nombre d'arguments est invalide"
 exit 1
fi

mkdir "$1" 
take "$_"
