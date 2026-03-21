import { PrismaClient } from "../generated/prisma/client.js";

// Placeholder — implement in Task 4
export class UserService {
  constructor(private readonly prisma: PrismaClient) {}

  async findById(id: string) {
    return this.prisma.user.findUniqueOrThrow({ where: { id } });
  }
}
