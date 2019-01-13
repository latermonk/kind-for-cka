# kind-for-cka


#  CentOS 7

##  go环境搭建

### 安装golang
```
yum install golang

go version

```

###  配置环境


```
mkdir $HOME/gowork

vim ~/.profile

export GOPATH=$HOME/gowork 
export PATH=$PATH:$GOPATH/bin

source $HOME/.profile

```
###  检查环境


```
go env
```
##  安装docker

###  安装docker
####  方法一：

```
cd /etc/yum.repo

wget  https://download.docker.com/linux/centos/docker-ce.repo

yum install docker-ce
```
####  方法二：
```
curl -fsSL get.docker.com -o get-docker.sh

sh get-docker.sh
```

###  配置国内源

```
mkdir  /etc/docker

vim /etc/docker/daemon.json

```


```
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
```


###  重启docker并配置开机启动
```
systemctl restart docker &&  systemctl  enable docker 
```


##  安装其它工具


```
yum install git
```

## 安装kubectl

```
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
yum install -y kubectl
```

##  安装kind

```
go get sigs.k8s.io/kind 

kind create cluster
```






reference:
https://github.com/latermonk/kind





