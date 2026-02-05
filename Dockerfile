FROM node:18-slim

# Crear carpetas
RUN mkdir -p /data /webdav /filestash

# Copiar servidor WebDAV
COPY webdav/server.js /webdav/server.js

# Instalar servidor WebDAV
RUN npm install webdav-server@2 -g

# Instalar FileStash
RUN apt-get update && apt-get install -y wget unzip \
    && wget https://github.com/mickael-kerjean/filestash/releases/download/latest/filestash.zip \
    && unzip filestash.zip -d /filestash \
    && rm filestash.zip

# Exponer puertos
EXPOSE 8334
EXPOSE 1900

# Comando de arranque
CMD node /webdav/server.js & /filestash/filestash
