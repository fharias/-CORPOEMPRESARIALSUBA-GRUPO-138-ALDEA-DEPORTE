CREATE TABLE localities (
	id int NOT NULL,
	description varchar(100) NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT localities_pkey PRIMARY KEY (id)
);

CREATE UNIQUE INDEX index_localities_on_description ON localities(description);

CREATE TABLE sport_categories (
	id int NOT NULL,
	description varchar(50) NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT sport_categories_pkey PRIMARY KEY (id)
);

CREATE UNIQUE INDEX index_sport_categories_on_description ON sport_categories(description);

CREATE TABLE headquarters (
	id int NOT NULL,
	description varchar(255) NOT NULL,
	status varchar(50) NOT NULL,
	address varchar(255) NOT NULL,
	latitude varchar(45) NOT NULL,
	longitude varchar(45) NOT NULL,
	localities_id int NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT headquarters_pkey PRIMARY KEY (id),
	CONSTRAINT fk_rails_44119033c6 FOREIGN KEY (localities_id) REFERENCES localities(id)
);

CREATE UNIQUE INDEX index_headquarters_on_description ON headquarters(description);
CREATE INDEX index_headquarters_on_localities_id ON headquarters(localities_id);

CREATE TABLE images (
	id int NOT NULL,
	description varchar(100) NOT NULL,
	url varchar(255) NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT images_pkey PRIMARY KEY (id)
);

CREATE TABLE users (
	id int NOT NULL,
	user_name varchar(20) NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	birthday date NOT NULL,
	phone varchar(50) NULL,
	document_type varchar(30) NULL,
	document varchar(20) NULL,
	document_file varchar(50) NULL,
	photo varchar(50) NULL,
	email varchar(50) NOT NULL,
	encrypted_password varchar(100) NOT NULL,
	reset_password_token varchar(100) NULL,
	reset_password_sent_at timestamp NULL,
	remember_created_at timestamp NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE UNIQUE INDEX index_users_on_document ON users(document);
CREATE UNIQUE INDEX index_users_on_email ON users(email);
CREATE UNIQUE INDEX index_users_on_reset_password_token ON users(reset_password_token);
CREATE UNIQUE INDEX index_users_on_user_name ON users(user_name);

CREATE TABLE events (
	id int NOT NULL,
	description varchar(255) NOT NULL,
	date date NOT NULL,
	age_limit varchar(50) NOT NULL,
	status varchar(50) NOT NULL,
	user_id int NOT NULL,
	headquarter_id int NOT NULL,
	sport_category_id int NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT events_pkey PRIMARY KEY (id),
	CONSTRAINT fk_rails_0cb5590091 FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT fk_rails_0d3b3b15f2 FOREIGN KEY (sport_category_id) REFERENCES sport_categories(id),
	CONSTRAINT fk_rails_d2ffdc7dd8 FOREIGN KEY (headquarter_id) REFERENCES headquarters(id)
);

CREATE INDEX index_events_on_headquarter_id ON events(headquarter_id);
CREATE INDEX index_events_on_sport_category_id ON events(sport_category_id);
CREATE INDEX index_events_on_user_id ON events(user_id);

CREATE TABLE images_events (
	id int NOT NULL,
	image_id int NOT NULL,
	event_id int NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT images_events_pkey PRIMARY KEY (id),
	CONSTRAINT fk_rails_4361fe1e9e FOREIGN KEY (event_id) REFERENCES events(id),
	CONSTRAINT fk_rails_c6523f0bcf FOREIGN KEY (image_id) REFERENCES images(id)
);

CREATE INDEX index_images_events_on_event_id ON images_events(event_id);
CREATE INDEX index_images_events_on_image_id ON images_events(image_id);

CREATE TABLE images_headquarters (
	id int NOT NULL,
	image_id int NOT NULL,
	headquarter_id int NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT images_headquarters_pkey PRIMARY KEY (id),
	CONSTRAINT fk_rails_88ab3a092e FOREIGN KEY (image_id) REFERENCES images(id),
	CONSTRAINT fk_rails_a6eea2d999 FOREIGN KEY (headquarter_id) REFERENCES headquarters(id)
);

CREATE INDEX index_images_headquarters_on_headquarter_id ON images_headquarters(headquarter_id);
CREATE INDEX index_images_headquarters_on_image_id ON images_headquarters(image_id);

CREATE TABLE roles (
	id int NOT NULL,
	name varchar(45) NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT roles_pkey PRIMARY KEY (id)
);

CREATE UNIQUE INDEX index_roles_on_name ON roles(name);

CREATE TABLE users_roles (
	id int NOT NULL,
	user_id int NOT NULL,
	role_id int NOT NULL,
	created_at timestamp NOT NULL,
	updated_at timestamp NOT NULL,
	CONSTRAINT users_roles_pkey PRIMARY KEY (id),
	CONSTRAINT fk_rails_4a41696df6 FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT fk_rails_eb7b4658f8 FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE INDEX index_users_roles_on_role_id ON users_roles(role_id);
CREATE INDEX index_users_roles_on_user_id ON users_roles(user_id);
