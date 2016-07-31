## Docker image of an IPOL demo server (http://www.ipol.im/)

Contains an IPOL server for developement and testing of demos.

# Start the IPOL server with a demo stored in a local path
    docker run  -p 8080:8080  -t -i facciolo/ipol:v0  -v <path_to_app_dir>:/ipol/app/mydemo

