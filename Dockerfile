FROM node:19-alpine AS deps

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

FROM node:19-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM node:19-alpine AS runner
WORKDIR /app
ENV PORT=4000
EXPOSE 4000
COPY package.json package-lock.json ./
RUN chown -R node ./ \
  && npm ci --production
COPY --from=builder --chown=node /app/dist ./dist

USER node
CMD ["npm", "run", "start:prod"]
