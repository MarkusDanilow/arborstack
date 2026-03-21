import { PrismaClient } from "../generated/prisma/client.js";

// Placeholder — implement in Task 4
export class ProjectService {
  constructor(private readonly prisma: PrismaClient) {}

  async findAll() {
    return this.prisma.project.findMany({ orderBy: { createdAt: "desc" } });
  }
}
