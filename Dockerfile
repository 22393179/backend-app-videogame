FROM node:18

WORKDIR /app

# Copia solo los package para evitar recaching de dependencias
COPY package*.json ./
RUN npm install --production

# Copia TODO el proyecto (incluyendo el serviceAccount key)
COPY . .

# Aseguramos que exista
RUN ls -la /app/src/config/

EXPOSE 3000

CMD ["npm", "start"]
