# Use official Node.js image to build the frontend
FROM node:18 AS build

# Set the working directory for the app
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json /app/
RUN npm install

# Copy the source code and build the frontend app
COPY . /app/
RUN npm run build

# Use Nginx to serve the build files
FROM nginx:alpine

# Copy the built app to the Nginx container
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to serve the app
EXPOSE 80

# Run Nginx
CMD ["nginx", "-g", "daemon off;"]
