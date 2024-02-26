FROM node:20-slim

RUN corepack enable

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --prod --frozen-lockfile

COPY . /app

EXPOSE 3000

CMD [ "node", "src/index.js" ]
