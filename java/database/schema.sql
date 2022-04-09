BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS landmark;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE address (
    address_id serial primary key,
    address_line_1 varchar(255) not null,
    address_line_2 varchar(255),
	city varchar(50) not null,
	state varchar(2) not null,
	zipcode int not null
);


CREATE TABLE landmark(
	landmark_id serial primary key,
	name varchar(260) not null,
	description text,
    address_id  bigint not null,

    constraint fk_address_id foreign key (address_id) references address(address_id)  
);


INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO address (address_line_1, city, state, zipcode) VALUES 
('St Charles Avenue', 'New Orleans', 'LA', 70130),
('615 Pere Antonie Aly', 'New Orleans', 'LA', 70116),
('7 Bamboo Rd', 'New Orleans', 'LA', 70124);

INSERT INTO landmark(name, address_id, description) VALUES
('Garden District', 1, 'An area of the city that features numerous historic homes.'),
('St. Louis Cathedral', 2, 'The major landmark of the French Quarter is the oldest continuously active cathedral in the U.S.'),
('Longue Vue House and Gardens', 3, 'Longue Vue House and Gardens is a multifaceted historic estate featuring a world-class house museum and eight acres of stunning gardens that include an interactive Discovery Garden for children of all ages.');

COMMIT TRANSACTION;
