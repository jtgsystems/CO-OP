# 🌊 Welcome to the CO-OP: The Vibe Coding Initiative

**Goal:** Become the most efficient, flow-state-driven ("Vibe") coders possible.

## What is "Vibe Coding"?
Vibe coding isn't just about writing code; it's about **flow**. It's the art of acting as a *conductor* rather than just a laborer.
- **Old Way:** Memorize syntax, struggle with boilerplate, get stuck on missing semicolons.
- **Vibe Way:** Architect the solution, prompt the AI (Roo Code), review the output, and keep the momentum moving. You focus on *logic* and *user experience*; the machine handles the typing.

## The Mission
We are building a collaborative environment where we:
1.  **Ship Fast:** Prototype ideas in hours, not weeks.
2.  **Learn Deeply:** Understand *why* something works, even if AI helped write it.
3.  **Stay Secure:** Speed doesn't mean sloppy. We build safe apps.

## Your Toolkit
You have access to a cutting-edge stack:
-   **Antigravity IDE:** Our specialized environment for frictionless development.
-   **Roo Code:** Your AI pair programmer. You will learn to use its "Modes" (Architect, DevOps, Security) to amplify your skills.
-   **Firebase:** The backend that lets frontend developers have superpowers.
-   **Git:** Our safety net and collaboration layer.

---
**📂 Navigate this Folder:**
-   `01_CURRICULUM_ROADMAP.md`: Your path from Newbie to Pro.
-   `02_TOOLING_GUIDE.md`: How to use Antigravity, Roo, and Git.
-   `03_FIREBASE_FOR_HUMANS.md`: Backend tech explained simply.
-   `04_HANDS_ON_PROJECTS.md`: What you'll be building.
-   `05_BEST_PRACTICES.md`: Rules of the road (Security, Reviews, etc).

## ⚡ The "Day 1" Magic Prompt
Don't know where to start? Copy and paste this **exact** block into the Antigravity Chat (Roo Code) to initialize your session with the perfect settings.

```text
Act as my **Senior Vibe Coding Mentor & Architect**.

**Objective:** Autonomous creation of a high-performance web application scaffold.

**The Pro Stack (Non-Negotiable):**
1.  **Runtime:** `Bun` (Use `bun create vite`, `bun install`, `bun run dev`).
2.  **Frontend:** React + Vite (SWC) + TypeScript.
3.  **Styling:** Tailwind CSS (configured with `postcss` and `autoprefixer`).
4.  **Backend/Auth:** Firebase v9+ (Modular SDK). Create a `src/lib/firebase.ts` file with placeholder keys.

**Operational Rules (Vibe Mode):**
-   **NO Scaffolding Questions:** Do not ask me for project names or preferences. Invent a cool, tech-themed name (e.g., "Neon-Flux", "Orbit-Sync").
-   **Speed First:** Execute all shell commands immediately. Do not wait for confirmation.
-   **Structure:**
    -   `src/components` (UI elements)
    -   `src/pages` (Routes)
    -   `src/lib` (Firebase & Helpers)
    -   `src/hooks` (Custom React Hooks)
-   **Git:** Initialize the repo and commit the scaffold immediately.

**Execution Plan:**
1.  Create the project directory.
2.  Install all dependencies via Bun.
3.  Configure Tailwind CSS.
4.  Create a **Beautiful "Hello World" Landing Page** in `App.tsx` using Tailwind to prove the style engine works. It should look professional.
5.  Create a `README.md` explaining how to start the app using Bun.

**Final Output:**
-   Tell me the exact command to run the server (e.g., `cd [name] && bun run dev`).
-   Keep it brief. Build it now.
```
