// Prisma configuration file (Prisma 6+)
// Loads env from root-level .env (one level up from /backend)
import "dotenv/config";
import path from "path";
import { config } from "dotenv";
import { defineConfig } from "prisma/config";

// Load root .env explicitly (the .env lives at project root, not inside /backend)
config({ path: path.resolve(__dirname, "../.env") });

export default defineConfig({
  schema: "prisma/schema.prisma",
  migrations: {
    path: "prisma/migrations",
  },
  datasource: {
    url: process.env["DATABASE_URL"],
  },
});
