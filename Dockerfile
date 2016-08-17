FROM node:argon

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY src/package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY src/. /usr/src/app

RUN npm run build-css 

EXPOSE 3000
CMD [ "npm", "start" ]
