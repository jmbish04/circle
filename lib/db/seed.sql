/**
 * Seed script to populate D1 database with initial data
 *
 * This script uses the existing mock data to seed the database.
 * Run this after migrations have been applied.
 *
 * Usage:
 *   npx wrangler d1 execute DB --local --file=./lib/db/seed.sql
 *   or
 *   npx wrangler d1 execute DB --remote --file=./lib/db/seed.sql
 */

-- Insert statuses
INSERT INTO statuses (id, name, color) VALUES
  ('backlog', 'Backlog', '#bec2c8'),
  ('todo', 'Todo', '#0ea5e9'),
  ('in-progress', 'In Progress', '#f59e0b'),
  ('in-review', 'In Review', '#8b5cf6'),
  ('done', 'Done', '#10b981'),
  ('canceled', 'Canceled', '#6b7280');

-- Insert priorities
INSERT INTO priorities (id, name, color) VALUES
  ('no-priority', 'No Priority', '#9CA3AF'),
  ('urgent', 'Urgent', '#F87171'),
  ('high', 'High', '#FBBF24'),
  ('medium', 'Medium', '#60A5FA'),
  ('low', 'Low', '#A3A3A3');

-- Insert health statuses
INSERT INTO health (id, name, color, description) VALUES
  ('no-update', 'No Update', '#FF0000', 'The project has not been updated in the last 30 days.'),
  ('off-track', 'Off Track', '#FF0000', 'The project is not on track and may be delayed.'),
  ('on-track', 'On Track', '#00FF00', 'The project is on track and on schedule.'),
  ('at-risk', 'At Risk', '#FF0000', 'The project is at risk and may be delayed.');

-- Insert labels
INSERT INTO labels (id, name, color) VALUES
  ('ui', 'UI Enhancement', 'purple'),
  ('bug', 'Bug', 'red'),
  ('feature', 'Feature', 'green'),
  ('documentation', 'Documentation', 'blue'),
  ('refactor', 'Refactor', 'yellow'),
  ('performance', 'Performance', 'orange'),
  ('design', 'Design', 'pink'),
  ('security', 'Security', 'gray'),
  ('accessibility', 'Accessibility', 'indigo'),
  ('testing', 'Testing', 'teal'),
  ('internationalization', 'Internationalization', 'cyan');

-- Insert users
INSERT INTO users (id, name, avatar_url, email, status, role, joined_date) VALUES
  ('ln', 'leonel.ngoya', 'https://api.dicebear.com/9.x/glass/svg?seed=ln', 'leonelngoya@gmail.com', 'online', 'Admin', '2022-01-01'),
  ('sophia', 'sophia.reed', 'https://api.dicebear.com/9.x/glass/svg?seed=sophiareed', 'sophiareed@gmail.com', 'offline', 'Admin', '2023-06-04'),
  ('mason', 'mason.carter', 'https://api.dicebear.com/9.x/glass/svg?seed=mason', 'masoncarter@gmail.com', 'away', 'Member', '2023-11-01'),
  ('emma', 'emma.jones', 'https://api.dicebear.com/9.x/glass/svg?seed=emmajones', 'emmajones@gmail.com', 'online', 'Member', '2023-03-20'),
  ('alex', 'alex.zhang', 'https://api.dicebear.com/9.x/glass/svg?seed=alexzhang', 'alexzhang@gmail.com', 'online', 'Member', '2023-05-15'),
  ('olivia', 'olivia.wilson', 'https://api.dicebear.com/9.x/glass/svg?seed=oliviawilson', 'oliviawilson@gmail.com', 'offline', 'Admin', '2022-08-22'),
  ('lucas', 'lucas.martin', 'https://api.dicebear.com/9.x/glass/svg?seed=lucasmartin', 'lucasmartin@gmail.com', 'away', 'Member', '2023-02-14'),
  ('isabella', 'isabella.garcia', 'https://api.dicebear.com/9.x/glass/svg?seed=isabellagarcia', 'isabellagarcia@gmail.com', 'online', 'Member', '2022-11-30'),
  ('ethan', 'ethan.brown', 'https://api.dicebear.com/9.x/glass/svg?seed=ethanbrown', 'ethanbrown@gmail.com', 'offline', 'Member', '2023-07-18'),
  ('amelia', 'amelia.kim', 'https://api.dicebear.com/9.x/glass/svg?seed=ameliakim', 'ameliakim@gmail.com', 'online', 'Guest', '2022-05-09'),
  ('noah', 'noah.davis', 'https://api.dicebear.com/9.x/glass/svg?seed=noahdavis', 'noahdavis@gmail.com', 'away', 'Member', '2023-09-27'),
  ('charlotte', 'charlotte.miller', 'https://api.dicebear.com/9.x/glass/svg?seed=charlottemiller', 'charlottemiller@gmail.com', 'online', 'Guest', '2022-04-03'),
  ('aiden', 'aiden.thompson', 'https://api.dicebear.com/9.x/glass/svg?seed=aidenthompson', 'aidenthompson@gmail.com', 'offline', 'Admin', '2023-01-12'),
  ('mia', 'mia.patel', 'https://api.dicebear.com/9.x/glass/svg?seed=miapatel', 'miapatel@gmail.com', 'online', 'Member', '2022-10-05'),
  ('logan', 'logan.wright', 'https://api.dicebear.com/9.x/glass/svg?seed=loganwright', 'loganwright@gmail.com', 'away', 'Guest', '2023-08-14'),
  ('harper', 'harper.robinson', 'https://api.dicebear.com/9.x/glass/svg?seed=harperrobinson', 'harperrobinson@gmail.com', 'offline', 'Member', '2022-07-29'),
  ('gabriel', 'gabriel.nguyen', 'https://api.dicebear.com/9.x/glass/svg?seed=gabrielnguyen', 'gabrielnguyen@gmail.com', 'online', 'Member', '2023-04-17'),
  ('victoria', 'victoria.lee', 'https://api.dicebear.com/9.x/glass/svg?seed=victorialee', 'victorialee@gmail.com', 'away', 'Guest', '2022-12-08'),
  ('daniel', 'daniel.taylor', 'https://api.dicebear.com/9.x/glass/svg?seed=danieltaylor', 'danieltaylor@gmail.com', 'offline', 'Member', '2023-10-21'),
  ('abigail', 'abigail.moore', 'https://api.dicebear.com/9.x/glass/svg?seed=abigailmoore', 'abigailmoore@gmail.com', 'online', 'Member', '2022-06-17');

-- Insert teams
INSERT INTO teams (id, name, icon, joined, color) VALUES
  ('CORE', 'LNDev Core', '🛠️', 1, '#FF0000'),
  ('DESIGN', 'Design System', '🎨', 1, '#00FF00'),
  ('PERF', 'Performance Lab', '☀️', 0, '#0000FF'),
  ('UX', 'UX Team', '👨🏼‍🎨', 0, '#FF00FF'),
  ('DATA', 'Data Science', '📊', 0, '#0000FF'),
  ('MOBILE', 'Mobile Development', '📱', 0, '#0000FF'),
  ('WEB', 'Web Development', '🌐', 1, '#0000FF'),
  ('UI', 'UI Team', '👨🏼‍🎨', 0, '#FF00FF'),
  ('CLOUD', 'Cloud Infrastructure', '☁️', 0, '#4A90E2'),
  ('SECURITY', 'Security Team', '🔒', 0, '#2E2E2E'),
  ('AI', 'AI Research', '🧠', 1, '#9B59B6'),
  ('QA', 'Quality Assurance', '✅', 0, '#F1C40F'),
  ('DEVOPS', 'DevOps', '⚙️', 0, '#E67E22'),
  ('FRONTEND', 'Frontend Experts', '🖥️', 0, '#1ABC9C'),
  ('BACKEND', 'Backend Engineers', '🗄️', 0, '#34495E'),
  ('PRODUCT', 'Product', '📋', 0, '#C0392B'),
  ('ANALYTICS', 'Analytics Team', '📈', 0, '#7F8C8D'),
  ('INNO', 'Innovation Lab', '💡', 0, '#F39C12'),
  ('API', 'API Development', '🔌', 0, '#16A085'),
  ('UXR', 'UX Research', '🔍', 0, '#8E44AD');

-- Insert projects
INSERT INTO projects (id, name, status_id, icon_name, percent_complete, start_date, lead_id, priority_id, health_id) VALUES
  ('1', 'LNDev UI - Core Components', 'backlog', 'Cuboid', 80, '2025-03-08', 'mason', 'high', 'no-update'),
  ('2', 'LNDev UI - Theming', 'todo', 'Blocks', 50, '2025-03-14', 'ln', 'urgent', 'at-risk'),
  ('3', 'LNDev UI - Modals', 'in-progress', 'Vault', 0, '2025-03-09', 'sophia', 'medium', 'off-track'),
  ('4', 'LNDev UI - Navigation', 'in-review', 'BrickWall', 0, '2025-03-10', 'mason', 'urgent', 'on-track'),
  ('5', 'LNDev UI - Layout', 'done', 'Wallpaper', 0, '2025-03-11', 'ln', 'urgent', 'at-risk'),
  ('6', 'LNDev UI - Sidebar', 'canceled', 'TrafficCone', 0, '2025-03-12', 'sophia', 'urgent', 'off-track');

-- Insert cycles
INSERT INTO cycles (id, number, name, team_id, start_date, end_date, progress) VALUES
  ('42', 42, 'Sprint 42 - Pixel Perfect', 'design-system', '2025-03-10', '2025-03-24', 80),
  ('43', 43, 'Sprint 43 - Performance Boost', 'performance-lab', '2025-03-10', '2025-03-24', 50),
  ('44', 44, 'Sprint 44 - Core Enhancements', 'lndev-core', '2025-03-10', '2025-03-24', 0);

-- Insert sample issues (from the mock data)
INSERT INTO issues (id, identifier, title, description, status_id, assignee_id, priority_id, created_at, cycle_id, project_id, rank, due_date) VALUES
  ('1', 'LNUI-101', 'Refactor Button component for full accessibility compliance', '', 'canceled', 'ln', 'medium', '2025-03-08', '42', '1', 'a3c', NULL),
  ('2', 'LNUI-102', 'Migrate legacy components to shadcn architecture', '', 'in-progress', 'sophia', 'high', '2025-03-08', '42', '1', 'a3d', NULL),
  ('3', 'LNUI-103', 'Add dark mode support to all form elements', '', 'todo', 'mason', 'medium', '2025-03-08', '42', '1', 'a3e', NULL);

-- Insert user-team relationships
INSERT INTO user_teams (user_id, team_id) VALUES
  ('ln', 'CORE'),
  ('ln', 'PERF'),
  ('ln', 'DESIGN'),
  ('ln', 'WEB'),
  ('sophia', 'CORE'),
  ('sophia', 'PERF'),
  ('mason', 'CORE'),
  ('mason', 'DESIGN'),
  ('emma', 'CORE');

-- Insert team members (for teams)
INSERT INTO team_members (team_id, user_id) VALUES
  ('CORE', 'ethan'),
  ('CORE', 'charlotte'),
  ('CORE', 'mason'),
  ('CORE', 'emma'),
  ('CORE', 'alex'),
  ('DESIGN', 'isabella'),
  ('DESIGN', 'emma');

-- Insert issue labels
INSERT INTO issue_labels (issue_id, label_id) VALUES
  ('1', 'ui'),
  ('2', 'refactor'),
  ('3', 'feature');
