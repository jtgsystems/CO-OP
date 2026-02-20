# 🛡️ Best Practices & Professional Standards

Writing code is easy. Writing *maintainable, secure* code is professional.

## 1. Security Fundamentals 🔒
*The "Don't Get Hacked" Guide.*

-   **Never Commit Keys:** API Keys (like `sk_live_...`) should NEVER go into Git. Use `.env` files.
-   **Trust No One:** Validate all user input. If a user can type it, they can attack it.
-   **Frontend Security:**
    -   Avoid `dangerouslySetInnerHTML` in React (it allows XSS attacks).
    -   Sanitize data before displaying it.
-   **Backend Security:**
    -   **Firestore Rules:** Default to `allow read, write: if false;` and open up ONLY what is needed.

## 2. Code Review Etiquette 👀
*How to give and take feedback.*

-   **The Goal:** Better code, not proving you're smart.
-   **When Reviewing:**
    -   Be kind but firm.
    -   Ask questions ("Why did we choose this approach?") instead of making demands ("Change this").
    -   Look for logic errors, not just style (let the Linter handle style).
-   **When Being Reviewed:**
    -   Don't take it personally. You are not your code.
    -   Explain your reasoning.

## 3. Performance Optimization 🚀
*Make it fast.*

-   **Lighthouse:** Run a Lighthouse audit (in Chrome DevTools) on every page. Aim for all Green scores.
-   **Images:** Don't load a 5MB PNG for a tiny icon. Use WebP or SVG.
-   **Lazy Loading:** Don't load code/images until the user actually sees them.
-   **Minimize Renders:** In React, ensure your components aren't re-drawing 100 times a second.

## 4. Continuous Learning 🧠
*The industry moves fast. Keep up.*

-   **Docs > Tutorials:** Learn to read official documentation (MDN, React Docs, Firebase Docs).
-   **Antigravity Updates:** Keep your IDE extensions updated.
-   **Roo Code Evolution:** New models come out weekly. Experiment with them.

---
**Ready? Go to `00_START_HERE.md` and begin.**
