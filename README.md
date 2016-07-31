# Docker image of an IPOL demo server (http://www.ipol.im/)

Contains an IPOL server for development and testing of demos.

## Usage

The IPOL server is packaged as Docker image so it can easily be executed with the Docker run command.
To start the IPOL server with a demo stored in a local path <path_to_app_dir> use

    docker run  -p 8080:8080  -t -i facciolo/ipol  -v <path_to_app_dir>:/ipol/app/mydemo

The server will be available at http://127.0.0.1:8080 while the server output is shown in the console.

To access the shell of the container run 

    docker run  -p 8080:8080  -t -i facciolo/ipol  -v <path_to_app_dir>:/ipol/app/mydemo /bin/bash

and launch the server manually with 

    python /ipol/demo.py build run

## Mainteinance

### Build an image from the Dockerfile in this directory

    docker build -t facciolo/ipol2 .

### Delete a docker image

    docker rmi facciolo/ipol2

