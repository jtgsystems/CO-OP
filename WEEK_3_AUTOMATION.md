# Week 3: Automation and Deployment
## Server Management, CI/CD, Zero-Downtime Deployments

---

## Learning Objectives

By end of Week 3, students will:

1. Configure production servers with automated updates
2. Implement CI/CD pipelines with GitHub Actions
3. Deploy with zero downtime using blue-green strategy
4. Set up Docker containers for consistent deployments
5. Configure PM2 for process management
6. Implement automated SSL certificate renewal

---

## Day 1: Server Setup and Hardening

### Morning Session (09:00-12:00)

#### 1.1 Initial Server Configuration

```bash
# Connect to server
ssh root@your-server-ip

# Update system
apt update && apt upgrade -y

# Set timezone
timedatectl set-timezone America/Toronto

# Create non-root user
adduser deploy
usermod -aG sudo deploy

# Configure SSH key
mkdir -p /home/deploy/.ssh
cp ~/.ssh/authorized_keys /home/deploy/.ssh/
chown -R deploy:deploy /home/deploy/.ssh
chmod 700 /home/deploy/.ssh
chmod 600 /home/deploy/.ssh/authorized_keys
```

#### 1.2 SSH Hardening

```bash
# Edit SSH config
nano /etc/ssh/sshd_config

# Recommended settings:
Port 2222  # Change from default 22
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
MaxAuthTries 3
ClientAliveInterval 300
ClientAliveCountMax 2

# Restart SSH
systemctl restart sshd
```

#### 1.3 Firewall Configuration

```bash
# Install UFW
apt install ufw -y

# Default policies
ufw default deny incoming
ufw default allow outgoing

# Allow essential services
ufw allow 2222/tcp  # Custom SSH port
ufw allow 80/tcp    # HTTP
ufw allow 443/tcp   # HTTPS

# Enable firewall
ufw enable
ufw status verbose
```

### Afternoon Lab (13:00-17:00)

#### Lab 1: Server Bootstrap Script

Create `scripts/server-bootstrap.sh`:

```bash
#!/bin/bash
set -e

echo "=== Server Bootstrap ==="

# Variables
APP_NAME="${1:-myapp}"
DOMAIN="${2:-example.com}"
DEPLOY_USER="deploy"
APP_DIR="/var/www/$APP_NAME"

# Update system
apt update && apt upgrade -y

# Install essentials
apt install -y curl git nginx python3 python3-pip nodejs npm

# Install PM2 globally
npm install -g pm2

# Create deploy user
if ! id "$DEPLOY_USER" &>/dev/null; then
  adduser --disabled-password --gecos "" $DEPLOY_USER
  usermod -aG sudo $DEPLOY_USER
  mkdir -p /home/$DEPLOY_USER/.ssh
  # Add SSH key here
fi

# Create app directory
mkdir -p $APP_DIR
chown -R $DEPLOY_USER:$DEPLOY_USER $APP_DIR

# Configure nginx for domain
cat > /etc/nginx/sites-available/$APP_NAME << EOF
server {
    listen 80;
    server_name $DOMAIN www.$DOMAIN;
    root $APP_DIR/dist;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }

    location /api {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

ln -sf /etc/nginx/sites-available/$APP_NAME /etc/nginx/sites-enabled/
nginx -t && systemctl reload nginx

echo "=== Bootstrap Complete ==="
```

**Deliverable:** Fully hardened server with user permissions

---

## Day 2: CI/CD Pipeline Configuration

### Morning Session (09:00-12:00)

#### 2.1 GitHub Actions Workflow

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy

on:
  push:
    branches: [main]

env:
  NODE_VERSION: '22'
  DEPLOY_HOST: ${{ secrets.DEPLOY_HOST }}
  DEPLOY_USER: ${{ secrets.DEPLOY_USER }}
  DEPLOY_PATH: ${{ secrets.DEPLOY_PATH }}

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Run tests
        run: npm test

      - name: Run linter
        run: npm run lint

      - name: Build
        run: npm run build

  deploy:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: ${{ env.NODE_VERSION }}
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Build
        run: npm run build

      - name: Deploy to server
        uses: appleboy/ssh-action@master
        with:
          host: ${{ env.DEPLOY_HOST }}
          username: ${{ env.DEPLOY_USER }}
          key: ${{ secrets.SSH_PRIVATE_KEY }}
          port: 2222
          script: |
            cd ${{ env.DEPLOY_PATH }}
            git pull origin main
            npm ci --production
            npm run build
            pm2 restart ecosystem.config.js
```

#### 2.2 Environment Variables Management

```bash
# On server, create .env file
cat > /var/www/myapp/.env << EOF
NODE_ENV=production
DATABASE_URL=postgresql://...
API_KEY=...
JWT_SECRET=...
EOF

chmod 600 /var/www/myapp/.env
chown deploy:deploy /var/www/myapp/.env
```

### Afternoon Lab (13:00-17:00)

#### Lab 2: Complete CI/CD Pipeline

**Tasks:**
1. Create multi-stage workflow (test, build, deploy)
2. Add environment-specific deployments
3. Implement rollback mechanism
4. Add deployment notifications
5. Configure secrets in GitHub

**Deliverable:** Working CI/CD pipeline with staging and production

---

## Day 3: Zero-Downtime Deployments

### Morning Session (09:00-12:00)

#### 3.1 Blue-Green Deployment Strategy

Create `scripts/blue-green-deploy.sh`:

```bash
#!/bin/bash
set -e

APP_NAME="myapp"
BLUE_PORT=3000
GREEN_PORT=3001
NGINX_CONFIG="/etc/nginx/sites-available/$APP_NAME"

# Determine active and inactive ports
if grep -q "localhost:$BLUE_PORT" "$NGINX_CONFIG"; then
  ACTIVE_PORT=$BLUE_PORT
  INACTIVE_PORT=$GREEN_PORT
  NEW_COLOR="green"
else
  ACTIVE_PORT=$GREEN_PORT
  INACTIVE_PORT=$BLUE_PORT
  NEW_COLOR="blue"
fi

echo "Deploying to $NEW_COLOR (port $INACTIVE_PORT)..."

# Pull latest code
cd /var/www/$APP_NAME
git pull origin main

# Install dependencies
npm ci --production

# Build
npm run build

# Start new instance on inactive port
PORT=$INACTIVE_PORT pm2 start dist/server.js --name "$APP_NAME-$NEW_COLOR"

# Health check
sleep 5
if curl -f "http://localhost:$INACTIVE_PORT/health"; then
  echo "Health check passed!"
else
  echo "Health check failed! Rolling back..."
  pm2 stop "$APP_NAME-$NEW_COLOR"
  exit 1
fi

# Switch nginx to new port
sed -i "s/localhost:$ACTIVE_PORT/localhost:$INACTIVE_PORT/g" "$NGINX_CONFIG"
nginx -t && systemctl reload nginx

# Stop old instance
pm2 stop "$APP_NAME-$( [ "$NEW_COLOR" = "blue" ] && echo "green" || echo "blue" )"

echo "Deployment complete! Now running on $NEW_COLOR"
```

#### 3.2 PM2 Process Management

Create `ecosystem.config.js`:

```javascript
module.exports = {
  apps: [
    {
      name: 'api',
      script: './dist/server.js',
      instances: 'max',
      exec_mode: 'cluster',
      env: {
        NODE_ENV: 'development',
        PORT: 3000,
      },
      env_production: {
        NODE_ENV: 'production',
        PORT: 3000,
      },
      error_file: './logs/err.log',
      out_file: './logs/out.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss Z',
      merge_logs: true,
      autorestart: true,
      max_restarts: 10,
      min_uptime: '10s',
      max_memory_restart: '500M',
    },
  ],
};
```

### Afternoon Lab (13:00-17:00)

#### Lab 3: Zero-Downtime Deployment

**Tasks:**
1. Implement blue-green deployment
2. Create rollback script
3. Add health check endpoint
4. Configure PM2 monitoring
5. Test deployment under load

**Deliverable:** Zero-downtime deployment with verified rollback

---

## Day 4: Docker and Containerization

### Morning Session (09:00-12:00)

#### 4.1 Docker Configuration

Create `Dockerfile`:

```dockerfile
# Multi-stage build
FROM node:22-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY tsconfig.json ./

# Install dependencies
RUN npm ci

# Copy source
COPY . .

# Build
RUN npm run build

# Production image
FROM node:22-alpine AS production

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install production dependencies only
RUN npm ci --only=production

# Copy built files from builder
COPY --from=builder /app/dist ./dist

# Create non-root user
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Change ownership
RUN chown -R nodejs:nodejs /app

USER nodejs

EXPOSE 3000

CMD ["node", "dist/server.js"]
```

#### 4.2 Docker Compose

Create `docker-compose.yml`:

```yaml
version: '3.9'

services:
  api:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - DATABASE_URL=${DATABASE_URL}
    depends_on:
      - postgres
      - redis
    restart: unless-stopped

  postgres:
    image: postgres:16-alpine
    volumes:
      - postgres_data:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=${DB_NAME}
      - POSTGRES_USER=${DB_USER}
      - POSTGRES_PASSWORD=${DB_PASSWORD}
    restart: unless-stopped

  redis:
    image: redis:7-alpine
    volumes:
      - redis_data:/data
    restart: unless-stopped

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
      - ./ssl:/etc/nginx/ssl
    depends_on:
      - api
    restart: unless-stopped

volumes:
  postgres_data:
  redis_data:
```

### Afternoon Lab (13:00-17:00)

#### Lab 4: Container Deployment

**Tasks:**
1. Containerize existing application
2. Set up local development with Docker Compose
3. Configure production deployment
4. Implement container health checks
5. Set up container logging

**Deliverable:** Fully containerized application

---

## Day 5: Server Auto-Updates and SSL

### Morning Session (09:00-12:00)

#### 5.1 Automated Server Updates

Create `scripts/auto-update.sh`:

```bash
#!/bin/bash
# Automated server update script with safety checks

LOG_FILE="/var/log/auto-update.log"
LOCK_FILE="/tmp/auto-update.lock"
DISCORD_WEBHOOK="${DISCORD_UPDATE_WEBHOOK}"

# Prevent concurrent runs
if [ -f "$LOCK_FILE" ]; then
  echo "Update already in progress" | tee -a "$LOG_FILE"
  exit 1
fi

touch "$LOCK_FILE"
trap "rm -f $LOCK_FILE" EXIT

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

notify_discord() {
  if [ -n "$DISCORD_WEBHOOK" ]; then
    curl -X POST "$DISCORD_WEBHOOK" \
      -H "Content-Type: application/json" \
      -d "{\"content\": \"**Server Update**: $1\"}"
  fi
}

log "Starting auto-update..."

# Check if reboot is needed
if [ -f /var/run/reboot-required ]; then
  log "Reboot required - scheduling for maintenance window"
  notify_discord "Reboot required - will update during maintenance window (3 AM)"
  echo "0 3 * * * /usr/bin/systemctl reboot" | crontab -
  exit 0
fi

# Update package lists
log "Updating package lists..."
apt-get update -y >> "$LOG_FILE" 2>&1

# Security updates only (safe)
log "Installing security updates..."
apt-get upgrade -y -o Dir::Etc::SourceList=/etc/apt/sources.list \
  -o Dir::Etc::SourceParts=/etc/apt/sources.list.d \
  -o APT::Get::Show-Upgraded=true >> "$LOG_FILE" 2>&1

# Check if services need restart
if command -v needs-restarting &> /dev/null; then
  SERVICES=$(needs-restarting -s | grep -v "^\s*$")
  if [ -n "$SERVICES" ]; then
    log "Restarting services: $SERVICES"
    for service in $SERVICES; do
      systemctl restart "$service" >> "$LOG_FILE" 2>&1
    done
  fi
fi

# Update Node.js dependencies if in app directory
if [ -d "/var/www/myapp" ]; then
  log "Updating Node.js dependencies..."
  cd /var/www/myapp
  npm audit fix >> "$LOG_FILE" 2>&1 || true
fi

log "Auto-update completed successfully"
notify_discord "Auto-update completed successfully"

# Cleanup old logs
find /var/log -name "*.log" -mtime +30 -delete
```

#### 5.2 Automated SSL Renewal

```bash
# Install Certbot
apt install certbot python3-certbot-nginx -y

# Get initial certificate
certbot --nginx -d yourdomain.com -d www.yourdomain.com

# Test renewal
certbot renew --dry-run

# Certbot automatically creates cron job
# Verify: cat /etc/cron.d/certbot
```

Create `scripts/ssl-monitor.sh`:

```bash
#!/bin/bash
# Monitor SSL certificates and alert before expiry

ALERT_DAYS=30
DISCORD_WEBHOOK="${DISCORD_SSL_WEBHOOK}"

for cert in /etc/letsencrypt/live/*/cert.pem; do
  domain=$(basename $(dirname $cert))
  expiry=$(openssl x509 -enddate -noout -in "$cert" | cut -d= -f2)
  expiry_date=$(date -d "$expiry" +%s)
  current_date=$(date +%s)
  days_left=$(( ($expiry_date - $current_date) / 86400 ))

  if [ $days_left -lt $ALERT_DAYS ]; then
    message="⚠️ SSL certificate for **$domain** expires in $days_left days!"
    curl -X POST "$DISCORD_WEBHOOK" \
      -H "Content-Type: application/json" \
      -d "{\"content\": \"$message\"}"
  fi
done
```

### Afternoon Lab (13:00-17:00)

#### Lab 5: Complete Automation Setup

**Tasks:**
1. Configure auto-update script with cron
2. Set up SSL monitoring
3. Create update notification system
4. Test rollback procedures
5. Document maintenance procedures

**Deliverable:** Fully automated server with monitoring

---

## Week 3 Checklist

### Server Configuration
- [ ] SSH hardening complete
- [ ] Firewall configured
- [ ] Non-root user created
- [ ] Automatic updates enabled
- [ ] SSL certificates installed

### CI/CD Pipeline
- [ ] GitHub Actions workflow created
- [ ] Tests run on every commit
- [ ] Deployment automated
- [ ] Rollback mechanism in place
- [ ] Deployment notifications configured

### Zero-Downtime Deployment
- [ ] Blue-green deployment implemented
- [ ] Health checks configured
- [ ] PM2 process management
- [ ] Load testing performed
- [ ] Rollback tested

### Docker
- [ ] Dockerfile optimized
- [ ] Docker Compose configured
- [ ] Multi-stage builds implemented
- [ ] Container security hardened
- [ ] Logging configured

### Monitoring
- [ ] Server metrics collected
- [ ] Application logs centralized
- [ ] Error tracking enabled
- [ ] Uptime monitoring active
- [ ] Alert notifications working

---

## Week 3 Assessment

**Quiz:** CI/CD concepts and deployment strategies
**Practical:** Deploy application with zero downtime
**Code Review:** Review deployment scripts for security issues

---

## Week 3 Project

**Deliverable:** Production deployment with:
- Automated CI/CD pipeline
- Zero-downtime deployments
- Docker containers
- SSL automation
- Auto-update configuration
- Monitoring and alerts

---

**Standard ID:** GS-COOP-WEEK3-001
**Status:** ACTIVE
**Last Updated:** 2026-02-19
