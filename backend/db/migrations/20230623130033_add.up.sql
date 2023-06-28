CREATE TABLE IF NOT EXISTS "users" (
    "id" bigserial primary key,
    "username" varchar not null,
    "email" varchar not null ,
    "password" varchar not null
);
commit;