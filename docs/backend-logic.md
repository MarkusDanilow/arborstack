# 🧠 ArborStack - Backend Logic & Service Architecture

We follow a modular **Controller-Service-Repository** pattern.

## 1. Class / Service Logic

### `XPService` (The Calculator)
- **`calculateLevel(totalXp)`**: Implements the exponential formula from `game_design.md`.
- **`awardXp(userId, skillId, amount, source)`**: 
    - Checks for Daily Cap (500 XP limit).
    - Creates a `SkillEvent` record.
    - Increments `UserSkill.total_xp`.
    - Checks if a "Level Up" occurred and triggers a notification.

### `AIService` (The Orchestrator)
- **`parseResume(rawText)`**: 
    - Sends text to Ollama with a specialized System Prompt.
    - Validates the returned JSON against a defined `SkillSchema`.
- **`mapSkillsToUser(userId, parsedData)`**: Converts "Years of Experience" into the initial XP boost (+1000 XP/year).

### `ProjectService` (The Matrix Manager)
- **`completeProject(projectId)`**: 
    - Iterates through all `ProjectMembers`.
    - Iterates through all `ProjectSkills`.
    - Distributes XP based on `is_core_tech` and `project_role`.

## 2. Controller Mapping (Fastify)
- **`UserController`**: Handles request validation and calls `XPService`.
- **`AIController`**: Manages file streams and calls `AIService`.
- **`ProjectController`**: Manages project lifecycle and role assignments.

## 3. Types & Interfaces (TypeScript)
```typescript
interface XPEvent {
  source: 'GITHUB' | 'RESUME' | 'PROJECT_COMPLETION' | 'MANUAL';
  amount: number;
  skillId: string;
  description: string;
}