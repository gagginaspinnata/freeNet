FROM ubuntu

WORKDIR /home/

RUN apt-get update && apt-get upgrade -y && apt-get install git wget -y


RUN git clone https://github.com/gagginaspinnata/freeNet.git

RUN chmod +x freeNet/vpsmanagersetup.sh

EXPOSE 443 80 8080 3128