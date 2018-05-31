# Dockerfile

ARG NODE_TAG

FROM node:8.11.2

LABEL maintainer="Michael Shick <m@shick.us>"

WORKDIR /opt/runtime

# Install procps so nodemon will work
# https://github.com/remy/nodemon/issues/419#issuecomment-165307662
RUN apt-get update
RUN apt-get install -y procps make gcc g++ python libpq-dev

# Set up the environment
ENV PYTHON /usr/bin/python

# Copy package defs for Docker caching
COPY package.json package-lock.json ./

# Install packages
RUN npm install --quiet

# Copy runtime files
COPY nodemon.json .babelrc ./

# Copy built files
COPY build ./build