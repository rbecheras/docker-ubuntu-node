#
# Ubuntu Node.js Dockerfile
#
FROM ubuntu:18.04

# Install Node.js
RUN apt-get update \
  && apt-get install -y curl \
  && curl --silent --location https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get install -y \
    nodejs \
    build-essential \
  # remove useless files from the current layer
  && rm -rf /var/lib/apt/lists/* \
  && apt-get autoremove \
  && apt-get clean \
  && apt-get autoclean

CMD ["node"]