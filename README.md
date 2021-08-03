# ScalaCli packages

## How to install

```
curl -s --compressed "https://virtuslabrnd.github.io/scala-cli-packages/debian/KEY.gpg" | sudo apt-key add -
sudo curl -s --compressed -o /etc/apt/sources.list.d/scala_cli_packages.list "https://virtuslabrnd.github.io/scala-cli-packages/debian/scala_cli_packages.list"
sudo apt update
sudo apt install scala-cli
```