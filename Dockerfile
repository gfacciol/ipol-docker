FROM ubuntu:14.04 
MAINTAINER Gabriele Facciolo <gfacciol@gmail.com>
# ipol devel base packages
RUN apt-get update && apt-get install -y wget curl git gcc g++ make cmake libfftw3-dev libtiff5-dev libpng-dev libgsl0-dev libeigen2-dev libeigen3-dev zlib1g-dev liblapacke-dev libblas-dev
# python, numpy and PIL
RUN apt-get install -y python python-numpy python-mako python-cherrypy3 python-PIL 
RUN wget -O- https://bootstrap.pypa.io/get-pip.py | python
RUN pip install -U pip
# ipol demo server
RUN mkdir /ipol/ && curl "http://dev.ipol.im/git/?p=colom/ipol_demo.git;a=snapshot;h=light;sf=tgz" | tar xzv -C /ipol --strip-components=1
RUN sed s/127\.0\.0\.1/0.0.0.0/g /ipol/demo.conf.example > /ipol/demo.conf
WORKDIR /ipol
EXPOSE 8080
CMD ["python", "demo.py", "build", "run"]
