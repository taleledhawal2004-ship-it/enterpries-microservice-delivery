FROM node:18-alpine

WORKDIR /usr/src/app

USER node

COPY --chown=node:node server.js .

EXPOSE 8080

CMD ["node", "server.js"