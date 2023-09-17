# Use a secure base image
FROM cgr.dev/chainguard/node:latest as build

# Copy package.json and package-lock.json for efficient caching
COPY package*.json ./

# Install production-only dependencies
RUN npm ci --production

# Copy TypeScript source files
COPY src/ /app/src/
COPY tsconfig.json /app/

# Build TypeScript
RUN cd /app && npm run build

# Final Stage
FROM cgr.dev/chainguard/node:latest

# Copy only the built code and installed packages
COPY --from=build /app/dist /app/dist
COPY --from=build node_modules /app/node_modules

# Set non-root user and restrict permissions
RUN adduser -D myuser
USER myuser

# Start the application
CMD ["node", "/app/dist/index.js"]

