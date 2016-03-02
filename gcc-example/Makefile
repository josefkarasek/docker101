CC=gcc
SOURCES=sum.c
EXECUTABLE=sum
DOCKER_IMAGE=pschiffe/docker101-gcc
DOCKER_IMAGE_PATH=/gcc

all: $(EXECUTABLE)

$(EXECUTABLE): $(SOURCES)
	docker run --rm -v `pwd`:$(DOCKER_IMAGE_PATH):Z $(DOCKER_IMAGE) $(CC) $(SOURCES) -o $@

run: $(EXECUTABLE)
	docker run -it --rm -v `pwd`:$(DOCKER_IMAGE_PATH):Z $(DOCKER_IMAGE) ./$(EXECUTABLE)

clean:
	rm -f $(EXECUTABLE)
