# 🎮 ArborStack - Game Design & Progression System

This document defines the logic of how experience points (XP) are earned in ArborStack and how the level structure (the Skill Tree) is calculated.

## 1. The Level Math (Progression Curve)
We use a **quadratic/exponential growth model**, similar to classic RPGs (D&D, World of Warcraft). 
Every skill starts at Level 1. 

**The formula for the total XP required per level:**
`Total XP = Base_XP * (Level ^ Exponent)`
- `Base_XP` = 100
- `Exponent` = 1.5

*Examples for Milestones:*
- **Level 2:** ~282 XP (Quick first win)
- **Level 10:** ~3,162 XP (Requires a few weeks of active work)
- **Level 30:** ~16,431 XP (True senior status in a given skill)
- **Level 50 (Max):** ~35,355 XP (The absolute "Skill God" of the company)

## 2. The XP Economy (How to gain points)

To prevent users from manipulating the system through manual entries, most XP is generated from actual, verifiable events (webhooks).

### A. The "Cold Start" (Initial Resume Import)
When the local AI parses a resume (PDF), we award Base XP based on the years a skill was applied.
- **Per 1 year of proven experience:** +1,000 XP
*(Example: A dev with 3 years of React experience starts directly with 3,000 XP at approx. Level 9).*

### B. Passive XP (Automated Webhooks)
This is the core of our "organic" growth engine.
- **GitHub / GitLab:**
  - Pull Request merged (Main language of the PR): +50 XP
  - Code Review performed: +20 XP
  - Bugfix commit (Commit message contains "fix"): +10 XP
- **Jira / Linear:**
  - Ticket completed: +10 XP per Story Point (A 5-point ticket grants 50 XP to the linked project skills).

### C. Active XP (Projects & Milestones)
When a project is marked as "Completed" in ArborStack, XP is distributed to all project members based on their role (`PROJECT_MEMBER`) and the tech stack used (`PROJECT_SKILL`).
- **Core Tech Role** (e.g., Lead Developer for the React frontend): +1,000 XP to React.
- **Supporting Role** (e.g., Scrum Master who occasionally helped with the CI/CD pipeline): +250 XP to DevOps.

### D. Manual Boosts (HR / Admin)
- Completed certificate (e.g., AWS Solutions Architect): +5,000 XP
- Hosted internal Tech Talk / Workshop: +2,000 XP

## 3. Ranks & Status (Gamification Tiers)
The raw level is just a number. To make the dashboard visually appealing, we map level ranges to ranks (which are color-coded in the UI, e.g., Gray ➔ Green ➔ Blue ➔ Purple ➔ Gold).

| Level Range | Rank Title | UI Color (Tailwind) | Meaning |
| :--- | :--- | :--- | :--- |
| **Lvl 1 - 9** | Novice | `text-slate-400` | Just starting to learn the skill. |
| **Lvl 10 - 19** | Apprentice | `text-emerald-400` | Can productively take on tasks. |
| **Lvl 20 - 39** | Adept / Mid | `text-blue-400` | Solid, needs little to no supervision. |
| **Lvl 40 - 49** | Expert / Senior | `text-purple-500` | Architect, solves the most complex bugs. |
| **Lvl 50** | Master / Guru | `text-amber-400` | The absolute oracle for this technology. |

## 4. Anti-Cheat & Limits (Crucial for B2B!)
- **Daily Cap:** Maximum of 500 XP per skill per day via webhooks (Prevents users from pushing 100 micro-commits just to level up).
- **Skill Decay (Planned for v2.0):** If a skill receives no new XP for 12 consecutive months, it gets a "Rusty" status in the graph. The level doesn't drop, but the UI visually indicates that a refresher is needed.