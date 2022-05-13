# Version 1.0.1
FROM node:fermium-alpine

# Install base and dev packages
RUN apk update
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash

# Install build packages
RUN apk add make && apk add curl && apk add openssh && apk add git && apk add jq && apk add rsync

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install aws-cli
RUN apk -Uuv add groff less gcc python3 py3-pip python3-dev libffi-dev musl-dev openssl-dev

RUN pip3 install awscli
RUN pip3 install awsebcli cryptography==3.3.1 --ignore-installed six
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*

RUN yarn global add typescript

CMD ["/bin/bash"]