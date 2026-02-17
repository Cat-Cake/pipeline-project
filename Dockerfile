FROM node:24.13.1-alpine3.23 AS deps
WORKDIR /usr/src/app
ENV HUSKY=0
COPY package*.json ./
RUN npm ci --omit=dev --ignore-scripts


FROM node:24.13.1-alpine3.23
WORKDIR /usr/src/app
COPY --from=deps /usr/src/app/node_modules ./node_modules
COPY . .

EXPOSE 3000
CMD ["node", "bin/www"]