FROM node:14-alpine

RUN apk add yarn

ENV PHPGROUP=laravel
ENV PHPUSER=laravel

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

# Start application
CMD ["yarn", "npm"]