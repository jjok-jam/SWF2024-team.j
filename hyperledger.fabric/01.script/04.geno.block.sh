#docker setting
conda remove --name hyperledger --all
conda create -n hyperledger python=3.10 pip
conda activate hyperledger

#nvm setting
# brew install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# mkdir ~/.nvm
vi ~/.zshrc
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"                                       # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

nvm list
nvm install v12.22.12
nvm use v12.22.12

#docker initialization
# !!! THIS WILL REMOVE ALL YOUR DOCKER CONTAINERS AND IMAGES !!!
# remove all containers
$ docker rm $(docker ps -qa)
# remove all mages
$ docker rmi --force $(docker images -qa)
# prune networks
$ docker network prune

base_dir = /Users/kogun82/Documents/workspace/SWF2024-team.j/hyperledger.fabric/02.fabric

cd $base_dir
curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.2.0 1.4.7 # intel cpu
curl -sSL https://bit.ly/2ysbOFE | bash -s                # mac m1, m2

# hyperledger
export FABRIC_HOME=/Users/kogun82/Documents/workspace/SWF2024-team.j/hyperledger.fabric/02.fabric/geno
export FABRIC_CFG_PATH=/Users/kogun82/Documents/workspace/SWF2024team.j/hyperledger.fabric/02.fabric/geno/config
export GO_HOME=/Users/kogun82/Documents/programs/go/current
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_333.jdk/Contents/Home
export PATH=$GO_HOME/bin:$JAVA_HOME/bin:$FABRIC_HOME/bin:$PATH
# export PATH=~${PWD}/bin:$PATH
# export CORE_PEER_TLS_ENABLED=true
# export CORE_PEER_LOCALMSPID="Org1MSP"
# export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1. example.com/tls/ca.crt
# export CORE_PEER_MSPCONFIGPATH=${PWD}/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example. com/msp
# export CORE_PEER_ADDRESS=localhost:7051

cd geno/test-network

./network.sh down
./network.sh up createChannel -ca -c mychannel -s couchdb
./network.sh deployCC -ccn geno -ccv 1 -cci initLedger -ccl go -ccp ../chaincode/fabcar/go/

cd /Users/kogun82/Documents/workspace/SWF2024-team.j/hyperledger.fabric/02.fabric/geno

./test_run.sh

cd /Users/kogun82/Documents/workspace/SWF2024-team.j/hyperledger.fabric/02.fabric/geno/fabcar/javascript

npm install

node enrollAdmin.js
node registerUser.js
node invoke.js
