# Use Node.js base image
FROM node:18 as build

# Set the working directory
WORKDIR /app

# Copy the package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application
COPY . ./

# Build the React app
RUN npm run build

# Serve the app using a lightweight web server
FROM nginx:alpine

# Copy the build files to Nginx's default directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to access the app
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
