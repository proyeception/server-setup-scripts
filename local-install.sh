#!/bin/bash

if [ $# -eq 0 ]
then
  echo "Usage: ./local-install <install dir>"
  exit -1
fi

DIR= $1

bash appserver.sh $DIR 
bash webserver.sh $DIR