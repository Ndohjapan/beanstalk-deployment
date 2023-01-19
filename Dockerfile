FROM node:alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . . 
RUN npm run build

FROM nginx

# Get the compiled app from the first step which is at index 0 and copy it from the build folder into the nginx folder
COPY --from=0 /app/build /usr/share/nginx/html