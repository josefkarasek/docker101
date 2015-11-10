# Docker 101
## Presentation
Slides for this workshop are available [online](http://redhat.slides.com/jkarasek/docker101/fullscreen?token=V6ismABL) now!
## Installation
This tutorial guides you through installation of Docker. It doesn't try to second the official docs. If you happen to miss some information, you'll most likely find it [here](http://docs.docker.com/).
### Linux Users
Docker runs on recent Linux machines natively, so you only need to install Docker package and start docker engine. Search your repositories for Docker package. Example installation for Fedora:
```
# sudo dnf install docker
```
Start docker engine:
```
$ sudo systemctl start docker
```
At last add your user to docker group, so you don't have to type sudo every time you use docker client.
```
$ sudo usermod -aG docker $(whoami)
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
