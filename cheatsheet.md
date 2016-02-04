## Docker cheat sheet for Devconf.cz 2016 workshop

### Images
__Pull `fedora:23` image__
```
docker pull fedora:23
```
__List locally available images__ | `-a` list all layers
```
docker images -a
```
__Delete `fedora:23` image__
```
docker rmi -f fedora:23
```

### Containers
__Create container__ | `-i` keep STDIN open | `-t` create pseudo TTY | `--name` name the container | `bash` process to run
```
docker create -i -t --name my_fedora fedora:23 bash
```
__Start container__ | `-a` attach to existing TTY | `-i` keep STDIN open | `my_fedora` container name
```
docker start -a -i my_fedora 
```
__Run container__ | `-i` keep STDIN open | `-t` create pseudo TTY | `image:tag` to run | `bash` process to run
```
docker run -it fedora:23 bash
```
__List containers__ | `-a` include non-running containers
```
docker ps -a
```
__Delete container__ | `-f` force | `my_fedora` container name/id
```
docker rm -f my_fedora
```
__Expose ports as random ports on the host__ | `-P` ports specified in image will be mapped to random ports on the host | `-d` run in background
```
docker run -d -P --name my_nginx nginx
```
__Expose ports as specific ports on the host__ | `-p` container port 80 will be mapped to the host as 8080
```
docker run -d -p 8080:80 nginx
```
__Mount volume from host__ | `-v` mount hostdir /tmp/nginx to container as /usr/share/nginx/html, read only, `Z` enable access through selinux 
```
docker run -d -p 8080:80 -v /tmp/nginx:/usr/share/nginx/html:ro,Z nginx
```
__Set enviromental variables__ | `-e` key=value pair
```
docker run -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=admin --name DB -d mysql
```
__Link with another container__ | `--link` \<id of designated container\>:\<alias used inside new container\>
```
docker run --name DB -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=admin -d mysql
docker run -e WORDPRESS_DB_PASSWORD=admin -d --name WP --link DB:mysql -p 8080:80 wordpress
```

### Troubleshooting
__List metadata about image/container__
```
docker inspect fedora:23
docker inspect my_fedora
```
