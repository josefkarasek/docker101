# Docker 101
## Installation
This tutorial guides you through installation of Docker. It doesn't try to second the official docs. If you happen to miss some information, you'll most likely find it [here](http://docs.docker.com/).
### Linux Users
Docker runs on recent Linux machines natively, so you only need to download Docker binaries and start docker engine. Docker documentation describes installation for a variety of distros. Please note that to get the latest release we recommend to use the script installation method instead of using package repository of your distro. Check the official [docs](http://docs.docker.com/installation/) for your Linux distro. Example installation for Fedora:
```
$ curl -sSL https://get.docker.com/ | sh
```
Start docker engine:
```
$ sudo systemctl start docker
```
At last add your user to docker group, so you don't have to type sudo every time you use docker client.
```
$ sudo groupadd docker
$ sudo gpasswd -a $(whoami) docker
```
### Mac & Windows users
Nor Windows, neither Macs run Docker natively as of yet. To get it there we're going to use [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Docker Toolbox](https://www.docker.com/toolbox). Install VirtualBox first, then Docker Toolbox. After installing both, run the Toolbox. It will download necessary images and load Boot2Docker. Now you can test your installation.
## Test
To ensure you have succesfully installed Docker issue following command:
```
$ docker run hello-world
```
