# kind-for-cka


#  CentOS 7

##  go环境搭建

### 安装golang
```
yum install -y golang

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

yum install -y docker-ce
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
yum install -y git
```

## 安装kubectl

###  方法一：

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl


mv ./kubectl /usr/local/bin/kubectl

```


###  方法二：

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

找不到kind：

```
添加
export PATH=$PATH:/root/go/bin
到.bashrc

```



##  shell补全

### shell补全

### kubectl补全

```
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
```
## 设置配置文件

```
export KUBECONFIG="$(kind get kubeconfig-path --name="1")"


```


##  集群测试


```
kubectl cluster-info
```

## 集群创建指南

创建
删除
...




reference:
https://github.com/latermonk/kind





