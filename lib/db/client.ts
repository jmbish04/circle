import { drizzle } from 'drizzle-orm/d1';
import * as schema from './schema';

type DbBinding = Parameters<typeof drizzle>[0];

export function getDb(binding: DbBinding) {
   return drizzle(binding, { schema });
}

export type DbClient = ReturnType<typeof getDb>;
