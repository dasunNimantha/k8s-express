FROM node:18-alpine as base

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm install -g @vercel/ncc

RUN ncc build app.js -o dist


FROM node:18-alpine 

WORKDIR /app

COPY --from=base /app/dist/index.js .

CMD ["node", "index.js"]