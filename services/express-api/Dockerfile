FROM node:18-alpine as base

WORKDIR /app

RUN apk add --update nodejs~=18 npm~=9

COPY package*.json /app/

RUN npm install

COPY . /app/

RUN npm install -g @vercel/ncc

RUN ncc build app.js -o dist


FROM alpine 

WORKDIR /app

RUN apk add --update nodejs~=18 npm~=9

COPY --from=base /app/dist/index.js /app/

CMD ["node", "index.js"]