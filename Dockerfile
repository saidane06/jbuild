FROM nginx:latest
RUN sed -i 's/nginx/saidane/g' /usr/share/nginx/html/index.html
EXPOSE 81

