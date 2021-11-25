# https://github.com/cypress-io/cypress-docker-images/blob/master/generate-base-image.js

# FROM ubuntu:18.04
FROM cypress/base:latest

RUN apt-get update && \
    apt-get install --no-install-recommends  -y \
    ssh \
    git \
    tar \
    gzip \
    curl \
    ca-certificates \
    python3 \
    libgtk2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    xauth \
    xvfb && \
    # clean up
    rm -rf /var/lib/apt/lists/*  && \
    apt-get clean && \
    apt-get autoremove -y

# INSTALL NODEJS 16
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@8.1.4

# INSTALL CYPRESS.IO
RUN npm install cypress --save-dev