#!/bin/bash
source common.sh

pyenv versions | grep $PYTHON_VERSION > /dev/null && echo "python version $PYTHON_VERSION installed" && exit

echo "installing python version $PYTHON_VERSION"
pyenv install $PYTHON_VERSION 
pyenv global $PYTHON_VERSION 

