CREATE TABLE todo (
	id SERIAL NOT NULL,
	name CHARACTER VARYING(100) NOT NULL,
	description CHARACTER VARYING(100) NOT NULL,
	state INTEGER NOT NULL,
	deadline DATE,
	CONSTRAINT PK_TODO_ID PRIMARY KEY (id)
);

ALTER TABLE todo OWNER TO postgres;

CREATE UNIQUE INDEX UI_TODO_NAME ON todo USING btree (name);

CREATE TABLE sub_todo (
	id SERIAL NOT NULL,
	todo_id INTEGER NOT NULL,
	name CHARACTER VARYING(100) NOT NULL,
	description CHARACTER VARYING(100) NOT NULL,
	state INTEGER NOT NULL,
	CONSTRAINT PK_SUB_TODO_ID PRIMARY KEY (id),
	CONSTRAINT FK_SUB_TODO_TODO_ID FOREIGN KEY (todo_id)
	  REFERENCES todo (id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE RESTRICT
);

ALTER TABLE sub_todo OWNER TO postgres;

CREATE UNIQUE INDEX UI_SUB_TODO_NAME ON sub_todo USING btree (name);

CREATE TABLE priority (
	id SERIAL NOT NULL,
	name CHARACTER VARYING(100) NOT NULL,
	priority_value INTEGER NOT NULL,
	CONSTRAINT PK_PRIORITY_ID PRIMARY KEY (id)
);

ALTER TABLE priority OWNER TO postgres;

CREATE UNIQUE INDEX UI_PRIORITY_NAME ON priority USING btree (name);

CREATE TABLE category (
	id SERIAL NOT NULL,
	name CHARACTER VARYING(100) NOT NULL,
	description CHARACTER VARYING(100) NOT NULL,
	CONSTRAINT PK_CATEGORY_ID PRIMARY KEY (id)
);

ALTER TABLE category OWNER TO postgres;

CREATE UNIQUE INDEX UI_CATEGORY_NAME ON category USING btree (name);

CREATE TABLE priority_to_todo (
	id INTEGER NOT NULL,
	priority_id INTEGER NOT NULL,
	todo_id INTEGER NOT NULL,
	CONSTRAINT PK_PRIORITY_TO_TODO_ID PRIMARY KEY (id),
	CONSTRAINT FK_PRIORITY_TO_TODO_PRIORITY_ID FOREIGN KEY (priority_id)
	  REFERENCES priority (id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_PRIORITY_TO_TODO_TODO_ID FOREIGN KEY (todo_id)
	  REFERENCES todo (id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE RESTRICT
);

ALTER TABLE priority_to_todo OWNER TO postgres;

CREATE TABLE category_to_todo (
	id INTEGER NOT NULL,
	category_id INTEGER NOT NULL,
	todo_id INTEGER NOT NULL,
	CONSTRAINT PK_CATEGORY_TO_TODO_ID PRIMARY KEY (id),
	CONSTRAINT FK_CATEGORY_TO_TODO_CATEGORY_ID FOREIGN KEY (category_id)
	  REFERENCES category (id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_CATEGORY_TO_TODO_TODO_ID FOREIGN KEY (todo_id)
	  REFERENCES todo (id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE RESTRICT
);

ALTER TABLE category_to_todo OWNER TO postgres;