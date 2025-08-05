FROM node:18-alpine
WORKDIR /usr/src/app
COPY src/ ./src
RUN npm install
EXPOSE 3000
CMD ["node", "src/index.js"]
