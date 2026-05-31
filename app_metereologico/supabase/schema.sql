create table weather_history (

  id bigint generated always as identity,

  city text not null,

  latitude double precision,

  longitude double precision,

  temperature double precision,

  humidity double precision,

  precipitation double precision,

  weather_condition text,

  created_at timestamptz
  default now(),

  primary key(id)
);

alter table weather_history
enable row level security;

create policy "public_select"
on weather_history
for select
using (true);

create policy "public_insert"
on weather_history
for insert
with check (true);