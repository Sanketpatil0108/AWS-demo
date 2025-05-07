FROM public.ecr.aws/docker/library/node:16 AS build

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM public.ecr.aws/docker/library/nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
