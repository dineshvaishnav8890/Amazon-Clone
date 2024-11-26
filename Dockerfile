FROM nginx:1.27.2-alpine3.20-slim

WORKDIR /app

# Copy your application files
COPY . /usr/share/nginx/html




