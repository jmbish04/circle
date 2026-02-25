import type { InferSelectModel } from 'drizzle-orm';
import * as schema from './schema';

// Export database types for use in the application
export type User = InferSelectModel<typeof schema.users>;
export type Team = InferSelectModel<typeof schema.teams>;
export type Status = InferSelectModel<typeof schema.statuses>;
export type Priority = InferSelectModel<typeof schema.priorities>;
export type Label = InferSelectModel<typeof schema.labels>;
export type Health = InferSelectModel<typeof schema.health>;
export type Project = InferSelectModel<typeof schema.projects>;
export type Cycle = InferSelectModel<typeof schema.cycles>;
export type Issue = InferSelectModel<typeof schema.issues>;
export type UserTeam = InferSelectModel<typeof schema.userTeams>;
export type TeamMember = InferSelectModel<typeof schema.teamMembers>;
export type TeamProject = InferSelectModel<typeof schema.teamProjects>;
export type IssueLabel = InferSelectModel<typeof schema.issueLabels>;
export type IssueSubissue = InferSelectModel<typeof schema.issueSubissues>;
