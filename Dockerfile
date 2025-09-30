# Stage 1: Build React app with Vite
FROM node:20-alpine AS build

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source code (including .env)
COPY . .

# Build the frontend (Vite reads .env automatically)
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy Vite build output to Nginx default directory
COPY --from=build /app/dist /usr/share/nginx/html

# Copy default nginx config (optional, for React Router support)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]