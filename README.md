# kind-for-cka


# need more than 1 node ?

https://kind.sigs.k8s.io/docs/user/quick-start/#configuring-your-kind-cluster

kind create cluster --config --config-file

where config-file:

```
# three node (two workers) cluster config
kind: Config
apiVersion: kind.sigs.k8s.io/v1alpha2
nodes:
- role: control-plane
- role: worker
  replicas: 2
  
```



#  zsh and oh my zsh installation:



```
yum -y install zsh

chsh -s /bin/zsh

yum install -y git

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

or 

 sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```


#  CentOS 7

##  go环境搭建

###
```
yum -y install bash-completion
```

### 安装golang

install epel-release if needed !!!
```
yum -y install epel-release
```

```
yum install -y golang

go version

```

###  配置环境


```
mkdir $HOME/go

vim ~/.bashrc
#vim ~/.zshrc

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

. $HOME/.bashrc

```
###  检查环境


```
go env
```
##  安装docker

###  安装docker
####  方法一：

```
cd /etc/yum.repos.d

wget  https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce
```
####  方法二：
```
curl -fsSL get.docker.com -o get-docker.sh

sh get-docker.sh
```

###  配置国内源【并非完全必要】

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

### 方法三： 国内阿里云的源

```
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
```

安装kubectl
```
yum -y install kubectl

```


##  安装kind

```
go get sigs.k8s.io/kind 

kind create cluster
```

找不到kind：

错误方法
```
添加
export PATH=$PATH:/root/go/bin
到.bashrc

```

正确方法：
在配置go环境变量的时候就设置好路径$PATH
```
export GOPATH=/root/go
export PATH=$PATH:$GOPATH/bin
```

##  shell补全

### shell补全

### kubectl补全

####  bash
```
source <(kubectl completion bash) 
echo "source <(kubectl completion bash)" >> ~/.bashrc 
```

####  zsh

```
source <(kubectl completion zsh)
```


edit .zshrc and add the following lines
```
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi
```

## 设置配置文件

```

export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"


```


##  集群测试


```
kubectl cluster-info
```

## 集群创建指南

创建   
删除    
...    

# .zshrc中写入的内容

```
#go env setup
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#kubectl completion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

export KUBECONFIG="$(kind get kubeconfig-path --name="kind")"

#kubeclt alias
alias k=kubectl

```


参考：
https://github.com/kubernetes-sigs/kind/tree/master/docs/user



reference:
https://github.com/kubernetes-sigs/kind







