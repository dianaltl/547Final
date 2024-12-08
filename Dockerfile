FROM node:18

# Install Hugo specific version
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.119.0/hugo_extended_0.119.0_linux-amd64.deb
RUN dpkg -i hugo_extended_0.119.0_linux-amd64.deb

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose ports
EXPOSE 3000

# Start the Node.js server
CMD ["npm", "start"]