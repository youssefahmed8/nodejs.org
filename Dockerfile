# Base stage for building
FROM node:18-bullseye-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire React app source code to the container
COPY . .

# Build the React app
RUN npm run build

# Expose port 3000 (the port your Node.js app runs on)
EXPOSE 3000

# Start the Node.js app
CMD ["npm", "start"]
