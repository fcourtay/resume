# Stage 1: Build static site with Node
FROM node:22-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# Stage 2: Serve with Nginx for maximum lightness
FROM nginx:alpine AS runtime
LABEL org.opencontainers.image.source="https://github.com/fcourtay/resume"
LABEL org.opencontainers.image.description="Florent Courtay - Static Resume"

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
