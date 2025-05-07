# Step 1: Build the React App
FROM public.ecr.aws/docker/library/node:16 AS build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Step 2: Serve with NGINX
FROM public.ecr.aws/docker/library/nginx:alpine

# Copy built files
COPY --from=build /app/build /usr/share/nginx/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
