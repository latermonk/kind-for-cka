# microk8s [ubuntu]

https://github.com/ubuntu/microk8s

## install

```
snap install microk8s --classic
```

等待查询


```
microk8s.status --wait-ready
```
## setup

### alias

```

snap alias microk8s.kubectl kubectl

```

### add plugin

```
microk8s.disable dashboard dns
```
check:

```
kubectl cluster-info
```


```
microk8s.stop

microk8s.start

microk8s.reset

microk8s.inspect

```

