FROM node:16-alpine
WORKDIR /frontend
ADD package.json package-lock.json ./
RUN npm install
COPY src src
COPY public public
EXPOSE 3000
CMD ["npm", "start"]
