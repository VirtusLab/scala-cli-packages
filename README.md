# ScalaCli packages

## Debian 

### How to install

```
curl -s --compressed "https://virtuslabrnd.github.io/scala-cli-packages/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/scala_cli_packages.list "https://virtuslabrnd.github.io/scala-cli-packages/debian/scala_cli_packages.list"
sudo apt update
sudo apt install scala-cli
``` 

## Fedora

### How to install

```
$ vim /etc/yum.repos.d/virtuslab.repo
[virtuslab-repo]
name=VirtusLab Repo
baseurl=https://virtuslabrnd.github.io/scala-cli-packages/fedora/Packages
enabled=1
gpgcheck=1
gpgkey=https://virtuslabrnd.github.io/scala-cli-packages/KEY.gpg
$ yum repo-pkgs virtuslab-repo list
$ yum install scala-cli
```