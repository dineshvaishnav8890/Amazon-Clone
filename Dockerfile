FROM nginx:latest

WORKDIR /app

# Copy your application files
COPY . /usr/share/nginx/html




