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

# Create a shell script for git pull
RUN echo '#!/bin/bash\n\
cd /home/node/app\n\
git pull\n\
' > /git-pull.sh && chmod +x /git-pull.sh

# Create a crontab file to run git pull every 2 minutes
RUN echo '*/2 * * * * /git-pull.sh >> /var/log/cron.log 2>&1\n' | crontab -

# Expose the port
EXPOSE 3000

# Create an entrypoint script to start cron and the node app
RUN echo '#!/bin/bash\n\
service cron start\n\
node server.js\n\
' > /entrypoint.sh && chmod +x /entrypoint.sh

# Set the entrypoint
CMD ["/entrypoint.sh"]