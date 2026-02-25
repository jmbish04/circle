# Circle

<br />
<a href="https://vercel.com/oss">
  <img alt="Vercel OSS Program" src="https://vercel.com/oss/program-badge.svg" />
</a>

<br />
<br />

Project management interface inspired by Linear. Built with Next.js and shadcn/ui, this application allows tracking of issues, projects and teams with a modern, responsive UI.

> The BaseUI code is available on [Square UI Pro](https://pro.lndev.me/templates).

## 🛠️ Technologies

- **Framework**: [Next.js](https://nextjs.org/)
- **Language**: [TypeScript](https://www.typescriptlang.org/)
- **UI Components**: [shadcn/ui](https://ui.shadcn.com/)
- **Styling**: [Tailwind CSS](https://tailwindcss.com/)
- **Database**: [Cloudflare D1](https://developers.cloudflare.com/d1/) (SQLite)
- **ORM**: [Drizzle ORM](https://orm.drizzle.team/)
- **Deployment**: [Cloudflare Workers/Pages](https://developers.cloudflare.com/workers/)

## 📦 Installation

```shell
git clone https://github.com/ln-dev7/circle.git
cd circle
```

## 🚀 Getting Started

### Install dependencies

```shell
npm install
# or
pnpm install
```

### Start the development server

```shell
npm run dev
# or
pnpm dev
```

## 🗄️ Database Setup

This app uses Cloudflare D1 (SQLite) with Drizzle ORM for data persistence.

### Create D1 Database

First, create a D1 database in your Cloudflare account:

```shell
npx wrangler d1 create circle-db
```

Copy the `database_id` from the output and update it in `wrangler.jsonc`:

```jsonc
"d1_databases": [
  {
    "binding": "DB",
    "database_name": "circle-db",
    "database_id": "YOUR_DATABASE_ID_HERE",
    "migrations_dir": "migrations"
  }
]
```

### Run Migrations

Apply database migrations:

```shell
# For local development
npm run db:migrate:local

# For production
npm run db:migrate:remote
```

### Seed the Database

Populate with initial data:

```shell
# For local development
npm run db:seed:local

# For production
npm run db:seed:remote
```

For more detailed database documentation, see [lib/db/README.md](lib/db/README.md).

## ☁️ Cloudflare Deployment

This app is configured to run on Cloudflare Workers/Pages using the [@opennextjs/cloudflare](https://www.npmjs.com/package/@opennextjs/cloudflare) adapter.

### Preview locally with Cloudflare runtime

```shell
npm run preview
```

This command builds your app and serves it locally using the Workers runtime.

### Deploy to Cloudflare

```shell
npm run deploy
```

This command builds and deploys your app to Cloudflare Workers. Make sure you have [Wrangler](https://developers.cloudflare.com/workers/wrangler/) configured with your Cloudflare account.

### Configuration

The app includes the following Cloudflare-specific configurations:

- `wrangler.jsonc` - Cloudflare Workers configuration
- `open-next.config.ts` - OpenNext adapter configuration
- `.gitignore` - Excludes `.open-next/`, `.wrangler/`, and `cloudflare-env.d.ts`

For more information about deploying Next.js to Cloudflare, see the [official documentation](https://developers.cloudflare.com/workers/framework-guides/web-apps/nextjs/).

## Star History

<a href="https://www.star-history.com/#ln-dev7/circle&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=ln-dev7/circle&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=ln-dev7/circle&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=ln-dev7/circle&type=Date" />
 </picture>
</a>
