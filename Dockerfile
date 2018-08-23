#
# ubuntu-node Dockerfile
# An Ubuntu distribution of Node.js
#
# See https://hub.docker.com/r/rbecheras/ubuntu-node
#
#     docker pull rbecheras/ubuntu-node
#
FROM ubuntu:18.04
LABEL Author="Rémi Becheras <remi.becheras@gmail.com>"

# Install Node.js, Yarn and required dependencies
RUN apt-get update \
  && apt-get install -y curl gnupg build-essential \
  && curl --silent --location https://deb.nodesource.com/setup_8.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get remove -y --purge cmdtest \
  && apt-get update \
  && apt-get install -y nodejs yarn \
  # remove useless files from the current layer
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/apt/lists.d/* \
  && apt-get autoremove \
  && apt-get clean \
  && apt-get autoclean

RUN adduser --disabled-password --gecos "" --uid 1000 node

USER 1000
WORKDIR /home/node
CMD ["node"]