# Use Nginx as the base image
FROM nginx:alpine

# Set the working directory
WORKDIR /weather

# Remove default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy project files to the Nginx web root
COPY . /usr/share/nginx/html/

# Set correct file permissions
RUN chmod -R 755 /usr/share/nginx/html && \
    chown -R nginx:nginx /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
