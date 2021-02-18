FROM node:lts-alpine3.12 AS builder

WORKDIR /home/frontend

RUN apk add --no-cache git npm \
    && git clone https://github.com/gothinkster/react-redux-realworld-example-app.git \
    && cd react-redux-realworld-example-app \
    && sed -i '6s~.*~const API_ROOT = "http://192.168.1.59:8080/api";~' src/agent.js \
    && npm install \
    && npm run build

FROM nginx:alpine

WORKDIR /home/frontend

COPY --from=builder\
  /home/frontend/react-redux-realworld-example-app/build \
  /usr/share/nginx/html/

EXPOSE 80 443 4100

CMD ["nginx", "-g", "daemon off;"]