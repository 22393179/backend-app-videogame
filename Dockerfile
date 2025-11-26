# Usamos Node 18 como base
FROM node:18

# Crear carpeta de la app
WORKDIR /app

# Copiar package.json primero para aprovechar “cache”
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el código de la app
COPY . .

# Exponer el puerto (asegúrate que coincide con tu .env)
EXPOSE 4000

# Comando para iniciar el backend
CMD ["npm", "start"]
