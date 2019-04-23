#!/bin/sh
echo "Begin .... "
sudo -i

# add rpm source 
yum -y install epel-release


yum -y install git
yum -y install bash-completion
yum -y install  golang

go version

mkdir $HOME/go

# vim ~/.zshrc
echo "export GOPATH=$HOME/go" >>  ~/.bashrc
echo “export PATH=$PATH:$GOPATH/bin” >>  ~/.bashrc

. $HOME/.bashrc

cd /etc/yum.repos.d
wget  https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl restart docker &&  systemctl  enable docker 

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

yum -y install kubectl

echo "========11111111111111========="
#. $HOME/.bashrc
echo "========22222222222222========="

# Download and config the cluster
go get sigs.k8s.io/kind 

echo "export PATH=$PATH:/root/go/bin" >> $HOME/.bashrc

#yum -y install source

. $HOME/.bashrc


kind create cluster