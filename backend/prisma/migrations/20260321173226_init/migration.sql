-- CreateEnum
CREATE TYPE "skill_event_source" AS ENUM ('PDF_IMPORT', 'GITHUB_PR', 'GITHUB_COMMIT', 'PROJECT_MILESTONE', 'MANUAL');

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "avatar_url" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "icon_url" TEXT,
    "parent_id" UUID,

    CONSTRAINT "skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_skills" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "skill_id" UUID NOT NULL,
    "xp" INTEGER NOT NULL DEFAULT 0,
    "level" INTEGER NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skill_events" (
    "id" UUID NOT NULL,
    "user_skill_id" UUID NOT NULL,
    "xp_awarded" INTEGER NOT NULL,
    "source" "skill_event_source" NOT NULL,
    "description" TEXT,
    "occurred_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "skill_events_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "projects" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "start_date" TIMESTAMP(3),
    "end_date" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "projects_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project_members" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "project_id" UUID NOT NULL,
    "project_role" TEXT NOT NULL,
    "joined_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "left_at" TIMESTAMP(3),

    CONSTRAINT "project_members_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project_skills" (
    "id" UUID NOT NULL,
    "project_id" UUID NOT NULL,
    "skill_id" UUID NOT NULL,
    "milestone_xp" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "project_skills_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "skills_name_key" ON "skills"("name");

-- CreateIndex
CREATE INDEX "skills_parent_id_idx" ON "skills"("parent_id");

-- CreateIndex
CREATE INDEX "user_skills_user_id_idx" ON "user_skills"("user_id");

-- CreateIndex
CREATE INDEX "user_skills_skill_id_idx" ON "user_skills"("skill_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_skills_user_id_skill_id_key" ON "user_skills"("user_id", "skill_id");

-- CreateIndex
CREATE INDEX "skill_events_user_skill_id_idx" ON "skill_events"("user_skill_id");

-- CreateIndex
CREATE INDEX "skill_events_occurred_at_idx" ON "skill_events"("occurred_at");

-- CreateIndex
CREATE INDEX "project_members_user_id_idx" ON "project_members"("user_id");

-- CreateIndex
CREATE INDEX "project_members_project_id_idx" ON "project_members"("project_id");

-- CreateIndex
CREATE UNIQUE INDEX "project_members_user_id_project_id_key" ON "project_members"("user_id", "project_id");

-- CreateIndex
CREATE INDEX "project_skills_project_id_idx" ON "project_skills"("project_id");

-- CreateIndex
CREATE INDEX "project_skills_skill_id_idx" ON "project_skills"("skill_id");

-- CreateIndex
CREATE UNIQUE INDEX "project_skills_project_id_skill_id_key" ON "project_skills"("project_id", "skill_id");

-- AddForeignKey
ALTER TABLE "skills" ADD CONSTRAINT "skills_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "skills"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_skills" ADD CONSTRAINT "user_skills_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_skills" ADD CONSTRAINT "user_skills_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skill_events" ADD CONSTRAINT "skill_events_user_skill_id_fkey" FOREIGN KEY ("user_skill_id") REFERENCES "user_skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_members" ADD CONSTRAINT "project_members_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_members" ADD CONSTRAINT "project_members_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_skills" ADD CONSTRAINT "project_skills_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_skills" ADD CONSTRAINT "project_skills_skill_id_fkey" FOREIGN KEY ("skill_id") REFERENCES "skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;
