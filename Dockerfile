FROM node:carbon

LABEL maintainer="Try Ajitiono <ballinst@gmail.com>"

ARG MONGO_VERSION=3.6

# Get the key, create sources list, update local package repositories
RUN ssh-keygen -f id_rsa -t rsa -N '' -b 4096 && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5 && \
	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/${MONGO_VERSION} multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-${MONGO_VERSION}.list && \
	apt-get update && \
	apt-get install -y mongodb-org
