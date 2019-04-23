#!/bin/sh
echo "Begin .... "
echo "========00000000000000000000000000== Begin ==00000000000000000000000000000000000========="
sudo -i

# add rpm source 

apt -y install bash-completion
apt -y install  golang

go version

mkdir $HOME/go

# vim ~/.zshrc
echo "export GOPATH=$HOME/go" >>  ~/.bashrc
echo "export PATH=$PATH:$GOPATH/bin" >>  ~/.bashrc

. $HOME/.bashrc



# Install docker && kubectl
echo "========00000000000000000000000000==  Install docker && kubectl ==00000000000000000000000000000000000========="

apt install docker
systemctl restart docker &&  systemctl  enable docker 


apt -y update && apt install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get -y update
apt-get install -y kubectl




echo "========11111111111111========="
#. $HOME/.bashrc
echo "========22222222222222========="

# Download and config the cluster

echo "========00000000000000000000000000==  Download and config the cluster ==00000000000000000000000000000000000========="
go get sigs.k8s.io/kind 

echo "export PATH=$PATH:/root/go/bin" >> $HOME/.bashrc

. $HOME/.bashrc


kind create cluster


echo "========00000000000000000000000000==  The End , try kubectl get nodes , Now !!! ==00000000000000000000000000000000000========="