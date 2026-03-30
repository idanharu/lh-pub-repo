FROM node:20
COPY index.js .
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "server.js"]
