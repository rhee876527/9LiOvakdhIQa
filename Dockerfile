FROM node:20-alpine3.20
WORKDIR /app

RUN apk update && apk add git   
RUN git clone https://github.com/zyachel/quetre .
RUN npm i -g pnpm
RUN pnpm install

EXPOSE 3000

#run as non-root user
RUN chown -R node /app/public
USER node 
CMD ["pnpm", "start"]
