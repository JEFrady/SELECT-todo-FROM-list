
DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;

/* SKIP CONNECT TO A DATABASE */

CREATE TABLE tasks(
	id SERIAL primary key,
	title varchar(255) NOT NULL,
	description text,
	created_at timestamp without time zone NOT NULL DEFAULT now(),
	updated_at timestamp without time zone,
	completed boolean NOT NULL DEFAULT false
	);

ALTER TABLE tasks DROP completed;

ALTER TABLE tasks ADD completed_at timestamp without time zone DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET DATA TYPE timestamp without time zone, ALTER COLUMN updated_at SET NOT NULL, ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at) VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');

UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT * FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY date(created_At) DESC;

INSERT INTO tasks (title, description) VALUES ('mistake 1','a test entry');

INSERT INTO tasks (title, description) VALUES ('mistake 2','another test entry');

INSERT INTO tasks (title, description) VALUES ('third mistake','another test entry');

SELECT * FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title asc;