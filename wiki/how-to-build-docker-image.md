# Build and test Docker image

## Building your image

- go to `./backend/node_farm` where you have the `*.Dockerfile`
  - RUN `$ docker build -t <your username>/node_farm`

## Run/Use the image locally

- RUN `docker run -p 49160:3000 -d <your username>/node_farm`
  - `-d` flag runs the container in detached mode
  - `-p` redirects a public port to a private port
- if you need to go inside the container use the `exec`command
  - RUN `docker exec -it <container id> /bin/bash`

## Test the container

- `docker ps`
- `curl -i localhost:49160`
