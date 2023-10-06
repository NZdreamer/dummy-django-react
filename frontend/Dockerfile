FROM node:14 as build

WORKDIR /frontend

COPY package.json /frontend/
COPY package-lock.json /frontend/




# RUN apt-get update && apt-get install -y nodejs npm

COPY . /frontend

RUN npm install

# # Use a build argument to determine the build command
ARG BUILD_COMMAND=build
# RUN if [ "$BUILD_COMMAND" = "build" ] ; then npm run build ; fi

# # If it's a development build, start the development server
# RUN if [ "$BUILD_COMMAND" = "start" ] ; then npm start ; fi


RUN npm run build
# RUN npm start

# CMD ["npm", "run", "build"]
# CMD ["npm", "start"]


# Stage 2 - the production environment
# FROM nginx
# COPY --from=build /frontend/build /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
