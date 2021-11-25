# https://github.com/cypress-io/cypress-docker-images/blob/master/generate-base-image.js

# FROM ubuntu:18.04
FROM cypress/included:9.1.0

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install --no-install-recommends  -y \
    ssh \
    git \
    tar \
    gzip \
    curl \
    ca-certificates \
    python3 \
    && \
    # clean up
    rm -rf /var/lib/apt/lists/*  && \
    apt-get clean && \
    apt-get autoremove -y

# AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# DOCKERIZE
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# # INSTALL NODEJS 16
# RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
#     && apt-get install -y nodejs \
#     && npm install -g npm@8.1.4

# # INSTALL CYPRESS.IO
# RUN npm install cypress --save-dev

# RUN yarn add cypress --dev


# RUN npx cypress open