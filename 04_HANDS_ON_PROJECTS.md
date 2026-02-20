# 🏗️ Hands-On Vibe Projects

We don't do tutorials here. We build products.

## Level 1: The "Identity" Site (Personal Portfolio)
*Goal: Master HTML/CSS, Git, and basic Deployment.*

**The Pitch:** You are a brand. You need a home on the web.
**Requirements:**
-   **Tech:** HTML5, CSS3 (or Tailwind), specific "Vibe" aesthetic.
-   **Content:** "About Me", "Projects" (placeholders ok), "Contact".
-   **Infrastructure:** Hosted on Firebase Hosting.
-   **Challenge:** Use **Roo Code** to generate a responsive grid layout for your projects section. Prompt it: *"Create a responsive CSS grid for portfolio cards that turns into a single column on mobile."*

## Level 2: The "Vibe Check" (Real-time Chat)
*Goal: Master Firestore, Authentication, and React state.*

**The Pitch:** A public chat room where everyone in the CO-OP can drop messages.
**Requirements:**
-   **Tech:** React (or simple JS), Firebase SDK.
-   **Auth:** Users must sign in with Google to post.
-   **Database:** Cloud Firestore.
    -   Collection: `messages`
    -   Fields: `text`, `uid`, `displayName`, `timestamp`.
-   **Real-time:** The chat must update instantly (use `onSnapshot`).
-   **Security:** Only logged-in users can write. Anyone can read.

## Level 3: The SaaS MVP (Task Manager / Tracker)
*Goal: Full CRUD, Complex State, Security Rules.*

**The Pitch:** A "Focus Tracker" that lets users define tasks and start a timer.
**Requirements:**
-   **Data Structure:** Users have their *own* private collection of tasks.
-   **Security:** *Crucial.* User A cannot see User B's tasks.
    -   Rule: `allow read, write: if request.auth.uid == resource.data.userId;`
-   **Feature:** A simple stopwatch/timer for each task.
-   **Deployment:** Fully polished, live URL, clean README on GitHub.

## 🌟 The "Vibe" Approach to these Projects
1.  **Don't write boilerplate.** Ask Roo Code to scaffold the project structure.
2.  **Focus on the tricky bits.** Spend your brainpower on the *logic* of the timer or the *security* of the database.
3.  **Ship it.** A broken app on localhost is worth 0. A slightly buggy app on a live URL is worth 100.
