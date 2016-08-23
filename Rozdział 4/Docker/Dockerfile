FROM node

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY aplikacja_mgr/package.json /usr/src/app
RUN npm install

COPY aplikacja_mgr/. /usr/src/app

EXPOSE 8081

CMD [ "npm", "start" ]