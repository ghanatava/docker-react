FROM node AS builder
COPY ./package.json .
RUN npm install 
COPY . .
RUN npm run build

#stage 2

FROM nginx:alpine
COPY --from=builder /dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]



