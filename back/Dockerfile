FROM node:lts-alpine3.12

RUN apk add --no-cache git npm \
    && git clone https://github.com/gothinkster/node-express-realworld-example-app.git \
    && cd node-express-realworld-example-app \
    && npm install

WORKDIR node-express-realworld-example-app/
    
ENTRYPOINT ["npm", "run", "start"]
