# Linux Containers Course

[![Build Status](https://travis-ci.org/pschiffe/docker101.svg)](https://travis-ci.org/pschiffe/docker101)

Slides are available here - [josefkarasek.github.io/docker101](https://josefkarasek.github.io/docker101/) (source files can be found in the gh-pages branch)

Feedback form for the 5. session - [schiffer.typeform.com/to/cOl04R](https://schiffer.typeform.com/to/cOl04R)

PDF version and archive of the html slides can be found here - [github.com/pschiffe/docker101/releases](https://github.com/pschiffe/docker101/releases)

## Installation
This tutorial guides you through installation of Docker. However, it does not second the official documentation. If you happen to miss some information, you'll most likely find it [there](http://docs.docker.com/).

### Linux Users
Docker runs on recent Linux machines natively, so you only need to install Docker package and start docker daemon. A good practice is to install package from your distro repository, just search for Docker package.  Example installation for Fedora:
```
sudo dnf install docker
```
Start docker engine:
```
sudo systemctl start docker
```
At last create a docker group and add your user to that group, so you don't have to type sudo every time you use docker client.
```
sudo groupadd docker
sudo gpasswd -a $(whoami) docker
```
If you wonder why this is necessary Dan Walsh has written an [article](http://www.projectatomic.io/blog/2015/08/why-we-dont-let-non-root-users-run-docker-in-centos-fedora-or-rhel/), where he goes deep into the security settings of Fedora and RHEL.

#### Ubuntu
A section of [this tutorial](https://www.digitalocean.com/community/tutorials/how-to-dockerise-and-deploy-multiple-wordpress-applications-on-ubuntu) can be helpful while installing Docker on Ubuntu.

### Windows or Mac Users
Next couple of lines describe the Atomic Project's bundle, which not only contains Docker, but additional features related to Docker, such as Nulecule or Kubernetes. To install the bundle, you will need these apps (Mac users are encouradged to use brew to [install](#mac_users) them):

1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads) 
2. [Vagrant](https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4.msi) 1.7.4 - automates operations upon VirtualBox, so you can only run `$ vagrant up` to run the bundle.
3. [Cygwin](https://www.cygwin.com/) - command line terminal to run your commands ([direct download](https://www.cygwin.com/setup-x86_64.exe)). Click through the installation and on the **Choose A Download Site** select **mirrors.kernel.org** as a download site. In the next window (**Select packages**) search for (1) **rsync** and click on the cycling arrows on the **net** line to install this package, then search for (2) **openssh** and do the same to install it.

After the installation restart your PC to apply changes. Then run **CygWin64 Terminal** and type:
```
export VAGRANT_DETECTED_OS=cygwin
mkdir vagrant-images
cd vagrant-images
vagrant init projectatomic/adb
vagrant up
vagrant ssh
```
Now you're running your own installation of the Atomic project's bundle! You can test your docker installation by typing `docker run hello-world`.

## <a name="mac_users"></a>Mac Users
Just use brew to download and install necessary software:
```
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
mkdir vagrant-images
cd vagrant-images
vagrant init projectatomic/adb
vagrant up
vagrant ssh
```
If installation via brew fails, use the links above and download installers for Mac.
After successful installation open up terminal and type:
```
mkdir vagrant-images
cd vagrant-images
vagrant init projectatomic/adb
vagrant up
vagrant ssh
```

## Last resort installation
Nor Windows, neither Macs run Docker natively as of yet. To get it there you can use [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Docker Toolbox](https://www.docker.com/toolbox). Install VirtualBox first, then Docker Toolbox. After installing both, run the Toolbox. It will download necessary images and load Boot2Docker. Now you can test your installation.

## Test
To ensure you have successfully installed Docker issue following command:
```
docker run hello-world
```

## To pre-download Docker images for workshop, do:
```
docker pull fedora
docker pull nginx
docker pull mariadb
docker pull wordpress
docker pull pschiffe/docker101-gcc
```
