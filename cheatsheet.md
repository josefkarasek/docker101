## Docker cheat sheet for Devconf.cz 2016 workshop
### Containers
Create container | `-i` keep STDIN open | `-t` create pseudo TTY | `--name` name the container | `bash` process to run
```
docker create -i -t --name my_fedora fedora:23 bash
```
Start container | `-a` attach to existing TTY | `-i` keep STDIN open | `my_fedora` container name
```
docker start -a -i my_fedora 
```
Run container | `-i` keep STDIN open | `-t` create pseudo TTY | `image:tag` to run | `bash` process to run
```
docker run -it fedora:23 bash
```
List containers | `-a` include non-running containers
```
docker ps -a
```
Delete container | `-f` force | `my_fedora` container name/id
```
docker rm -f my_fedora
```
### Images
Pull `fedora:23` image
```
docker pull fedora:23
```
List locally available images | `-a` list all layers
```
docker images -a
```
Delete `fedora:23` image
```
docker rmi -f fedora:23
```

### Troubleshooting
List metadata about image/container
```
docker inspect fedora:23
docker inspect my_fedora
```
