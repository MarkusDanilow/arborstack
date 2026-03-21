import { FastifyInstance } from "fastify";

export async function healthRoutes(app: FastifyInstance) {
  /**
   * GET /api/health
   * Returns server + database connectivity status.
   * Used by Docker health checks and uptime monitors.
   */
  app.get(
    "/health",
    {
      schema: {
        tags: ["System"],
        summary: "Health check",
        response: {
          200: {
            type: "object",
            properties: {
              status: { type: "string" },
              timestamp: { type: "string" },
              uptime: { type: "number" },
              database: { type: "string" },
            },
          },
        },
      },
    },
    async (_request, reply) => {
      // Ping the database with a cheap raw query
      let dbStatus = "ok";
      try {
        await app.prisma.$queryRaw`SELECT 1`;
      } catch {
        dbStatus = "unreachable";
      }

      return reply.status(200).send({
        status: "ok",
        timestamp: new Date().toISOString(),
        uptime: process.uptime(),
        database: dbStatus,
      });
    }
  );
}
