# Docker image of an IPOL demo server (http://www.ipol.im/)

Contains an IPOL server for development and testing of demos.

## Usage

The IPOL server is packaged as Docker image so it can easily be executed with the Docker run command.
This means that **you don't need to download this repository**, just **install Docker for [windows](https://docs.docker.com/docker-for-windows/), [mac](https://docs.docker.com/docker-for-mac/), or [linux](https://docs.docker.com/engine/installation/linux/)** and then **run the following command**. It will download the Docker image and start the IPOL server right away, compiling and running the demo stored in a local path *\<path_to_app_dir\>*

    docker run  -p 8080:8080  -v <path_to_app_dir>:/ipol/app/mydemo  -t -i facciolo/ipol 

The server will be visible at [http://127.0.0.1:8080](http://127.0.0.1:8080) and the server output will be shown in the console. To stop the server just press *Ctrl-C* in the console.


To access the shell of the virtual machine run 

    docker run  -p 8080:8080  -v <path_to_app_dir>:/ipol/app/mydemo  -t -i facciolo/ipol  /bin/bash

and then launch the demo manually with 

    python /ipol/demo.py build run

Keep in mind that changes to the files of the virtual machine (except for the directory mounted at /ipol/app/mydemo) are lost after closing the session. 

## Mainteinance

### Build an image from the Dockerfile in this directory

    docker build -t facciolo/ipol .

### List all images and containers 

    docker images -a

    docker ps -a

### Delete a docker image and containers

First remove any exited docker container

    docker ps -a -f status=exited -q | xargs docker rm -v

then remove the image

    docker rmi facciolo/ipol

[More information about container/image cleanup to reduce disk usage](https://forums.docker.com/t/where-does-docker-keep-images-containers-so-i-can-better-track-my-disk-usage/8370/6)
