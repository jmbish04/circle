# Database Setup

This project uses Cloudflare D1 (SQLite) with Drizzle ORM for data persistence.

## Prerequisites

- Cloudflare account with Wrangler CLI configured
- D1 database created in Cloudflare

## Database Configuration

The D1 database binding is configured in `wrangler.jsonc`:

```jsonc
"d1_databases": [
  {
    "binding": "DB",
    "database_name": "circle-db",
    "database_id": "placeholder",
    "migrations_dir": "migrations"
  }
]
```

## Creating the D1 Database

Before running migrations, create the D1 database:

```bash
# Create a new D1 database
npx wrangler d1 create circle-db

# Copy the database_id from the output and update wrangler.jsonc
```

## Available Scripts

### Generate Migrations

Generate migration files from the Drizzle schema:

```bash
npm run db:generate
```

### Apply Migrations

Apply migrations to local or remote database:

```bash
# Local development
npm run db:migrate:local

# Remote/production
npm run db:migrate:remote
```

### Seed Database

Populate the database with initial data:

```bash
# Local development
npm run db:seed:local

# Remote/production
npm run db:seed:remote
```

### Deploy

Build, migrate, and deploy to Cloudflare Workers:

```bash
npm run deploy
```

This will:
1. Build the Next.js application
2. Generate and apply migrations to remote D1
3. Deploy to Cloudflare Workers

## Schema

The database schema is defined in `lib/db/schema.ts` and includes:

- **users** - User accounts
- **teams** - Teams/groups
- **projects** - Projects with status, priority, and health tracking
- **issues** - Tasks/issues with assignees, labels, and sub-issues
- **labels** - Issue labels
- **priorities** - Priority levels
- **statuses** - Issue/project statuses
- **health** - Project health indicators
- **cycles** - Sprint/cycle tracking

## Development Workflow

1. **Modify schema** in `lib/db/schema.ts`
2. **Generate migration**: `npm run db:generate`
3. **Apply locally**: `npm run db:migrate:local`
4. **Test changes** with local development
5. **Apply remotely**: `npm run db:migrate:remote` (or use `npm run deploy`)

## Drizzle Studio

To explore your database with a visual interface:

```bash
npx drizzle-kit studio
```

## Notes

- The `migrations` directory contains auto-generated SQL migration files
- Never edit migration files directly - always modify the schema and regenerate
- The `seed.sql` file contains initial data for development
- All database operations use Drizzle ORM - see `lib/db/` for utilities
