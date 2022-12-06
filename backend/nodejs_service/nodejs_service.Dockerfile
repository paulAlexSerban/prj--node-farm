FROM node:14.20.1

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json /usr/src/app/

# RUN npm install && npm cache clean
# if you build you code for production
# RUN npm ci --ony=production

# Bundle app source
COPY . /usr/src/app/

EXPOSE 3000

# Command to run when the container is ready
# Separate arguments as separate values in the array
CMD [ "npm", "run", "start"]