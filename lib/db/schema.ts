import { sqliteTable, text, integer } from 'drizzle-orm/sqlite-core';
import { relations } from 'drizzle-orm';

// Users table
export const users = sqliteTable('users', {
   id: text('id').primaryKey(),
   name: text('name').notNull(),
   avatarUrl: text('avatar_url').notNull(),
   email: text('email').notNull().unique(),
   status: text('status', { enum: ['online', 'offline', 'away'] }).notNull(),
   role: text('role', { enum: ['Member', 'Admin', 'Guest'] }).notNull(),
   joinedDate: text('joined_date').notNull(),
});

// Teams table
export const teams = sqliteTable('teams', {
   id: text('id').primaryKey(),
   name: text('name').notNull(),
   icon: text('icon').notNull(),
   joined: integer('joined', { mode: 'boolean' }).notNull(),
   color: text('color').notNull(),
});

// Status table
export const statuses = sqliteTable('statuses', {
   id: text('id').primaryKey(),
   name: text('name').notNull(),
   color: text('color').notNull(),
});

// Priorities table
export const priorities = sqliteTable('priorities', {
   id: text('id').primaryKey(),
   name: text('name').notNull(),
   color: text('color').notNull(),
});

// Labels table
export const labels = sqliteTable('labels', {
   id: text('id').primaryKey(),
   name: text('name').notNull(),
   color: text('color').notNull(),
});

// Health table
export const health = sqliteTable('health', {
   id: text('id').primaryKey(),
   name: text('name').notNull(),
   color: text('color').notNull(),
   description: text('description').notNull(),
});

// Projects table
export const projects = sqliteTable('projects', {
   id: text('id').primaryKey(),
   name: text('name').notNull(),
   statusId: text('status_id')
      .notNull()
      .references(() => statuses.id),
   iconName: text('icon_name').notNull(),
   percentComplete: integer('percent_complete').notNull(),
   startDate: text('start_date').notNull(),
   leadId: text('lead_id')
      .notNull()
      .references(() => users.id),
   priorityId: text('priority_id')
      .notNull()
      .references(() => priorities.id),
   healthId: text('health_id')
      .notNull()
      .references(() => health.id),
});

// Cycles table
export const cycles = sqliteTable('cycles', {
   id: text('id').primaryKey(),
   number: integer('number').notNull(),
   name: text('name').notNull(),
   teamId: text('team_id').notNull(),
   startDate: text('start_date').notNull(),
   endDate: text('end_date').notNull(),
   progress: integer('progress').notNull(),
});

// Issues table
export const issues = sqliteTable('issues', {
   id: text('id').primaryKey(),
   identifier: text('identifier').notNull(),
   title: text('title').notNull(),
   description: text('description').notNull(),
   statusId: text('status_id')
      .notNull()
      .references(() => statuses.id),
   assigneeId: text('assignee_id').references(() => users.id),
   priorityId: text('priority_id')
      .notNull()
      .references(() => priorities.id),
   createdAt: text('created_at').notNull(),
   cycleId: text('cycle_id').notNull(),
   projectId: text('project_id').references(() => projects.id),
   rank: text('rank').notNull(),
   dueDate: text('due_date'),
});

// Junction table: user_teams (many-to-many)
export const userTeams = sqliteTable('user_teams', {
   userId: text('user_id')
      .notNull()
      .references(() => users.id),
   teamId: text('team_id')
      .notNull()
      .references(() => teams.id),
});

// Junction table: team_members (many-to-many)
export const teamMembers = sqliteTable('team_members', {
   teamId: text('team_id')
      .notNull()
      .references(() => teams.id),
   userId: text('user_id')
      .notNull()
      .references(() => users.id),
});

// Junction table: team_projects (many-to-many)
export const teamProjects = sqliteTable('team_projects', {
   teamId: text('team_id')
      .notNull()
      .references(() => teams.id),
   projectId: text('project_id')
      .notNull()
      .references(() => projects.id),
});

// Junction table: issue_labels (many-to-many)
export const issueLabels = sqliteTable('issue_labels', {
   issueId: text('issue_id')
      .notNull()
      .references(() => issues.id),
   labelId: text('label_id')
      .notNull()
      .references(() => labels.id),
});

// Junction table: issue_subissues (many-to-many for sub-issues)
export const issueSubissues = sqliteTable('issue_subissues', {
   parentIssueId: text('parent_issue_id')
      .notNull()
      .references(() => issues.id),
   subissueId: text('subissue_id')
      .notNull()
      .references(() => issues.id),
});

// Relations
export const usersRelations = relations(users, ({ many }) => ({
   teams: many(userTeams),
   assignedIssues: many(issues),
   ledProjects: many(projects),
}));

export const teamsRelations = relations(teams, ({ many }) => ({
   users: many(userTeams),
   members: many(teamMembers),
   projects: many(teamProjects),
}));

export const projectsRelations = relations(projects, ({ one, many }) => ({
   status: one(statuses, {
      fields: [projects.statusId],
      references: [statuses.id],
   }),
   lead: one(users, {
      fields: [projects.leadId],
      references: [users.id],
   }),
   priority: one(priorities, {
      fields: [projects.priorityId],
      references: [priorities.id],
   }),
   health: one(health, {
      fields: [projects.healthId],
      references: [health.id],
   }),
   issues: many(issues),
   teams: many(teamProjects),
}));

export const issuesRelations = relations(issues, ({ one, many }) => ({
   status: one(statuses, {
      fields: [issues.statusId],
      references: [statuses.id],
   }),
   assignee: one(users, {
      fields: [issues.assigneeId],
      references: [users.id],
   }),
   priority: one(priorities, {
      fields: [issues.priorityId],
      references: [priorities.id],
   }),
   project: one(projects, {
      fields: [issues.projectId],
      references: [projects.id],
   }),
   labels: many(issueLabels),
   subissues: many(issueSubissues, {
      relationName: 'subissues',
   }),
   parentIssues: many(issueSubissues, {
      relationName: 'parentIssues',
   }),
}));

export const issueLabelsRelations = relations(issueLabels, ({ one }) => ({
   issue: one(issues, {
      fields: [issueLabels.issueId],
      references: [issues.id],
   }),
   label: one(labels, {
      fields: [issueLabels.labelId],
      references: [labels.id],
   }),
}));

export const userTeamsRelations = relations(userTeams, ({ one }) => ({
   user: one(users, {
      fields: [userTeams.userId],
      references: [users.id],
   }),
   team: one(teams, {
      fields: [userTeams.teamId],
      references: [teams.id],
   }),
}));

export const teamMembersRelations = relations(teamMembers, ({ one }) => ({
   team: one(teams, {
      fields: [teamMembers.teamId],
      references: [teams.id],
   }),
   user: one(users, {
      fields: [teamMembers.userId],
      references: [users.id],
   }),
}));

export const teamProjectsRelations = relations(teamProjects, ({ one }) => ({
   team: one(teams, {
      fields: [teamProjects.teamId],
      references: [teams.id],
   }),
   project: one(projects, {
      fields: [teamProjects.projectId],
      references: [projects.id],
   }),
}));
