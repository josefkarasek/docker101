CC=gcc
SOURCES=sum.c
EXECUTABLE=sum
DOCKER_IMAGE=pschiffe/docker101-gcc
DOCKER_IMAGE_PATH=/gcc

.PHONY: all run clean

all: $(EXECUTABLE)

$(EXECUTABLE): $(SOURCES)
	sudo docker pull $(DOCKER_IMAGE)
	sudo sh -c 'docker run -v `pwd`:$(DOCKER_IMAGE_PATH) --rm --security-opt label:disable --user $$SUDO_UID:$$SUDO_GID $(DOCKER_IMAGE) $(CC) $(SOURCES) -o $@'

run: $(EXECUTABLE)
	sudo sh -c 'docker run -it -v `pwd`:$(DOCKER_IMAGE_PATH) --rm --security-opt label:disable --user $$SUDO_UID:$$SUDO_GID $(DOCKER_IMAGE) ./$(EXECUTABLE)'

clean:
	rm -f $(EXECUTABLE)
