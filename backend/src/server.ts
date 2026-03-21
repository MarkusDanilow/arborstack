import Fastify from "fastify";
import cors from "@fastify/cors";
import sensible from "@fastify/sensible";

import { prismaPlugin } from "./plugins/prisma";
import { errorHandler } from "./plugins/errorHandler";
import { healthRoutes } from "./routes/health";

const PORT = parseInt(process.env["PORT"] ?? "3001", 10);
const HOST = process.env["HOST"] ?? "0.0.0.0";
const IS_DEV = process.env["NODE_ENV"] !== "production";

export async function buildServer() {
  const loggerConfig: any = { level: IS_DEV ? "info" : "warn" };
  if (IS_DEV) {
    loggerConfig.transport = { target: "pino-pretty", options: { colorize: true } };
  }

  const app = Fastify({ logger: loggerConfig });

  // ── Core plugins ──────────────────────────────────────────────
  await app.register(cors, {
    origin: IS_DEV ? true : (process.env["CORS_ORIGIN"] ?? false),
  });
  await app.register(sensible);

  // ── App plugins ───────────────────────────────────────────────
  await app.register(prismaPlugin);
  await app.register(errorHandler);

  // ── Routes ────────────────────────────────────────────────────
  await app.register(healthRoutes, { prefix: "/api" });
  // Future: await app.register(userRoutes,    { prefix: "/api/v1" });
  // Future: await app.register(projectRoutes, { prefix: "/api/v1" });

  return app;
}

async function start() {
  const app = await buildServer();
  try {
    await app.listen({ port: PORT, host: HOST });
  } catch (err) {
    app.log.error(err);
    process.exit(1);
  }
}

start();
