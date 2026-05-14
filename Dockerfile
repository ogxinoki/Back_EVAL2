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

# Copiamos los módulos y tu código server.js
COPY --from=builder /app/node_modules ./node_modules
COPY . .

# Puerto típico de Node, ajústalo si tu server.js usa otro
EXPOSE 8000

# Comando para iniciar tu backend
CMD ["node", "server.js"]