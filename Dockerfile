# Use Node.js as the base image (includes npm)
FROM node:18-bullseye

# Set working directory
WORKDIR /usr/src/app

# Install dependencies required for Puppeteer
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    chromium \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    wget \
    curl \
    xdg-utils && \
    rm -rf /var/lib/apt/lists/*

# Install Puppeteer globally
RUN npm install -g puppeteer

# Set environment variables
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Expose port for n8n
EXPOSE 5678

# Start n8n
CMD ["n8n"]

