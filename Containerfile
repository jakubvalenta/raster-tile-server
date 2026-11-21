# Stage 1: Cache Node dependencies
FROM docker.io/library/node:24-alpine AS cache
COPY package.json package-lock.json /home/node/app/
WORKDIR /home/node/app
RUN npm install

# Stage 2: Build Application
FROM docker.io/library/node:24-alpine AS build
COPY --from=cache /home/node/app /home/node/app
COPY --chown=node:node *.html *.js *.css /home/node/app/
WORKDIR /home/node/app
RUN npm run build

# Stage 3: Create the Runtime Image
FROM busybox:1.38 AS runtime
COPY --from=build /home/node/app/dist /app
WORKDIR /app
ENV PORT=8080
CMD ["sh", "-c", "exec busybox httpd -f -v -p $PORT"]
