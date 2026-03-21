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

### 🌑 Base / Backgrounds (Zinc scale for a cool, professional look)
<div style="display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap;">
  <div style="background-color: #09090b; color: white; padding: 10px; border-radius: 8px; border: 1px solid #27272a;">
    <span style="display:inline-block; width:20px; height:20px; border-radius:50%; background-color:#09090b; border: 1px solid #3f3f46; vertical-align:middle;"></span> <b>Main Bg</b><br/><code>bg-zinc-950</code><br/><small>#09090b</small>
  </div>
  <div style="background-color: #18181b; color: white; padding: 10px; border-radius: 8px; border: 1px solid #27272a;">
    <span style="display:inline-block; width:20px; height:20px; border-radius:50%; background-color:#18181b; border: 1px solid #3f3f46; vertical-align:middle;"></span> <b>Card Surface</b><br/><code>bg-zinc-900</code><br/><small>#18181b</small>
  </div>
  <div style="background-color: #27272a; color: white; padding: 10px; border-radius: 8px; border: 1px solid #3f3f46;">
    <span style="display:inline-block; width:20px; height:20px; border-radius:50%; background-color:#27272a; vertical-align:middle;"></span> <b>Borders</b><br/><code>border-zinc-800</code><br/><small>#27272a</small>
  </div>
</div>

### 📝 Typography (Text Colors)
<div style="display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap;">
  <div style="background-color: #18181b; color: white; padding: 10px; border-radius: 8px; border: 1px solid #27272a;">
    <span style="display:inline-block; width:20px; height:20px; border-radius:50%; background-color:#f4f4f5; vertical-align:middle;"></span> <b>Primary Text</b><br/><code>text-zinc-100</code><br/><small>#f4f4f5</small>
  </div>
  <div style="background-color: #18181b; color: white; padding: 10px; border-radius: 8px; border: 1px solid #27272a;">
    <span style="display:inline-block; width:20px; height:20px; border-radius:50%; background-color:#a1a1aa; vertical-align:middle;"></span> <b>Muted Text</b><br/><code>text-zinc-400</code><br/><small>#a1a1aa</small>
  </div>
</div>

### ❇️ Primary Accents (The "ArborStack" Brand Colors)
<div style="display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap;">
  <div style="background-color: #18181b; color: white; padding: 10px; border-radius: 8px; border: 1px solid #27272a;">
    <span style="display:inline-block; width:20px; height:20px; border-radius:50%; background-color:#10b981; vertical-align:middle;"></span> <b>Brand Primary</b><br/><code>emerald-500</code><br/><small>#10b981</small>
  </div>
  <div style="background-color: #18181b; color: white; padding: 10px; border-radius: 8px; border: 1px solid #27272a;">
    <span style="display:inline-block; width:20px; height:20px; border-radius:50%; background-color:#059669; vertical-align:middle;"></span> <b>Brand Hover</b><br/><code>emerald-600</code><br/><small>#059669</small>
  </div>
  <div style="background-color: #18181b; color: white; padding: 10px; border-radius: 8px; border: 1px solid #27272a;">
    <span style="display:inline-block; width:20px; height:20px; border-radius:50%; background-color:#06b6d4; vertical-align:middle;"></span> <b>Accent / Info</b><br/><code>cyan-500</code><br/><small>#06b6d4</small>
  </div>
</div>

## 4. Gamification & Level Tiers (Semantic Colors)
These colors are strictly used for visualizing skill levels and badges (as defined in the Game Design document):

* <span style="display:inline-block; width:16px; height:16px; border-radius:50%; background-color:#94a3b8; vertical-align:middle;"></span> **Novice (Lvl 1-9):** `text-slate-400` (#94a3b8) - Gray / Inconspicuous
* <span style="display:inline-block; width:16px; height:16px; border-radius:50%; background-color:#34d399; vertical-align:middle;"></span> **Apprentice (Lvl 10-19):** `text-emerald-400` (#34d399) - Green / Solid
* <span style="display:inline-block; width:16px; height:16px; border-radius:50%; background-color:#60a5fa; vertical-align:middle;"></span> **Adept (Lvl 20-39):** `text-blue-400` (#60a5fa) - Blue / Advanced
* <span style="display:inline-block; width:16px; height:16px; border-radius:50%; background-color:#a855f7; vertical-align:middle;"></span> **Expert (Lvl 40-49):** `text-purple-500` (#a855f7) - Purple / Epic
* <span style="display:inline-block; width:16px; height:16px; border-radius:50%; background-color:#fbbf24; vertical-align:middle;"></span> **Master (Lvl 50):** `text-amber-400` (#fbbf24) - Gold / Legendary

## 5. UI Components & Patterns
- **Buttons:** Minimalistic. Primary buttons feature a strong Emerald background, while secondary buttons are transparent with a `border-zinc-700`.
- **Glow Effects:** Use very sparingly! Only when an employee achieves a "Level Up", the card receives a soft box-shadow (`shadow-[0_0_15px_rgba(16,185,129,0.5)]`).
- **Graphs & Trees:** Connecting lines between skills are `zinc-700` by default. When a path is active/learned, it glows `emerald-500`.