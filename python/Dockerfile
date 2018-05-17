FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6

# Create app directory
RUN mkdir -p /server
WORKDIR /server

# Bundle app source
COPY ./server.py /server
EXPOSE 6666:6666
CMD ["/usr/bin/python3", "server.py"]