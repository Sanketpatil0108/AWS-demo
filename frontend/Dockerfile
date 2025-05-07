# Step 1: Build the React App
FROM public.ecr.aws/docker/library/node:16 AS build

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

# Step 2: Serve the React app using NGINX
FROM public.ecr.aws/docker/library/nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
