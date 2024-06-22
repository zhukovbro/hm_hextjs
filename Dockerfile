FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

RUN npm run build && \
    npm uninstall npm && \
    rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

EXPOSE 3000

CMD ["npm", "start"]