CREATE TABLE "users"(
    "id" serial PRIMARY KEY NOT NULL,
    "username" varchar not null,
    "password" varchar not null,
    "email" varchar unique not null,
    "create_at" timestamptz not null default (now())
);

CREATE TABLE "categories"(
    "id" serial PRIMARY KEY NOT NULL,
    "user_id" int not null,
    "title" varchar not null,
    "type" varchar not null,
    "description" varchar not null,
    "create_at" timestamptz not null default (now())
);

ALTER TABLE "categories" ADD FOREIGN KEY("user_id") REFERENCES "users" ("id");

CREATE TABLE "accounts"(
    "id" serial PRIMARY KEY NOT NULL,
    "user_id" int not null,
    "category_id" int not null,
    "title" varchar not null,
    "type" varchar not null,
    "description" varchar not null,
    "value" integer not null,
    "date" date not null,
    "create_at" timestamptz not null default (now())
);

ALTER TABLE "accounts" ADD FOREIGN KEY("user_id") REFERENCES "users" ("id");
ALTER TABLE "accounts" ADD FOREIGN KEY("category_id") REFERENCES "categories" ("id");