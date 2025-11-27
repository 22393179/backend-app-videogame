# Imagen base oficial de Node
FROM node:18

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar archivos de definición de dependencias
COPY package*.json ./

# Instalar dependencias (solo las necesarias en producción)
RUN npm install --production

# Copiar el resto del proyecto
COPY . .

# 🔥 Asegurar que el archivo esté dentro del contenedor
COPY src/config/serviceAccountKey.json /app/src/config/serviceAccountKey.json

# Render asigna el puerto a través de process.env.PORT
ENV PORT=3000

# Exponer el mismo puerto dentro del contenedor
EXPOSE 3000

# Comando final para ejecutar el servidor
CMD ["npm", "start"]
