FROM node:20-alpine3.17

WORKDIR /website

COPY . .

RUN npm install

ENV LOCALE="en"

ENTRYPOINT ["sh", "-c", "npm run start -- --host 0.0.0.0 --locale $LOCALE"]
