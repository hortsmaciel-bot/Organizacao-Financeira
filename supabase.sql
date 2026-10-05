-- Painel Bolso: rode este arquivo UMA vez no Supabase (SQL Editor > New query > Run)

create table if not exists public.docs (
  user_id    uuid        not null references auth.users(id) on delete cascade,
  collection text        not null,
  id         text        not null,
  data       jsonb       not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, collection, id)
);

-- Cada pessoa só enxerga e altera as PRÓPRIAS linhas.
alter table public.docs enable row level security;

drop policy if exists "docs: dono acessa tudo dele" on public.docs;
create policy "docs: dono acessa tudo dele"
  on public.docs
  for all
  to authenticated
  using      (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Sincronização ao vivo entre celular e computador
do $$
begin
  alter publication supabase_realtime add table public.docs;
exception when duplicate_object then null;
end $$;
