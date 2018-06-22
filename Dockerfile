FROM ubuntu:xenial

LABEL maintainer="Try Ajitiono <ballinst@gmail.com>"

ARG MONGO_VERSION=3.4

# Install NodeJS v8.x and OpenSSH
RUN	apt-get -qq update && \ 
	apt-get -y install apt-transport-https curl && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs build-essential openssh-server

# Install MongoDB
RUN	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6 && \
	echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/${MONGO_VERSION} multiverse" | tee /etc/apt/sources.list.d/mongodb-org-${MONGO_VERSION}.list && \
	apt-get -qq update && \
	apt-get install -y mongodb-org

# Add directories for MongoDB database folder and SSH
RUN 	mkdir -p /data/db && mkdir -p ~/.ssh && touch ~/.ssh/known_hosts
