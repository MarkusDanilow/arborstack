import { FastifyRequest, FastifyReply } from "fastify";

// Placeholder — implement in Task 4
export async function getUserProfile(
  _request: FastifyRequest<{ Params: { id: string } }>,
  reply: FastifyReply
) {
  return reply.notImplemented("getUserProfile not yet implemented");
}
