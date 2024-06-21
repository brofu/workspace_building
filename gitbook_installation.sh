#!/bin/bash

# gitbook depends node.js and npm
# GitBook 3.2.3 is compatible with node.js 10 and npm 6

# install nvm to install old version of node.js (10.24.1)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.nvm/nvm.sh

# install node 10
nvm install 10
nvm use 10

# install npm 6
npm install -g npm@6

# install gitbook
npm install -g gitbook-cli
# install gitbook-summary
npm install -g gitbook-summary 
                                

