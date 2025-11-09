FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production

COPY src ./src

RUN addgroup app && adduser -S -G app app
USER app

EXPOSE 3000

CMD ["node", "src/index.js"]
