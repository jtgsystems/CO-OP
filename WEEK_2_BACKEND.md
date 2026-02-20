# Week 2: Backend Services
## Firebase, PostgreSQL, Security Automation

---

## Learning Objectives

By end of Week 2, students will:

1. Deploy Firebase Auth and Firestore for real-time applications
2. Configure PostgreSQL on Supabase free tier
3. Implement security automation with vulnerability scanning
4. Build RESTful APIs with modern frameworks
5. Configure environment-specific deployments
6. Set up automated backups and disaster recovery

---

## Day 1: Firebase Fundamentals

### Morning Session (09:00-12:00)

#### 1.1 Firebase Project Setup

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize project
mkdir firebase-app && cd firebase-app
firebase init

# Select features:
# - Firestore: Database
# - Authentication: Auth
# - Hosting: Web hosting
# - Functions: Serverless functions
```

#### 1.2 Firebase Configuration

Create `firebase/.runtimeconfig.json`:

```json
{
  "firebase": {
    "project": "your-project-id",
    "apiKey": "${FIREBASE_API_KEY}",
    "authDomain": "your-project.firebaseapp.com",
    "databaseURL": "https://your-project.firebaseio.com",
    "projectId": "your-project-id",
    "storageBucket": "your-project.appspot.com",
    "messagingSenderId": "123456789",
    "appId": "1:123456789:web:abcdef"
  }
}
```

#### 1.3 Firestore Security Rules

Create `firestore.rules`:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users collection
    match /users/{userId} {
      allow read: if request.auth != null;
      allow write: if request.auth.uid == userId
                  || request.auth.token.admin == true;
    }

    // Public data
    match /public/{document=**} {
      allow read: if true;
      allow write: if request.auth != null;
    }
  }
}
```

### Afternoon Lab (13:00-17:00)

#### Lab 1: Real-time Chat Application

**Objective:** Build a real-time chat with Firebase

```bash
# Create React app
npm create vite@latest chat-app -- --template react-ts
cd chat-app
npm install firebase

# Create src/lib/firebase.ts
```

```typescript
// src/lib/firebase.ts
import { initializeApp } from 'firebase/app';
import { getFirestore } from 'firebase/firestore';
import { getAuth } from 'firebase/auth';

const config = {
  apiKey: import.meta.env.VITE_FIREBASE_API_KEY,
  authDomain: import.meta.env.VITE_FIREBASE_AUTH_DOMAIN,
  projectId: import.meta.env.VITE_FIREBASE_PROJECT_ID,
  storageBucket: import.meta.env.VITE_FIREBASE_STORAGE_BUCKET,
};

export const app = initializeApp(config);
export const db = getFirestore(app);
export const auth = getAuth(app);
```

**Features:**
- [ ] User authentication (email/password, Google OAuth)
- [ ] Real-time message updates
- [ ] Message timestamps
- [ ] Online status indicators
- [ ] Typing indicators

**Deliverable:** Deployed chat app with working auth

---

## Day 2: PostgreSQL and Supabase

### Morning Session (09:00-12:00)

#### 2.1 Supabase Project Setup

```bash
# Install Supabase CLI
npm install -g supabase

# Login
supabase login

# Initialize project
supabase init

# Start local development
supabase start
```

#### 2.2 Database Schema Design

Create `supabase/migrations/001_initial_schema.sql`:

```sql
-- Users table (extends auth.users)
CREATE TABLE public.profiles (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  avatar_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Jobs table
CREATE TABLE public.jobs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) NOT NULL,
  title TEXT NOT NULL,
  company TEXT NOT NULL,
  status TEXT DEFAULT 'applied',
  applied_date DATE DEFAULT CURRENT_DATE,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Row Level Security
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.jobs ENABLE ROW LEVEL SECURITY;

-- Profiles policies
CREATE POLICY "Users can view own profile"
  ON public.profiles FOR SELECT
  USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"
  ON public.profiles FOR UPDATE
  USING (auth.uid() = id);

-- Jobs policies
CREATE POLICY "Users can manage own jobs"
  ON public.jobs FOR ALL
  USING (auth.uid() = user_id);
```

#### 2.3 Supabase Client Setup

```typescript
// src/lib/supabase.ts
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
```

### Afternoon Lab (13:00-17:00)

#### Lab 2: Job Tracker Application

**Objective:** Build a job application tracker

```bash
# Create project
npm create vite@latest job-tracker -- --template react-ts
cd job-tracker
npm install @supabase/supabase-js
```

**Features:**
- [ ] CRUD operations for jobs
- [ ] Status filtering (applied, interview, offer, rejected)
- [ ] Search and sort
- [ ] Export to CSV
- [ ] Statistics dashboard

**Deliverable:** Working job tracker with Supabase backend

---

## Day 3: REST API Development

### Morning Session (09:00-12:00)

#### 3.1 Express.js API

```bash
# Create Express API
mkdir express-api && cd express-api
npm init -y
npm install express dotenv cors helmet
npm install -D typescript @types/express @types/node tsx
```

Create `src/server.ts`:

```typescript
import express, { Request, Response } from 'express';
import cors from 'cors';
import helmet from 'helmet';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.get('/api/health', (req: Request, res: Response) => {
  res.json({ status: 'healthy', timestamp: new Date().toISOString() });
});

// Error handling
app.use((err: Error, req: Request, res: Response, next: Function) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Internal server error' });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

#### 3.2 API Best Practices

```typescript
// middleware/rateLimiter.ts
import rateLimit from 'express-rate-limit';

export const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per window
  message: 'Too many requests from this IP',
  standardHeaders: true,
  legacyHeaders: false,
});

// middleware/validate.ts
import { Schema, ValidationError } from 'joi';

export const validate = (schema: Schema) => {
  return (req: Request, res: Response, next: Function) => {
    const { error } = schema.validate(req.body);
    if (error) {
      return res.status(400).json({ error: error.details[0].message });
    }
    next();
  };
};
```

### Afternoon Lab (13:00-17:00)

#### Lab 3: Build Complete REST API

**Endpoints to implement:**
```
GET    /api/users       - List all users
GET    /api/users/:id   - Get user by ID
POST   /api/users       - Create user
PUT    /api/users/:id   - Update user
DELETE /api/users/:id   - Delete user
GET    /api/jobs        - List jobs
POST   /api/jobs        - Create job
```

**Deliverable:** Documented API with Swagger/OpenAPI

---

## Day 4: Security Automation

### Morning Session (09:00-12:00)

#### 4.1 Vulnerability Scanning Setup

```bash
# Install security tools
npm install -g npm-audit-resolver snyk trivy

# Configure npm audit
npm config set audit-level moderate
npm config set audit true

# Initialize Snyk
snyk auth
snyk wizard
```

#### 4.2 Automated Security Script

Create `scripts/security-scan.sh`:

```bash
#!/bin/bash
# Security Scanner for Node.js Projects

echo "=== Security Scan Started ==="
echo "Date: $(date)"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. npm audit
echo -e "${YELLOW}Running npm audit...${NC}"
npm audit --production
echo ""

# 2. Snyk test
echo -e "${YELLOW}Running Snyk test...${NC}"
snyk test --severity-threshold=high
echo ""

# 3. Dependency check
echo -e "${YELLOW}Checking outdated dependencies...${NC}"
npm outdated | head -n 20
echo ""

# 4. Secrets scan
echo -e "${YELLOW}Scanning for secrets...${NC}"
if command -v trufflehog &> /dev/null; then
  trufflehog filesystem --directory . --json
fi
echo ""

echo -e "${GREEN}=== Security Scan Complete ===${NC}"
```

#### 4.3 GitHub Actions Security Workflow

Create `.github/workflows/security.yml`:

```yaml
name: Security Scan

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]
  schedule:
    - cron: '0 6 * * 1' # Every Monday at 6 AM

jobs:
  security:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'npm'

      - name: Install dependencies
        run: npm ci

      - name: Run npm audit
        run: npm audit --production
        continue-on-error: true

      - name: Run Snyk
        uses: snyk/actions/node@master
        continue-on-error: true
        env:
          SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}

      - name: Run Trivy
        uses: aquasecurity/trivy-action@master
        with:
          scan-type: 'fs'
          scan-ref: '.'
          format: 'sarif'
          output: 'trivy-results.sarif'

      - name: Upload Trivy results
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: 'trivy-results.sarif'
```

### Afternoon Lab (13:00-17:00)

#### Lab 4: Security Hardening

**Tasks:**
1. Implement security middleware
2. Add input validation
3. Configure CORS properly
4. Set up helmet.js headers
5. Create security logging

**Deliverable:** Security audit report with remediation

---

## Day 5: Automated Backups and Monitoring

### Morning Session (09:00-12:00)

#### 5.1 Database Backup Script

Create `scripts/backup-db.sh`:

```bash
#!/bin/bash
# Automated Database Backup

BACKUP_DIR="/var/backups/supabase"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"

# Create backup directory
mkdir -p $BACKUP_DIR

# Get credentials from environment
DB_HOST=${SUPABASE_DB_HOST}
DB_NAME=${SUPABASE_DB_NAME}
DB_USER=${SUPABASE_DB_USER}
DB_PASS=${SUPABASE_DB_PASSWORD}

# Dump database
PGPASSWORD=$DB_PASS pg_dump -h $DB_HOST -U $DB_USER -d $DB_NAME > $BACKUP_FILE

# Compress
gzip $BACKUP_FILE

# Upload to cloud storage (optional)
# aws s3 cp $BACKUP_FILE.gz s3://backups/

# Delete old backups (keep last 30 days)
find $BACKUP_DIR -name "backup_*.sql.gz" -mtime +30 -delete

echo "Backup completed: $BACKUP_FILE.gz"
```

#### 5.2 Cron Job Configuration

```bash
# Edit crontab
crontab -e

# Add daily backup at 2 AM
0 2 * * * /path/to/scripts/backup-db.sh >> /var/log/db-backup.log 2>&1

# Add weekly security scan on Sunday at 3 AM
0 3 * * 0 /path/to/scripts/security-scan.sh >> /var/log/security-scan.log 2>&1

# Add dependency check daily at 4 AM
0 4 * * * cd /path/to/project && npm audit >> /var/log/npm-audit.log 2>&1
```

### Afternoon Lab (13:00-17:00)

#### Lab 5: Complete Monitoring Setup

**Tasks:**
1. Set up health check endpoint
2. Configure logging (Winston/Pino)
3. Set up error tracking (Sentry)
4. Create uptime monitoring
5. Configure alerting

**Deliverable:** Production-ready monitoring system

---

## Week 2 Checklist

### Firebase
- [ ] Project created and configured
- [ ] Firestore security rules written
- [ ] Authentication methods enabled
- [ ] Real-time listener implemented
- [ ] Deployment successful

### PostgreSQL/Supabase
- [ ] Database schema designed
- [ ] Migrations written
- [ ] RLS policies configured
- [ ] API routes connected
- [ ] Backup automated

### Security
- [ ] Vulnerability scanning automated
- [ ] Secrets properly managed
- [ ] CORS configured
- [ ] Rate limiting implemented
- [ ] Input validation added

### Monitoring
- [ ] Health checks implemented
- [ ] Logging configured
- [ ] Error tracking enabled
- [ ] Cron jobs scheduled
- [ ] Alert notifications configured

---

## Week 2 Assessment

**Quiz:** Database design and security principles
**Practical:** Build and deploy a secure API
**Code Review:** Peer review of security implementations

---

## Week 2 Project

**Deliverable:** Full-stack application with:
- Firebase Auth integration
- Supabase PostgreSQL backend
- RESTful API
- Automated security scanning
- Database backups
- Monitoring dashboard

---

**Standard ID:** GS-COOP-WEEK2-001
**Status:** ACTIVE
**Last Updated:** 2026-02-19
