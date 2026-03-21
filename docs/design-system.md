# 🎨 ArborStack - Design System & Brand Guide

This document defines the visual identity of ArborStack. The design combines a serious B2B enterprise UI with subtle gamification and hacker elements.

## 1. Core Vibe & Philosophy
- **Theme:** Dark Mode First (A Light Mode does not exist for now).
- **Style:** Clean, high-contrast, flat with targeted neon accents.
- **Shapes:** Slightly rounded corners (`rounded-lg` in Tailwind) for cards, but sharp, geometric edges (hexagons, diamonds) for skill nodes and badges.

## 2. Typography
We use modern, highly readable web fonts (available via Google Fonts):
- **Primary / UI Text:** `Inter` or `Geist Sans` (Clear, objective, extremely good readability at small sizes).
- **Monospace / Tech Data:** `JetBrains Mono` or `Fira Code` (For XP numbers, level stats, code snippets, and IDs).

## 3. Color Palette (Tailwind CSS Tokens)

### Base / Backgrounds (Zinc scale for a cool, professional look)
| Element | Tailwind Class | Hex Code | Usage |
| :--- | :--- | :--- | :--- |
| **Main Background** | `bg-zinc-950` | `#09090b` | The absolute background of the app. |
| **Card / Surface** | `bg-zinc-900` | `#18181b` | For panels, sidebars, and cards. |
| **Borders / Divider** | `border-zinc-800` | `#27272a` | Fine dividing lines between elements. |

### Typography (Text Colors)
| Element | Tailwind Class | Hex Code | Usage |
| :--- | :--- | :--- | :--- |
| **Primary Text** | `text-zinc-100` | `#f4f4f5` | Body text, headings. |
| **Muted Text** | `text-zinc-400` | `#a1a1aa` | Labels, metadata, timestamps. |

### Primary Accents (The "ArborStack" Brand Colors)
| Element | Tailwind Class | Hex Code | Usage |
| :--- | :--- | :--- | :--- |
| **Brand Primary** | `text-emerald-500` | `#10b981` | Buttons, active tabs, the skill tree path. |
| **Brand Hover** | `bg-emerald-600` | `#059669` | Button hover states. |
| **Accent / Info** | `text-cyan-500` | `#06b6d4` | For interactive links or secondary highlights. |

## 4. Gamification & Level Tiers (Semantic Colors)
These colors are strictly used for visualizing skill levels and badges (as defined in the Game Design document):

| Tier | Level | Tailwind Class | Style Vibe |
| :--- | :--- | :--- | :--- |
| **Novice** | 1 - 9 | `text-slate-400` | Gray / Inconspicuous |
| **Apprentice** | 10 - 19 | `text-emerald-400` | Green / Solid |
| **Adept** | 20 - 39 | `text-blue-400` | Blue / Advanced |
| **Expert** | 40 - 49 | `text-purple-500` | Purple / Epic |
| **Master** | 50 | `text-amber-400` | Gold / Legendary |

## 5. UI Components & Patterns
- **Buttons:** Minimalistic. Primary buttons feature a strong Emerald background, while secondary buttons are transparent with a `border-zinc-700`.
- **Glow Effects:** Use very sparingly! Only when an employee achieves a "Level Up", the card receives a soft box-shadow (`shadow-[0_0_15px_rgba(16,185,129,0.5)]`).
- **Graphs & Trees:** Connecting lines between skills are `zinc-700` by default. When a path is active/learned, it glows `emerald-500`.