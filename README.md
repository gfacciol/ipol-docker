# Docker image of an IPOL demo server (http://www.ipol.im/)

Contains an IPOL server for development and testing of demos.

## Usage

The IPOL server is packaged as Docker image so it can easily be executed with the Docker run command.
This command will download the Docker image and start the IPOL server. To run a demo stored in a local path <path_to_app_dir> use

    docker run  -p 8080:8080  -t -i facciolo/ipol  -v <path_to_app_dir>:/ipol/app/mydemo

The server will be available at http://127.0.0.1:8080 while the server output will be shown in the console.

To access the shell of the virtual machine run 

    docker run  -p 8080:8080  -t -i facciolo/ipol  -v <path_to_app_dir>:/ipol/app/mydemo /bin/bash

and then launch the demo manually with 

    python /ipol/demo.py build run

Keep in mind that changes to the files of the virtual machine (except for the directory mounted at /ipol/app/mydemo) are lost after closing the session. 

## Mainteinance

### Build an image from the Dockerfile in this directory

    docker build -t facciolo/ipol .

### Delete a docker image and containers

First remove any exited docker container

    docker ps -a -f status=exited -q | xargs docker rm -v

then remove the image

    docker rmi facciolo/ipol

[More information about container/image cleanup to reduce disk usage](https://forums.docker.com/t/where-does-docker-keep-images-containers-so-i-can-better-track-my-disk-usage/8370/6)
