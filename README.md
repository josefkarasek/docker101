# Docker 101 - DevConf.cz 2016
At the workshop all atendees will be given a USB stick with Fedora Live image, that will contain all necessary binaries, so no preparation for the workshop required. That said, having Docker installed localy will be beneficial for your own experiments once the workshop ends.
## Installation
This tutorial guides you through installation of Docker. However, it does not second the official documentation. If you happen to miss some information, you'll most likely find it [there](http://docs.docker.com/).
### Linux Users
Docker runs on recent Linux machines natively, so you only need to install Docker package and start docker daemon. A good practice is to install package from your distro repository, just search for Docker package.  Example installation for Fedora:
```
# sudo dnf install docker
```
Start docker engine:
```
$ sudo systemctl start docker
```
At last create a docker group and add your user to that group, so you don't have to type sudo every time you use docker client.
```
$ sudo groupadd docker
$ sudo gpasswd -a $(whoami) docker
```
If you wonder why this is necessary Dan Walsh has written an [article](http://www.projectatomic.io/blog/2015/08/why-we-dont-let-non-root-users-run-docker-in-centos-fedora-or-rhel/), where he goes deep into the security settings of Fedora and RHEL.
#### Ubuntu
A section of [this tutorial](https://www.digitalocean.com/community/tutorials/how-to-dockerise-and-deploy-multiple-wordpress-applications-on-ubuntu) can be helpful while installing Docker on Ubuntu.
### Windows or Mac Users
Next couple of lines describe the Atomic Project's bundle, which not only contains Docker, but additional features related to Docker, such as Nulecule or Kubernetes. To install the bundle, you will need these apps (Mac users are encouradged to use brew to [install](#mac_users) them):

1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads) 
2. [Cygwin](https://www.cygwin.com/) - command line terminal to run your commands ([direct download](https://www.cygwin.com/setup-x86_64.exe)). Click through the installation and on the **Choose A Download Site** select **mirrors.kernel.org** as a download site. In the next window (**Select packages**) search for (1) **rsync** and click on the cycling arrows on the **net** line to install this package, then search for (2) **openssh** and do the same to install it. Then continue.
3. [Vagrant](https://www.vagrantup.com/downloads.html) - automates operations upon virtualbox, so you only run `$ vagrant up` to run the bundle.

After the installation restart your PC to apply changes. Then run **CygWin64 Terminal** and type:
```
$ export VAGRANT_DETECTED_OS=cygwin
$ mkdir vagrant_images
$ cd vagrant_images
$ vagrant init atomicapp/dev
$ vagrant up
$ vagrant ssh
```
Now you're running your own installation of the Atomic project's bundle! You can test your docker installation by typing `docker run hello-world`.

## <a name="mac_users"></a>Mac Users
Just use brew to download and install necessary software:
```
$ brew cask install virtualbox
$ brew cask install vagrant
$ brew cask install vagrant-manager
$ mkdir vagrant_images
$ cd vagrant_images
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
Nor Windows, neither Macs run Docker natively as of yet. To get it there you can use [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Docker Toolbox](https://www.docker.com/toolbox). Install VirtualBox first, then Docker Toolbox. After installing both, run the Toolbox. It will download necessary images and load Boot2Docker. Now you can test your installation.
## Test
To ensure you have succesfully installed Docker issue following command:
```
$ docker run hello-world
```
