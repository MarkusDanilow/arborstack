# 🌳 ArborStack

**The Self-Hosted, Event-Driven Skill Graph for Engineering Teams.**

ArborStack is not another static HR spreadsheet. It is a dynamic, privacy-first platform that maps your team's engineering skills as an interactive RPG-style "Skill Tree". By integrating local AI document parsing, automated webhooks (GitHub, Jira), and project-based role tracking, ArborStack organically grows and updates your team's capabilities in real-time.

## 🚀 Why ArborStack?
- **100% Privacy-First:** Designed to be self-hosted via Docker. Your team's data, resumes, and Git history never leave your company VPN.
- **Local AI Parsing:** Uses local LLMs (via Ollama) to extract baseline skills from PDF/Word resumes without sending PII to the cloud.
- **Event-Driven Growth:** Automatically awards "XP" (Experience Points) to developers based on actual code commits, PRs, and Jira tickets.
- **Project & Role Mapping:** Tracks not just *what* people know, but *where* they applied it. Link users to projects with specific roles (e.g., "Scrum Master", "Backend Lead") and project-specific tech stacks.
- **Graph-Based Queries:** Need a team of 3 where someone knows React, someone has AWS experience, and someone has acted as a Tech Lead? Query the graph instantly.

## 🏗 Architecture & Tech Stack
- **Backend:** Node.js, Fastify, Prisma ORM
- **Database:** PostgreSQL (Relational base structured for graph-like queries)
- **AI Engine:** Ollama (Llama 3 / Mistral) for local NLP extraction
- **Frontend:** Next.js, React Flow (for Node-based visualization), Tailwind CSS (Strict Dark-Mode Enterprise UI)

## 📦 Quickstart (Docker Compose)
*Coming soon! ArborStack will be deployable with a single command:*
```bash
git clone [https://github.com/yourusername/arborstack.git](https://github.com/yourusername/arborstack.git)
cd arborstack
docker-compose up -d
```

🛣 Roadmap

[ ] Phase 1: Core API & PostgreSQL DB Schema (Users, Skills, Projects, Roles)

[ ] Phase 2: Local AI PDF Parsing Pipeline (The "Cold Start" solution)

[ ] Phase 3: React Flow Frontend MVP (Interactive Dashboard & Skill Trees)

[ ] Phase 4: GitHub/GitLab Webhook Integration for passive XP gain


___


Built with ❤️ for teams who want to own their data.