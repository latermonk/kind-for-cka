#!/bin/sh
echo "Begin .... "
sudo -i

yum -y install zsh
chsh -s /bin/zsh
yum install -y git
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
yum -y install bash-completion
yum -y install epel-release
yum install -y golang
go version

mkdir $HOME/go

# vim ~/.zshrc
echo "export GOPATH=$HOME/go" >>  ~/.zshrc
echo “export PATH=$PATH:$GOPATH/bin” >>  ~/.zshrc

. $HOME/.zshrc

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


. $HOME/.zshrc





go get sigs.k8s.io/kind 

echo "export PATH=$PATH:/root/go/bin" >> $HOME/.zshrc

yum -y install source

. $HOME/.zshrc


kind create cluster