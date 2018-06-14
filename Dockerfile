FROM node:carbon

LABEL maintainer="Try Ajitiono <ballinst@gmail.com>"

ARG MONGO_VERSION=3.4

# Get the key, create sources list, update local package repositories
RUN ssh-keygen -f id_rsa -t rsa -N '' -b 4096 && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
	echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/${MONGO_VERSION} multiverse" | tee /etc/apt/sources.list.d/mongodb-org-${MONGO_VERSION}.list && \
	apt-get update && \
	apt-get install -y mongodb-org
