#!/bin/zsh

# Les constantes
CURRENTDIR=${PWD##*/}
GITHUBUSER=$(git config github.user)

# Les input user
read "REPONAME?Entrez le nom du nouveau repository (enter for ${PWD##*/}):"
read "USER?Git Username (enter for ${GITHUBUSER}):"
read "DESCRIPTION?Description du repository:"

echo "Et c'est parti"

# Curl du Json
curl -u ${USER:-${GITHUBUSER}} https://api.github.com/user/repos -d "{\"name\": \"${REPONAME:-${CURRENTDIR}}\", \"description\": \"${DESCRIPTION}\", \"private\": false, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"

git remote set-url origin git@github.com:${USER:-${GITHUBUSER}}/${REPONAME:-${CURRENTDIR}}.git
git push --set-upstream origin master

# On créé le premier commit
echo "${DESCRIPTION}" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/waldhalf/${REPONAME}
git push -u origin master
