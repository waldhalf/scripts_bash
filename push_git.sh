#!/bin/zsh

COMMIT=$1

git add .
git commit -m "${COMMIT}"
git push origin master