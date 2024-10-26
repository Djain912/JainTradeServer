# Use the official Node.js image from Docker Hub
FROM node:21.5.0

# Set NODE_ENV to production for optimized dependency installation in production
# This assumes production dependencies are separated in package.json
ENV NODE_ENV=production

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies based on NODE_ENV
# Using the --only=production flag if this is a production build to skip dev dependencies
RUN npm install --only=production

# Copy the entire app directory to the container
COPY . .

# Expose the port your app runs on (e.g., 3000)
EXPOSE 9000

# Run the application using a non-root user for better security (optional)
# RUN useradd -m appuser && chown -R appuser /app
# USER appuser

# Command to run the app
CMD ["node", "index.js"]
