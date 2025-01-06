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

# Expone el puerto que usa tu aplicación
EXPOSE 4000

# Comando para iniciar la aplicación
CMD ["npm", "run", "start"]
