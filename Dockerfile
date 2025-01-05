# Usa una imagen base de Node.js
FROM node:18.18.0

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos del proyecto necesarios para instalar dependencias
COPY package*.json ./

# Instala las dependencias globales y locales necesarias
RUN npm install -g sequelize-cli && npm install

# Copia el resto de los archivos del proyecto al contenedor
COPY . .

# Define argumentos para las variables de entorno
ARG DB_HOST
ARG DB_PORT
ARG DB_DATABASE
ARG DB_USER
ARG DB_PASSWORD
ARG TOKEN_SECRET

# Establece las variables de entorno para que sean accesibles dentro del contenedor
ENV DB_HOST=$DB_HOST
ENV DB_PORT=$DB_PORT
ENV DB_DATABASE=$DB_DATABASE
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD
ENV TOKEN_SECRET=$TOKEN_SECRET

# Expone el puerto que usa tu aplicación
EXPOSE 4000

# Comando para iniciar la aplicación
CMD ["node","app.js"]
