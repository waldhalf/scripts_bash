#!/bin/zsh

COMMIT=$1
if [ "$#" -ne 1 ]; then
 echo "Le nombre d'arguments est invalide"
 exit 1
fi
git add .
git commit -m "${COMMIT}"
git push origin master