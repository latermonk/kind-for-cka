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
##  安装kind

```
go get sigs.k8s.io/kind 

kind create cluster
```


reference:
https://github.com/latermonk/kind

