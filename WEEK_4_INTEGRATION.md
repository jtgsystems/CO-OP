# Week 4: Integration and Automation
## Discord Bots, Twilio Alerts, OpenClaw Help Desk, Job Automation

---

## Learning Objectives

By end of Week 4, students will:

1. Build Discord bots with monitoring and moderation features
2. Integrate Twilio for SMS alerts and notifications
3. Configure OpenClaw for help desk automation
4. Create job application automation workflows
5. Implement research assistant capabilities
6. Build comprehensive capstone project

---

## Day 1: Discord Bot Development

### Morning Session (09:00-12:00)

#### 1.1 Discord Bot Setup

```bash
# Create Discord application
# 1. Go to https://discord.com/developers/applications
# 2. Create New Application
# 3. Go to Bot section and create bot
# 4. Copy bot token

# Create project
mkdir discord-bot && cd discord-bot
npm init -y
npm install discord.js dotenv

# Create .env
cat > .env << EOF
DISCORD_BOT_TOKEN=your_bot_token_here
DISCORD_CLIENT_ID=your_client_id_here
DISCORD_GUILD_ID=your_guild_id_here
EOF
```

#### 1.2 Bot Implementation

Create `src/index.js`:

```javascript
require('dotenv').config();
const { Client, GatewayIntentBits, REST, Routes } = require('discord.js');

const client = new Client({
  intents: [
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.MessageContent,
    GatewayIntentBits.GuildMembers,
  ],
});

// Commands
const commands = [
  {
    name: 'ping',
    description: 'Check bot latency',
  },
  {
    name: 'status',
    description: 'Check server status',
  },
  {
    name: 'help',
    description: 'Show available commands',
  },
];

// Register slash commands
const rest = new REST({ version: '10' }).setToken(process.env.DISCORD_BOT_TOKEN);

(async () => {
  try {
    await rest.put(
      Routes.applicationGuildCommands(process.env.DISCORD_CLIENT_ID, process.env.DISCORD_GUILD_ID),
      { body: commands }
    );
    console.log('Slash commands registered!');
  } catch (error) {
    console.error(error);
  }
})();

// Event: Bot ready
client.once('ready', () => {
  console.log(`Bot logged in as ${client.user.tag}`);
  client.user.setActivity('for /help', { type: 3 });
});

// Event: Interaction (slash commands)
client.on('interactionCreate', async (interaction) => {
  if (!interaction.isChatInputCommand()) return;

  const { commandName } = interaction;

  if (commandName === 'ping') {
    const latency = Date.now() - interaction.createdTimestamp;
    await interaction.reply(`Pong! Latency: ${latency}ms`);
  } else if (commandName === 'status') {
    await interaction.reply('✅ All systems operational!');
  } else if (commandName === 'help') {
    const helpMessage = `
**Available Commands:**
/ping - Check bot latency
/status - Check server status
/help - Show this help message

**Features:**
- Real-time monitoring
- Automated moderation
- Custom alerts
    `;
    await interaction.reply(helpMessage);
  }
});

// Event: Message handling
client.on('messageCreate', async (message) => {
  if (message.author.bot) return;

  // Auto-response for specific keywords
  const keywords = {
    'help': 'Need help? Use /help or DM a moderator.',
    'bug': 'Found a bug? Report it in #bugs channel.',
    'feature': 'Have a feature request? Post it in #features!',
  };

  for (const [keyword, response] of Object.entries(keywords)) {
    if (message.content.toLowerCase().includes(keyword)) {
      await message.channel.send(response);
      break;
    }
  }
});

client.login(process.env.DISCORD_BOT_TOKEN);
```

### Afternoon Lab (13:00-17:00)

#### Lab 1: Monitoring Bot

**Features to implement:**
- [ ] Server health monitoring
- [ ] Website uptime checks
- [ ] Error notification system
- [ ] Custom alerts
- [ ] Logging to channel

Create `src/monitoring.js`:

```javascript
const axios = require('axios');

const MONITORED_URLS = [
  'https://yourdomain.com',
  'https://api.yourdomain.com/health',
];

const CHECK_INTERVAL = 60000; // 1 minute

async function checkUrl(url) {
  try {
    const start = Date.now();
    const response = await axios.get(url, { timeout: 10000 });
    const latency = Date.now() - start;

    return {
      url,
      status: 'up',
      statusCode: response.status,
      latency,
      timestamp: new Date().toISOString(),
    };
  } catch (error) {
    return {
      url,
      status: 'down',
      error: error.message,
      timestamp: new Date().toISOString(),
    };
  }
}

async function runMonitoring(client) {
  const channel = await client.channels.fetch(process.env.MONITORING_CHANNEL_ID);

  for (const url of MONITORED_URLS) {
    const result = await checkUrl(url);

    if (result.status === 'down') {
      await channel.send(`🚨 **ALERT**: ${url} is DOWN!\n\`\`\`${result.error}\`\`\``);
    } else if (result.latency > 5000) {
      await channel.send(`⚠️ **WARNING**: ${url} is slow (${result.latency}ms)`);
    }
  }
}

module.exports = { runMonitoring };
```

**Deliverable:** Fully functional Discord monitoring bot

---

## Day 2: Twilio Integration

### Morning Session (09:00-12:00)

#### 2.1 Twilio Setup

```bash
# Sign up at twilio.com/try-twilio
# Get Account SID and Auth Token from console

npm install twilio

# Add to .env
TWILIO_ACCOUNT_SID=your_account_sid
TWILIO_AUTH_TOKEN=your_auth_token
TWILIO_PHONE_NUMBER=+1234567890
ADMIN_PHONE_NUMBER=+0987654321
```

#### 2.2 Alert System Implementation

Create `src/twilio.js`:

```javascript
require('dotenv').config();
const twilio = require('twilio');

const client = new twilio(
  process.env.TWILIO_ACCOUNT_SID,
  process.env.TWILIO_AUTH_TOKEN
);

class AlertSystem {
  async sendAlert(message, recipients = null) {
    const phoneNumbers = recipients || [process.env.ADMIN_PHONE_NUMBER];
    const results = [];

    for (const number of phoneNumbers) {
      try {
        const result = await client.messages.create({
          body: `🚨 ALERT: ${message}`,
          from: process.env.TWILIO_PHONE_NUMBER,
          to: number,
        });
        results.push({ success: true, sid: result.sid, number });
      } catch (error) {
        results.push({ success: false, error: error.message, number });
      }
    }

    return results;
  }

  async sendServerDownAlert(serverName, error) {
    const message = `Server "${serverName}" is DOWN!\nError: ${error}\nTime: ${new Date().toISOString()}`;
    return await this.sendAlert(message);
  }

  async sendDeploymentNotification(appName, version) {
    const message = `✅ ${appName} v${version} deployed successfully at ${new Date().toISOString()}`;
    return await this.sendAlert(message);
  }

  async sendSecurityAlert(vulnerability, severity) {
    const message = `🔒 SECURITY ALERT: ${severity} severity\n${vulnerability}`;
    return await this.sendAlert(message);
  }

  async makeCall(message, recipients = null) {
    const phoneNumbers = recipients || [process.env.ADMIN_PHONE_NUMBER];
    const results = [];

    for (const number of phoneNumbers) {
      try {
        // TwiML for text-to-speech
        const twiml = `
          <Response>
            <Say voice="alice">${message}</Say>
          </Response>
        `;

        const result = await client.calls.create({
          twiml: twiml,
          from: process.env.TWILIO_PHONE_NUMBER,
          to: number,
        });
        results.push({ success: true, sid: result.sid, number });
      } catch (error) {
        results.push({ success: false, error: error.message, number });
      }
    }

    return results;
  }
}

module.exports = new AlertSystem();
```

### Afternoon Lab (13:00-17:00)

#### Lab 2: Integrated Alert System

**Features:**
- [ ] Server down alerts (SMS)
- [ ] Deployment notifications
- [ ] Security alerts
- [ ] Escalation system (SMS -> Call)
- [ ] Alert throttling (prevent spam)

Create `src/alert-manager.js`:

```javascript
const alertSystem = require('./twilio');
const { client } = require('./index');

const ALERT_COOLDOWN = 300000; // 5 minutes
const alertHistory = new Map();

async function sendSmartAlert(type, message, severity = 'medium') {
  const key = `${type}:${message}`;
  const now = Date.now();
  const lastAlert = alertHistory.get(key);

  // Check cooldown
  if (lastAlert && (now - lastAlert) < ALERT_COOLDOWN) {
    console.log(`Alert throttled: ${key}`);
    return;
  }

  alertHistory.set(key, now);

  // Send to Discord
  const channel = await client.channels.fetch(process.env.ALERTS_CHANNEL_ID);
  await channel.send(`**${severity.toUpperCase()}**: ${message}`);

  // Send SMS for high severity
  if (severity === 'high' || severity === 'critical') {
    await alertSystem.sendAlert(message);

    // Make call for critical
    if (severity === 'critical') {
      await alertSystem.makeCall(message);
    }
  }
}

module.exports = { sendSmartAlert };
```

**Deliverable:** Integrated multi-channel alert system

---

## Day 3: OpenClaw Help Desk Setup

### Morning Session (09:00-12:00)

#### 3.1 OpenClaw Installation

```bash
# Clone OpenClaw
git clone https://github.com/openclaw/openclaw.git ~/.openclaw
cd ~/.openclaw

# Install dependencies
npm install

# Run setup wizard
npm run wizard

# Configuration
cp config.example.json openclaw.json
nano openclaw.json
```

#### 3.2 OpenClaw Configuration

Create `~/.openclaw/openclaw.json`:

```json
{
  "meta": {
    "lastTouchedVersion": "2026.2.9",
    "lastTouchedAt": "2026-02-19T00:00:00.000Z"
  },
  "agents": {
    "defaults": {
      "workspace": "/home/ultron/.openclaw/workspace",
      "model": {
        "primary": "google-gemini-cli/gemini-3-pro-preview"
      }
    },
    "list": [
      {
        "id": "help-desk",
        "identity": {
          "name": "Help Desk Assistant",
          "theme": "Technical support specialist",
          "emoji": "🛟"
        },
        "tools": {
          "allow": [
            "web_search",
            "web_fetch",
            "read",
            "session"
          ],
          "deny": [
            "exec",
            "write",
            "cron"
          ]
        }
      }
    ]
  },
  "channels": {
    "discord": {
      "enabled": true,
      "token": "${DISCORD_BOT_TOKEN}",
      "groupPolicy": "open",
      "actions": {
        "reactions": true,
        "messages": true,
        "threads": true,
        "search": true
      },
      "guilds": {
        "*": {
          "requireMention": true,
          "channels": {
            "help-desk": {
              "requireMention": false,
              "systemPrompt": "You are a technical support specialist for our development bootcamp. Help students with: environment setup, debugging, Git issues, deployment problems, and general programming questions. Be patient and thorough. Provide code examples when helpful. English only."
            }
          }
        }
      }
    }
  }
}
```

#### 3.3 Help Desk Knowledge Base

Create `~/.openclaw/workspace/knowledge/base.md`:

```markdown
# Help Desk Knowledge Base

## Common Issues

### Environment Setup
**Problem:** Node.js not found after installation
**Solution:**
```bash
# Check if nvm is installed
command -v nvm

# If not, install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.bashrc
nvm install --lts
```

### Git Issues
**Problem:** Permission denied (publickey)
**Solution:**
```bash
# Check SSH keys
ls -la ~/.ssh

# Generate new key if needed
ssh-keygen -t ed25519 -C "your-email@example.com"
cat ~/.ssh/id_ed25519.pub  # Add to GitHub
```

### Deployment Failures
**Problem:** Build fails on CI/CD
**Solution:**
1. Check if node_modules is cached correctly
2. Verify environment variables are set
3. Run `npm ci` instead of `npm install`
4. Check Node.js version matches package.json engines

### Database Connection
**Problem:** ECONNREFUSED when connecting to database
**Solution:**
1. Check if database server is running
2. Verify connection string in .env
3. Check firewall rules
4. Ensure database user has correct permissions
```

### Afternoon Lab (13:00-17:00)

#### Lab 3: Help Desk Integration

**Features:**
- [ ] Auto-response to common questions
- [ ] Ticket generation for complex issues
- [ ] Agent escalation system
- [ ] Knowledge base search
- [ ] Resolution tracking

**Deliverable:** Working help desk with OpenClaw

---

## Day 4: Job Automation Workflows

### Morning Session (09:00-12:00)

#### 4.1 Job Search Automation

Create `src/job-automation/searcher.js`:

```javascript
const axios = require('axios');
const fs = require('fs').promises;
const path = require('path');

class JobSearcher {
  constructor() {
    this.dataDir = path.join(__dirname, '../data');
    this.keywords = [
      'full stack developer',
      'frontend developer',
      'backend developer',
      'devops engineer',
    ];
    this.locations = ['remote', 'toronto', 'new york', 'san francisco'];
  }

  async searchJobs() {
    const results = [];

    for (const keyword of this.keywords) {
      for (const location of this.locations) {
        // Example: Using a job board API
        const jobs = await this.fetchFromAPI(keyword, location);
        results.push(...jobs);
      }
    }

    return results;
  }

  async fetchFromAPI(keyword, location) {
    // Implement actual API calls
    // Examples: LinkedIn API, Indeed API, Greenhouse API
    return [
      {
        title: 'Full Stack Developer',
        company: 'Tech Company',
        location: 'Remote',
        url: 'https://example.com/job/123',
        posted: new Date().toISOString(),
      },
    ];
  }

  async saveResults(jobs) {
    await fs.mkdir(this.dataDir, { recursive: true });

    const filename = path.join(
      this.dataDir,
      `jobs-${new Date().toISOString().split('T')[0]}.json`
    );

    await fs.writeFile(filename, JSON.stringify(jobs, null, 2));
    return filename;
  }

  async filterJobs(jobs) {
    // Remove already applied jobs
    const applied = await this.getAppliedJobs();
    return jobs.filter(job => !applied.has(job.url));
  }

  async getAppliedJobs() {
    const filename = path.join(this.dataDir, 'applied.json');

    try {
      const data = await fs.readFile(filename, 'utf8');
      return new Set(JSON.parse(data));
    } catch {
      return new Set();
    }
  }
}

module.exports = JobSearcher;
```

#### 4.2 Cover Letter Generator

Create `src/job-automation/cover-letter.js`:

```javascript
const fs = require('fs').promises;

class CoverLetterGenerator {
  constructor() {
    this.templatePath = path.join(__dirname, '../templates/cover-letter.md');
  }

  async generate(jobDetails, userProfile) {
    const template = await this.loadTemplate();

    const letter = template
      .replace('{{company}}', jobDetails.company)
      .replace('{{position}}', jobDetails.title)
      .replace('{{skills}}', this.formatSkills(userProfile.skills))
      .replace('{{experience}}', this.formatExperience(userProfile.experience))
      .replace('{{companyValues}}', this.researchCompany(jobDetails.company));

    return letter;
  }

  async loadTemplate() {
    try {
      return await fs.readFile(this.templatePath, 'utf8');
    } catch {
      return this.getDefaultTemplate();
    }
  }

  getDefaultTemplate() {
    return `
Dear Hiring Manager at {{company}},

I am writing to express my interest in the {{position}} role. With my background in full-stack development and recent training in modern technologies, I am excited about the opportunity to contribute to your team.

My technical skills include: {{skills}}

Relevant experience: {{experience}}

I am particularly drawn to {{company}} because {{companyValues}}.

I would welcome the opportunity to discuss how my background aligns with your needs.

Best regards,
[Your Name]
    `.trim();
  }

  formatSkills(skills) {
    return skills.join(', ');
  }

  formatExperience(experience) {
    return experience.map(exp => `- ${exp.title} at ${exp.company}`).join('\n');
  }

  async researchCompany(company) {
    // Use AI to research company values and culture
    // This could use Gemini CLI, OpenClaw, or web search
    return 'of your commitment to innovation and excellence';
  }
}

module.exports = new CoverLetterGenerator();
```

### Afternoon Lab (13:00-17:00)

#### Lab 4: Complete Job Automation

**Features:**
- [ ] Daily job searching
- [ ] AI-powered cover letter generation
- [ ] Application tracking
- [ ] Interview scheduling
- [ ] Follow-up reminders

Create `src/job-automation/automation.js`:

```javascript
const JobSearcher = require('./searcher');
const CoverLetterGenerator = require('./cover-letter');

class JobAutomation {
  async runDailyWorkflow() {
    console.log('Starting daily job search workflow...');

    const searcher = new JobSearcher();
    const jobs = await searcher.searchJobs();
    const newJobs = await searcher.filterJobs(jobs);

    console.log(`Found ${newJobs.length} new jobs`);

    for (const job of newJobs) {
      // Generate cover letter
      const letter = await CoverLetterGenerator.generate(job, {
        skills: ['React', 'Node.js', 'PostgreSQL', 'Docker'],
        experience: [
          { title: 'Developer', company: 'Previous Company' },
        ],
      });

      // Save for review
      await this.saveApplication(job, letter);
    }

    return newJobs.length;
  }

  async saveApplication(job, letter) {
    // Save application data
    // Send notification about new opportunities
  }
}

// Run workflow
const automation = new JobAutomation();
automation.runDailyWorkflow().then(count => {
  console.log(`Workflow complete. ${count} new opportunities found.`);
});
```

**Deliverable:** Working job automation system

---

## Day 5: Capstone Project Integration

### Morning Session (09:00-12:00)

#### 5.1 Capstone Requirements

**Complete full-stack application featuring:**

1. **Authentication**
   - Firebase Auth (email/password, OAuth)
   - Protected routes
   - Session management

2. **Database**
   - PostgreSQL (Supabase)
   - Proper schema design
   - Row Level Security

3. **Real-time Features**
   - Firestore for live updates
   - WebSocket connections
   - Instant notifications

4. **Monitoring**
   - Discord bot alerts
   - Twilio SMS for critical issues
   - Health check dashboard

5. **Automation**
   - CI/CD pipeline
   - Zero-downtime deployment
   - Automated backups

6. **Documentation**
   - API documentation
   - Deployment guide
   - Architecture diagram

#### 5.2 Capstone Template

```bash
# Create capstone project
mkdir capstone && cd capstone

# Initialize
npm init -y
npm install express react firebase @supabase/supabase-js

# Structure
mkdir -p {client,server,docs,scripts}
```

### Afternoon Lab (13:00-17:00)

#### Lab 5: Capstone Development

**Working on final projects with instructor guidance**

**Deliverable:** Production-ready application deployed to server

---

## Week 4 Checklist

### Discord Bot
- [ ] Bot created and configured
- [ ] Slash commands registered
- [ ] Monitoring implemented
- [ ] Error handling added
- [ ] Channel notifications working

### Twilio Integration
- [ ] Account configured
- [ ] SMS alerts working
- [ ] Voice calls tested
- [ ] Throttling implemented
- [ ] Delivery tracking

### OpenClaw Help Desk
- [ ] OpenClaw installed
- [ ] Discord integration working
- [ ] Knowledge base created
- [ ] Auto-responses configured
- [ ] Ticket system working

### Job Automation
- [ ] Job search implemented
- [ ] Cover letter generation
- [ ] Application tracking
- [ ] Daily automation scheduled
- [ ] Notifications configured

### Capstone Project
- [ ] All features implemented
- [ ] Deployed to production
- [ ] Documentation complete
- [ ] Demo prepared
- [ ] Code reviewed

---

## Week 4 Assessment

**Final Project Presentation:** 15-minute demo of capstone
**Peer Review:** Review classmates' projects
**Exit Interview:** Discuss learning outcomes and next steps

---

## Graduation Requirements

To successfully complete the CO-OP program:

1. **Technical Requirements**
   - All weekly projects completed
   - Capstone deployed and functional
   - Pass SOTA tools proficiency test (90%+)

2. **Documentation**
   - Complete README for capstone
   - API documentation
   - Deployment guide

3. **Soft Skills**
   - Active participation in code reviews
   - Help provided to classmates
   - Professional communication

4. **Portfolio**
   - GitHub portfolio updated
   - LinkedIn profile complete
   - Demo video of capstone

---

## Career Support

### Job Application Package
- Resume template
- Cover letter examples
- Portfolio website
- GitHub showcase

### Interview Preparation
- Technical questions bank
- Mock interviews
- Whiteboarding practice
- System design exercises

### Ongoing Support
- Alumni Discord channel
- Weekly office hours (30 days post-graduation)
- Resume review service
- Job lead sharing

---

**Standard ID:** GS-COOP-WEEK4-001
**Status:** ACTIVE
**Last Updated:** 2026-02-19
