import fp from "fastify-plugin";
import { FastifyInstance } from "fastify";
import pg from "pg";
import { PrismaPg } from "@prisma/adapter-pg";
import { PrismaClient } from "../generated/prisma/client.js";

declare module "fastify" {
  interface FastifyInstance {
    prisma: PrismaClient;
  }
}

async function prismaPluginFn(app: FastifyInstance) {
  const connectionString = process.env["DATABASE_URL"] ?? "";
  const pool = new pg.Pool({ connectionString });
  const adapter = new PrismaPg(pool as any);
  
  const prisma = new PrismaClient({
    adapter,
    log: app.log.level === "info" ? ["query", "warn", "error"] : ["warn", "error"],
  });

  await prisma.$connect();
  app.log.info("Prisma connected to database");

  // Decorate the Fastify instance so all routes can access `app.prisma`
  app.decorate("prisma", prisma);

  // Graceful shutdown: disconnect Prisma when Fastify closes
  app.addHook("onClose", async () => {
    await prisma.$disconnect();
    app.log.info("Prisma disconnected");
  });
}

// fastify-plugin ensures decorators are not scoped — available app-wide
export const prismaPlugin = fp(prismaPluginFn, {
  name: "prisma",
});
