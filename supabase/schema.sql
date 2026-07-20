-- Void Runner: Supabase 스키마
-- Supabase Dashboard > SQL Editor 에서 1회 실행하세요.

create table public.leaderboard (
  id uuid primary key default gen_random_uuid(),
  player_name text not null check (char_length(player_name) between 1 and 20),
  score integer not null check (score >= 0 and score < 10000000),
  created_at timestamptz not null default now()
);
alter table public.leaderboard enable row level security;
create policy "leaderboard_public_read" on public.leaderboard for select using (true);
create policy "leaderboard_public_insert" on public.leaderboard for insert with check (true);

create table public.cloud_saves (
  user_id uuid primary key references auth.users(id) on delete cascade,
  ship_id text not null default 'interceptor',
  best_score integer not null default 0,
  contact_count integer not null default 0,
  colonies jsonb not null default '[]',
  resources jsonb not null default '{"rawScrap":0,"refinedAlloy":0,"dataCore":0}',
  updated_at timestamptz not null default now()
);
alter table public.cloud_saves enable row level security;
create policy "cloud_saves_owner_select" on public.cloud_saves for select using (auth.uid() = user_id);
create policy "cloud_saves_owner_insert" on public.cloud_saves for insert with check (auth.uid() = user_id);
create policy "cloud_saves_owner_update" on public.cloud_saves for update using (auth.uid() = user_id);
