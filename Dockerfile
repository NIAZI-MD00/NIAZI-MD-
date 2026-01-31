FROM node:lts

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg imagemagick webp && apt-get clean

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install && npm cache clean --force

# Copy application code
COPY . .

# Set environment variables
ENV NODE_ENV production
ENV BOT_NAME="NIAZI-MD"
ENV BOT_AUTHOR="NIAZI-MD00"
ENV BOT_VERSION="1.0.0"

# Expose port
EXPOSE 3000

# Run command
CMD ["npm", "run", "start"]

# Label for metadata
LABEL maintainer="NIAZI-MD00"
LABEL description="NIAZI-MD WhatsApp Bot Docker Container"
