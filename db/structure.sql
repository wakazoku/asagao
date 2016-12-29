CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "members" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "number" integer NOT NULL, "name" varchar NOT NULL, "full_name" varchar, "email" varchar, "birthday" date, "gender" integer DEFAULT 0 NOT NULL, "administrator" boolean DEFAULT 'f' NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "hashed_password" varchar);
CREATE TABLE "articles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar NOT NULL, "body" text NOT NULL, "released_at" datetime NOT NULL, "expired_at" datetime, "member_only" boolean DEFAULT 'f' NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "entries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer NOT NULL, "title" varchar NOT NULL, "body" text, "posted_at" datetime NOT NULL, "status" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_entries_on_member_id" ON "entries" ("member_id");
CREATE TABLE "member_images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer NOT NULL, "data" blob, "content_type" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_member_images_on_member_id" ON "member_images" ("member_id");
INSERT INTO schema_migrations (version) VALUES ('20160823093044');

INSERT INTO schema_migrations (version) VALUES ('20161003135120');

INSERT INTO schema_migrations (version) VALUES ('20161102184614');

INSERT INTO schema_migrations (version) VALUES ('20161205100355');

INSERT INTO schema_migrations (version) VALUES ('20161229193551');

