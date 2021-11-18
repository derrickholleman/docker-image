# use node version 12 base image as opposed to ubuntu
FROM node:12

# set default directory inside your container image (default is /)
WORKDIR /app

# copy package json to current working directory so that in the next step we can run npm install
COPY package*.json ./

RUN npm install

# copy over all source code files to working directory
COPY . .

# create .dockerignore file so that node_modules isn't copied

# port matches the port specified in app.js
ENV PORT=5000

EXPOSE 5000

# command that tells the container how to run the application
CMD ["npm", "start"]

# then run build command to create an image
# docker build -t dockerusername/appname:version# .

# to create a container from the image, get the image id and do docker run --rm -p 5000:5000 <id>

# -p flag implements port forwarding from the docker container to the local machine.  5000:5000 = local port you want to run the docker image on:docker port
# --rm automatically deletes container when it exits