 # ETAPA 1: Construcción
FROM node:18-slim AS builder
WORKDIR /app
COPY package.json ./
RUN npm install

# ETAPA 2: Ejecución
FROM node:18-slim
WORKDIR /app

# Usuario no root
RUN useradd -m student
USER student

# Copiamos los módulos y el código
COPY --from=builder /app/node_modules ./node_modules
COPY . .

# Puerto correcto
EXPOSE 3000

# Comando para iniciar el backend
CMD ["node", "server.js"]
