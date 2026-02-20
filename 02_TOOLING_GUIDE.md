# 🛠️ The Vibe Coder's Toolkit

To be a "Vibe Coder" means mastering your tools so they become extensions of your thought process.

## 0. System Health Check (The Full Stack)

Before you write a single line of code, you must ensure your machine speaks the language of the web. Open your terminal and run these checks.

### 🟢 Node.js & npm (The Web Engine)

Required for running React, Firebase tools, and almost all modern web infrastructure.

- **Check:** `node -v`
- **Target:** Version 20.0.0 or higher.
- **Download:** [nodejs.org](https://nodejs.org/) (Choose "LTS").

### 🐍 Python (The Scripting Powerhouse)

Required for backend utilities, AI tools, and local automation.

- **Check:** `python3 --version`
- **Target:** Version 3.10 or higher.
- **Download:** [python.org](https://www.python.org/downloads/)

### 🐙 Git (The Time Machine)

Required for saving your work and collaborating.

- **Check:** `git --version`
- **Target:** Version 2.40 or higher.
- **Download:** [git-scm.com](https://git-scm.com/downloads)

## 1. The Pro Stack (Our Secret Weapons)

We don't just use standard tools; we use the _fast_ ones. Match this setup to code at our speed.

### 🚀 Bun (The Hyper-Fast Runtime)

- **What it is:** A replacement for Node.js that is 10x faster. It runs your scripts and installs packages instantly.
- **Why we use it:** Waiting for `npm install` kills the vibe. Bun is instant.
- **Check:** `bun -v` (Target: v1.3+)
- **Install:** `curl -fsSL https://bun.sh/install | bash`

### 📦 PNPM (The Disk Saver)

- **What it is:** A package manager (like npm) that doesn't duplicate files.
- **Why we use it:** It saves gigabytes of space on your laptop and installs dependencies super fast.
- **Check:** `pnpm -v` (Target: v10.21+)
- **Install:** `npm install -g pnpm`

### 💻 GitHub CLI (`gh`)

- **What it is:** GitHub in your terminal.
- **Why we use it:** You can create repos, check PRs, and merge code without ever leaving your keyboard. Flow state maintained.
- **Check:** `gh --version` (Target: v2.45+)
- **Install:** [cli.github.com](https://cli.github.com/)

### 🔥 Firebase CLI

- **What it is:** The control center for our backend.
- **Why we use it:** Deploying your app to the live web takes one command: `firebase deploy`.
- **Check:** `firebase --version` (Target: v14.24+)
- **Install:** `npm install -g firebase-tools`

---

## 2. Antigravity IDE

_Your Cockpit._

**Download:** This is our customized development environment provided by your instructor.
_(Note: It is built on top of [VS Code](https://code.visualstudio.com/), so standard VS Code plugins work here!)_

- **Terminal:** Open with `` Ctrl+` ``. This is where you run commands.
- **Keybindings:** Learn the basics (`Ctrl+P` to find files, `Ctrl+Shift+F` to search everywhere).

### 🧩 Recommended Extensions

Since we are **100% Vibe Coding**, your extensions should focus on quality, formatting, and visualization. You don't need "IntelliSense" (autocomplete) for CSS or HTML because you won't be typing much of it—Roo Code handles the implementation.

1. **[Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)**
    - _What it does:_ It automatically cleans up the code the AI writes.
    - _Vibe check:_ Ensures the AI's output remains readable and consistent with project standards.
2. **[ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)**
    - _What it does:_ Flags logic errors.
    - _Why use it:_ Acts as a secondary check on AI-generated code to ensure it's bug-free.
3. **[Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)**
    - _What it does:_ Auto-refreshes your browser as the AI updates your files.
    - _Why use it:_ Critical for the Vibe loop. You prompt, Roo Code edits, and you see the result instantly.
4. **[GitLens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)**
    - _What it does:_ Visualizes code history.
    - _Why use it:_ Helps you track how your "Vibe" has evolved over time.

## 2. Git (Version Control)

_Your Time Machine._

**Download:** [git-scm.com](https://git-scm.com/downloads)

Git allows you to save versions of your work and collaborate with others without overwriting their code.

**The "Vibe" Git Workflow:**

1. **Pull:** Always start by getting the latest changes. `git pull`
2. **Branch:** Never code on `main`. Create a new reality. `git checkout -b feature/my-cool-feature`
3. **Code:** Do your magic.
4. **Save:**
    - `git add .` (Stage everything)
    - `git commit -m "Added the login button"` (Save snapshot)
5. **Push:** Send it to the cloud. `git push origin feature/my-cool-feature`

## 3. Roo Code (Your AI Partner)

_The Engine._

Roo Code isn't just a chatbot; it's an agent that can read and edit your files. You interact with it via the sidebar.

### 🤖 The Modes (Agents)

We have configured specialized AI agents in `_roo_custom_modes` to help you with specific tasks. Select the right mode for the job!

- **Core Development:** Your default "Pair Programmer". Good for general JS/React coding.
- **Architect:** Use this _before_ you code. Ask it to "Plan the structure of the user dashboard." It thinks about file systems and data flow.
- **Security-Quality:** Use this to _audit_ your code. "Scan this file for XSS vulnerabilities."
- **Infrastructure-DevOps:** For when you're setting up Firebase Hosting or GitHub Actions.
- **AI-ML:** For integrating machine learning features.
- **Language-Specialists:** If you're stuck on a specific language syntax.

**💡 Pro Tip:** Don't just say "Fix this." Say: _"Act as a Senior Frontend Dev. Refactor this component to use React Hooks and improve readability."_

_The Engine._

Roo Code isn't just a chatbot; it's an agent that can read and edit your files. You interact with it via the sidebar.

### 🤖 The Modes (Agents)

We have configured specialized AI agents in `_roo_custom_modes` to help you with specific tasks. Select the right mode for the job!

- **Core Development:** Your default "Pair Programmer". Good for general JS/React coding.
- **Architect:** Use this _before_ you code. Ask it to "Plan the structure of the user dashboard." It thinks about file systems and data flow.
- **Security-Quality:** Use this to _audit_ your code. "Scan this file for XSS vulnerabilities."
- **Infrastructure-DevOps:** For when you're setting up Firebase Hosting or GitHub Actions.
- **AI-ML:** For integrating machine learning features.
- **Language-Specialists:** If you're stuck on a specific language syntax.

**💡 Pro Tip:** Don't just say "Fix this." Say: _"Act as a Senior Frontend Dev. Refactor this component to use React Hooks and improve readability."_
