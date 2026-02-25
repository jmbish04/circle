import { NextRequest, NextResponse } from 'next/server';
import { getDb } from '@/lib/db/client';
import { issues, issueLabels, users, statuses, priorities, projects } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';

export const runtime = 'edge';

function getCloudflareContext(request: NextRequest) {
  // Access Cloudflare bindings through the request context
  // In OpenNext for Cloudflare, bindings are available in the request context
  return (request as any).ctx?.cloudflare?.env as CloudflareEnv | undefined;
}

export async function GET(request: NextRequest) {
  try {
    const env = getCloudflareContext(request);

    if (!env?.DB) {
      return NextResponse.json(
        { error: 'Database binding not available' },
        { status: 500 }
      );
    }

    const db = getDb(env.DB);

    // Fetch all issues with their relations
    const allIssues = await db
      .select()
      .from(issues)
      .leftJoin(users, eq(issues.assigneeId, users.id))
      .leftJoin(statuses, eq(issues.statusId, statuses.id))
      .leftJoin(priorities, eq(issues.priorityId, priorities.id))
      .leftJoin(projects, eq(issues.projectId, projects.id))
      .all();

    return NextResponse.json({ issues: allIssues });
  } catch (error) {
    console.error('Error fetching issues:', error);
    return NextResponse.json(
      { error: 'Failed to fetch issues' },
      { status: 500 }
    );
  }
}

export async function POST(request: NextRequest) {
  try {
    const env = getCloudflareContext(request);

    if (!env?.DB) {
      return NextResponse.json(
        { error: 'Database binding not available' },
        { status: 500 }
      );
    }

    const db = getDb(env.DB);
    const body = await request.json();

    // Insert the new issue
    const result = await db.insert(issues).values(body).returning();

    return NextResponse.json({ issue: result[0] }, { status: 201 });
  } catch (error) {
    console.error('Error creating issue:', error);
    return NextResponse.json(
      { error: 'Failed to create issue' },
      { status: 500 }
    );
  }
}
