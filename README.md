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
If you wonder why this is necessary Dan Walsh has written an [article](http://www.projectatomic.io/blog/2015/08/why-we-dont-let-non-root-users-run-docker-in-centos-fedora-or-rhel/), where he goes deep into the security settings of Fedora and RHEL.
#### Ubuntu
A section of [this](https://www.digitalocean.com/community/tutorials/how-to-dockerise-and-deploy-multiple-wordpress-applications-on-ubuntu) tutorial can be helpful while installing Docker on Ubuntu.
### Windows Users
#### Important: UPDATE
Running Boot2docker to bring Linux containers to Windows and Mac machine is sometimes cumbersome and can behave differently than native installation. That's why we looked for a deffirent way, how to bring Docker to non-native enviroments, however still using Virtualbox. But without using Boot2docker. Next couple of lines describe the Atomic Project's bundle, which not only contains Docker, but additional features related to Docker, such as Nulecule (1st talk will be about Nulecule!) or Kubernetes. To install the bundle, you will need these apps (Mac users are encouradged to use brew to [install](#mac_users) them):
1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Vagrant](https://www.vagrantup.com/downloads.html) - automates operations upon virtualbox, so you only run `$ vagrant up` to run the bundle 
3. [Cygwin](https://www.cygwin.com/) - command line terminal to run your commands ([direct download](https://www.cygwin.com/setup-x86_64.exe)). Click through the installation and on the **Choose A Download Site** select **mirrors.kernel.org** as a download site. In the next window (**Select packages**) search for (1) **rsync** and click on the cycling arrows on the **net** line to install this package, then search for (2) **openssh** and do the same to install it. Then continue.

After the installation restart your PC to apply changes. Then run **CygWin64 Terminal** and type:
```
$ export VAGRANT_DETECTED_OS=cygwin
$ vagrant init atomicapp/dev
$ vagrant up
$ vagrant ssh
```
Now you're running your own installation of the Atomic project's bundle! You can test your docker installation by typing `docker run hello-world`.

## <a name="mac_users"></a>Mac Users
Just use brew to do the job for you ;-)
```
$ brew cask install virtualbox
$ brew cask install vagrant
$ brew cask install vagrant-manager
$ vagrant init atomicapp/dev
$ vagrant up
$ vagrant ssh
```
If installation via brew fails, use the links above and download installers for MacOS.
After succesfull installation open up terminal and type:
```
$ mkdir vagrant_images
$ cd vagrant_images
$ vagrant init atomicapp/dev
$ vagrant up
$ vagrant ssh
```
## Last resort installation
Nor Windows, neither Macs run Docker natively as of yet. To get it there we're going to use [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Docker Toolbox](https://www.docker.com/toolbox). Install VirtualBox first, then Docker Toolbox. After installing both, run the Toolbox. It will download necessary images and load Boot2Docker. Now you can test your installation.
## Test
To ensure you have succesfully installed Docker issue following command:
```
$ docker run hello-world
```
