# Use Node.js LTS (Long Term Support) as base image
FROM node:20-slim

# Install git and cron
RUN apt-get update && apt-get install -y \
    git \
    cron

# Create app directory
WORKDIR /home/node/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --only=production --verbose

# Bundle app source
COPY . .

# Expose the port
EXPOSE 3000

# Configure the website
RUN ./configure.sh

# Set the entrypoint
CMD ["./entrypoint.sh"]