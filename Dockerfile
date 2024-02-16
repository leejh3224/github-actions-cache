FROM node:20-slim AS base
RUN corepack enable
WORKDIR /app

FROM base AS deps
COPY package.json pnpm-lock.yaml ./
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --prod --frozen-lockfile

FROM base
COPY --from=deps /app/node_modules /app/node_modules
COPY . /app
EXPOSE 3000
CMD [ "node", "src/index.js" ]
