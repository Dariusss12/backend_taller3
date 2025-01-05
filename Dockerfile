FROM node:18.18.0 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install --production
RUN npm install -g sequelize-cli

COPY . .

# Instala las dependencias de desarrollo, necesarias para Babel
RUN npm install --only=dev

# Construye el código usando Babel
RUN npm run build

ARG DB_HOST
ARG DB_PORT
ARG DB_DATABASE
ARG DB_USER
ARG DB_PASSWORD
ARG TOKEN_SECRET

ENV DB_HOST=$DB_HOST
ENV DB_PORT=$DB_PORT
ENV DB_DATABASE=$DB_DATABASE
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD
ENV TOKEN_SECRET=$TOKEN_SECRET

EXPOSE 4000

CMD ["node", "dist/index.js"]
