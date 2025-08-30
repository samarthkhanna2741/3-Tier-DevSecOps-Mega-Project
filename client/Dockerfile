# Stage-1: Build React App
FROM node:22-alpine AS builder

WORKDIR /app

# Only copy dependency descriptor to leverage Docker cache
COPY package.json package-lock.json ./

# Clean and fast install using lock file (CI-style)
RUN npm ci

# Now copy rest of the source code
COPY . .

# Build the React App (generates static files in /build)
RUN npm run build

# Stage-2: Serve with Nginx
FROM nginx:alpine

# Copy built static files from builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Add custom Nginx config (optional but usually required for SPA)
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for HTTP
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
