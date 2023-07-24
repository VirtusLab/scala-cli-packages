# ScalaCli packages

This repo hosts the debian and fedora repositories with scala-cli on GithubPages. 

This repo is automatically updated in react to the Scala CLI release.

## Debian 

### How to install

```
curl -sS "https://virtuslab.github.io/scala-cli-packages/KEY.gpg" | sudo gpg --dearmor  -o /etc/apt/trusted.gpg.d/scala-cli.gpg 2>/dev/null
sudo curl -s --compressed -o /etc/apt/sources.list.d/scala_cli_packages.list "https://virtuslab.github.io/scala-cli-packages/debian/scala_cli_packages.list"
sudo apt update
sudo apt install scala-cli
``` 

## Fedora

### How to install

```
$ cat > /etc/yum.repos.d/virtuslab.repo << EOF
[virtuslab-repo]
name=VirtusLab Repo
baseurl=https://virtuslab.github.io/scala-cli-packages/CentOS/Packages
enabled=1
gpgcheck=1
gpgkey=https://virtuslab.github.io/scala-cli-packages/KEY.gpg
EOF
$ yum repo-pkgs virtuslab-repo list
$ yum install scala-cli
```

## Alpine

### How to install
```
$ wget -q -O scala-cli.gz  https://github.com/Virtuslab/scala-cli/releases/download/nightly/scala-cli-x86_64-pc-linux-static.gz && gunzip scala-cli.gz
$ chmod +x scala-cli
$ mv scala-cli /usr/bin/
```