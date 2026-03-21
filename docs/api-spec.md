# 📡 ArborStack - API Specification (v1.0)

All routes are prefixed with `/api/v1`. Communication is strictly JSON.

## 1. User & Skill Routes
- **GET `/users/:id`**: Returns full user profile including current level and role.
- **GET `/users/:id/skills`**: Returns the skill graph data for the Skill Tree (React Flow compatible).
- **GET `/users/:id/stats`**: Returns total XP, rank, and recent XP events.

## 2. Project & Role Routes
- **GET `/projects`**: List all active projects.
- **POST `/projects`**: Create a new project (title, description, tech stack).
- **POST `/projects/:id/members`**: Assign a user to a project with a specific `project_role`.
- **POST `/projects/:id/complete`**: Triggers a project-wide XP award event for all members.

## 3. AI & Resume Processing (The "Cold Start")
- **POST `/ai/upload-resume`**: 
    - **Input**: Multipart File (PDF/DOCX).
    - **Action**: 
        1. Extract raw text.
        2. Stream text to **Ollama** (`/api/generate` or `/api/chat`).
        3. Parse JSON response (Skill names + Years of Experience).
        4. Upsert skills to database and calculate initial XP.
    - **Output**: 201 Created + JSON of extracted skills.

## 4. Webhook Integrations (The "XP Engine")
- **POST `/webhooks/github`**: Receives PR/Commit events.
- **POST `/webhooks/jira`**: Receives ticket status changes.
- **Logic**: These routes call the `XPService` to validate the event and update `SkillEvents`.