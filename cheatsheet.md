## Docker cheat sheet for Devconf.cz 2016 workshop
### Containers
___Create container___ | `-i` keep STDIN open | `-t` create pseudo TTY | `--name` name the container | `bash` process to run
```
docker create -i -t --name my_fedora fedora:23 bash
```
___Start container___ | `-a` attach to existing TTY | `-i` keep STDIN open | `my_fedora` container name
```
docker start -a -i my_fedora 
```
___Run container___ | `-i` keep STDIN open | `-t` create pseudo TTY | `image:tag` to run | `bash` process to run
```
docker run -it fedora:23 bash
```
___List containers___ | `-a` include non-running containers
```
docker ps -a
```
___Delete container___ | `-f` force | `my_fedora` container name/id
```
docker rm -f my_fedora
```
___Expose ports as random ports on the host___ | `-P` ports specified in image will be mapped to random ports on the host | `-d` run in background
```
docker run -d -P --name my_nginx nginx
```
___Expose ports as specific ports on the host___ | `-p` container port 80 will be mapped to the host as 8080
```
docker run -d -p 8080:80 nginx
```
___Mount volume from host___ | `-v` mount hostdir ~HOME/www to container as /var/www, read only, `Z` enable access through selinux 
```
docker run -d -p 8080:80 -v /tmp/nginx:/usr/share/nginx/html:ro,Z nginx
```
__Set enviromental variables__ | `-e` key=value pair
```
docker run -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=admin --name DB -d mysql
```
___Link with another container___
```
docker run --name DB -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=admin -d mysql
docker run -e WORDPRESS_DB_PASSWORD=admin -d --name WP --link DB:mysql -p 8080:80 wordpress
```
### Images
___Pull `fedora:23` image___
```
docker pull fedora:23
```
___List locally available images___ | `-a` list all layers
```
docker images -a
```
___Delete `fedora:23` image___
```
docker rmi -f fedora:23
```

### Troubleshooting
___List metadata about image/container___
```
docker inspect fedora:23
docker inspect my_fedora
```
