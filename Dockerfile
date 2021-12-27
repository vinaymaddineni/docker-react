FROM node:16-alpine as builder 
# buildphase

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
#runphase
COPY --from=builder /app/build /usr/share/nginx/html