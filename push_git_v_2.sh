#!/bin/bash

read -r -p 'Message de commit: ' desc  # prompt pour message
git add .                           
git commit -m "$desc"               
git push origin master             

