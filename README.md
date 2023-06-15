# JetBrains IDE backend

*Based on https://hub.docker.com/r/laszlo/gateway*

## Getting started

This container-image works as an endpoint for jetbrains gateway.
It delivers a full working sshd-deamon on latest ubuntu.
Comes with an java-jdk 18 for work with intellij and a dotnet 7.x for work with Rider.
Currently it works with static username. next versions let you choose a username and password.
You can mount the home-directory from outside. This ist nice, if you would inject the e.g. .ssh-directory with you ssh-keys (for github / gitlab)).

## Build

`docker build --file ubuntu23.04.dockerfile -t ${DOCKER_USER}/${DOCKER_REPO}:$TAG . --no-cache`
`docker push ${DOCKER_USER}/${DOCKER_REPO}:$TAG`
`docker run -v /var/run/docker.sock:/var/run/docker.sock ${DOCKER_USER}/${DOCKER_REPO}:$TAG`


## Usage (with docker-compose):
```
version: '3.8'
services:
  jetbrains-ide-backend:
    image: martin.gruber/jetbrains-ide-backend:0.1.0
    container_name: jetbrains-ide-backend
    ports:
      - '2222:22'
    restart: unless-stopped
    volumes:
      - path/to/your/directory:/home/laszlo
      # To be able to run "docker commands in the docker container"
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - USERNAME=laszlo
      - PASSWORD=password
...

```
When you set the username, the same name is the home-directory inside of the container e.g. if your $USERNAME is horst, then the home dir (for volume-mapping) is /home/horst.

Password is needed, if you connect via ssh into the container (login with Rider / IntelliJ).

Any suggestions, issues or else, contact me on the projects website.
https://gitlab.com/Laszlo.Lueck/gateway