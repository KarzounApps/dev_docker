# Use the official Node.js 14 image.
FROM node:14.21.2-alpine

# Create and change to the app directory.
WORKDIR /usr/src/app

# Install Angular CLI globally.
RUN npm install -g @angular/cli@14

# Install app dependencies.
COPY package*.json ./
RUN npm install

# Copy app files.
COPY . .

# Expose the port the app runs on.
EXPOSE 1001

# Run the app.
CMD ["npm", "start"]
