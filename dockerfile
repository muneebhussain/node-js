FROM node:12-slim AS builder
WORKDIR /usr/src/app
COPY . ./
RUN npm install --only=production 
FROM node:12-slim
WORKDIR /usr/src/app
#COPY package*.json ./
#RUN npm install --only=production
COPY --from=builder  /usr/src/app ./
CMD [ "npm", "start" ]
