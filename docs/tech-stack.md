# 🛠️ ArborStack - Tech Stack & Technologies

This document outlines the official technology stack for ArborStack. The stack was chosen to maximize developer experience, ensure type safety across the entire codebase, and guarantee 100% data privacy via self-hosting.

## 1. Frontend (Client-Side)
- **Framework:** Next.js (React) - For robust routing and server-side rendering capabilities where needed.
- **Styling:** Tailwind CSS - Using strict utility classes based on our custom Zinc/Emerald Dark Mode theme.
- **Data Visualization:** React Flow - Essential for rendering the interactive, node-based "Skill Tree" UI.
- **Icons:** Lucide React - Clean, consistent, and lightweight SVGs.

## 2. Backend (Server-Side)
- **Runtime:** Node.js.
- **Language:** TypeScript (Strict Mode) - End-to-end type safety.
- **API Framework:** Fastify - Chosen over Express for its superior performance, low overhead, and excellent plugin ecosystem.
- **Architecture Pattern:** Controller-Service-Repository pattern to keep business logic decoupled from API routes.

## 3. Database & ORM
- **Database:** PostgreSQL 16 - Highly reliable relational database. Structured to handle our complex junction tables (`PROJECT_MEMBER`, `PROJECT_SKILL`) efficiently.
- **ORM:** Prisma - Provides type-safe database access, automated migrations, and an intuitive schema definition format.

## 4. Local AI Layer (Privacy-First NLP)
- **Inference Engine:** Ollama - Runs entirely locally within a Docker container. No data is sent to external APIs (like OpenAI or Anthropic).
- **Models:** Llama 3 or Mistral (8B parameters) - Used specifically for parsing unstructured PDF resumes into structured JSON skill arrays.

## 5. Infrastructure & DevOps
- **Containerization:** Docker & Docker Compose - Ensures the entire application (DB, Backend, Frontend, AI Layer) can be spun up with a single command.
- **Version Control:** Git & GitHub.