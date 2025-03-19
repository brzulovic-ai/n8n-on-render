# Use the official n8n image
FROM n8nio/n8n:latest

# Set the working directory
WORKDIR /usr/src/app

# Install dependencies
RUN /usr/bin/apt-get update && /usr/bin/apt-get install -y \
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
    fonts-liberation \
    gconf-service \
    lsb-release \
    wget \
    xdg-utils \
    curl && /usr/bin/rm -rf /var/lib/apt/lists/*

# Install Puppeteer properly
RUN npm install puppeteer

# Set environment variables
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV GENERIC_TIMEZONE=UTC

# Expose port 5678
EXPOSE 5678

# Start n8n
CMD ["n8n"]

