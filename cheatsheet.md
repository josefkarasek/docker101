## Docker cheat sheet for the workshop

### Images
__Pull `fedora` image__
```
docker pull fedora
```
__List locally available images__
```
docker images
```
__Delete `fedora` image__
```
docker rmi fedora
```

### Containers
__Create container__ | `-i` keep STDIN open | `-t` create pseudo TTY | `--name` name of the container
```
docker create -i -t --name my_fedora fedora bash
```
__List containers__
```
docker ps
```
__List containers__ | `-a` include non-running containers
```
docker ps -a
```
__Start container__ | `-a` attach to the existing TTY | `-i` keep STDIN open
```
docker start -a -i my_fedora 
```
__Delete container__ | `-f` remove container even if it's running
```
docker rm -f my_fedora
```
__Run container__ | `-it` interactive mode | `--rm` remove container when it stops | `--name` name of the container
```
docker run -it --rm --name my_fedora fedora bash
```
```
dnf install procps-ng iproute hostname  # Bad practice!
ps ax
sleep 10000
ip a
hostname

ps axjf
hostname
```
```
docker run -it --rm --name my_fedora --memory 256m fedora bash

dnf install stress  # Bad practice!
stress --vm 2 --vm-bytes 512M

systemd-cgtop
```
__Run container in the backgroun__ | `-d` run in background
```
docker run -d --name my_nginx nginx
```
__Expose ports as random ports on the host__ | `-P` ports specified in image will be mapped to random ports on the host | `-d` run in background
```
docker run -d -P --name my_nginx nginx

docker port my_nginx
```
__Expose ports to specific ports on the host__ | `-p` hostPort:containerPort
```
docker run -d -p 80:80 --name my_nginx nginx
```
__Mount volume from host__ | `-v` mount hostdir /tmp/nginx to container as /usr/share/nginx/html, read only, `Z` enables access when selinux is on
```
docker run -d -p 80:80 -v /tmp/nginx:/usr/share/nginx/html:ro,Z --name my_nginx nginx

docker inspect my_nginx
```
__Set environmental variables__ | `-e` key=value pair
```
docker run -d -e MYSQL_ROOT_PASSWORD=my-secret-pw --name my_mariadb mariadb
```
__Link with another container__ | `--link` \<name of the designated container\>:\<alias used inside the new container\>
```
docker run -d -p 80:80 --link my_mariadb:mysql --name my_wordpress wordpress
```
__Execute command inside running container__ | `-it` interactive mode
```
docker exec -it my_wordpress bash
```
