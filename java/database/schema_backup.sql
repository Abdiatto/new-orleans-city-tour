BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS landmarks;
DROP TABLE IF EXISTS districts;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS landmarks_photos;
DROP TABLE IF EXISTS itinerary;
DROP TABLE IF EXISTS landmarks_itinerary; 
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
CREATE TABLE districts(	
	district_id serial primary key,
	district_name varchar(500)
);

CREATE TABLE landmarks(
	landmark_id serial primary key,
	name varchar(260) not null,
	content text,
    address_id  bigint not null,
	status varchar(12) not null,
	district_id bigint not null,
	constraint fk_district_id foreign key (district_id) references districts(district_id),
    constraint fk_address_id foreign key (address_id) references address(address_id) 
	
);

CREATE TABLE reviews(
	review_id serial primary key,
	user_id bigint not null, 
	content text, 
	thumbs_up boolean,
	constraint fk_user_id foreign key (user_id) references users(user_id)
);
CREATE TABLE photos(
	photo_id serial primary key,
	user_id bigint,
	photo_path varchar(300),
	featured boolean not null, 
	constraint fk_user_id foreign key (user_id) references users(user_id)
);
CREATE TABLE landmarks_photos(
	photo_id bigint not null,
	landmark_id bigint not null,
	constraint fk_photo_id foreign key(photo_id) references photos(photo_id),
	constraint fk_landmark_id foreign key(landmark_id) references landmarks(landmark_id),
	constraint pk_landmarks_photos primary key(photo_id,landmark_id)
);
CREATE TABLE itinerary(
	itinerary_id serial primary key,
	user_id bigint not null,
	starting_point varchar(500) not null,
	constraint fk_user_id foreign key (user_id) references users(user_id)
); 

CREATE TABLE landmarks_itinerary(
	itinerary_id bigint not null,
	landmark_id bigint not null,
	constraint fk_landmark_id foreign key(landmark_id) references landmarks(landmark_id),
	constraint fk_itinerary_id foreign key(itinerary_id) references itinerary(itinerary_id),
	constraint pk_landmarks_itinerary primary key(itinerary_id,landmark_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO address (address_line_1, city, state, zipcode) VALUES 
('St Charles Avenue', 'New Orleans', 'LA', 70130),
('615 Pere Antonie Aly', 'New Orleans', 'LA', 70116),
('7 Bamboo Rd', 'New Orleans', 'LA', 70124);
INSERT INTO districts (district_name) VALUES 
('central city'),
('two'),
('three');	

INSERT INTO landmarks(name, address_id, content, status, district_id) VALUES
('Garden District', 1, 'An area of the city that features numerous historic homes.', 'approved', 1),
('St. Louis Cathedral', 2, 'The major landmark of the French Quarter is the oldest continuously active cathedral in the U.S.', 'approved', 2),
('Longue Vue House and Gardens', 3, 'Longue Vue House and Gardens is a multifaceted historic estate featuring a world-class house museum and eight acres of stunning gardens that include an interactive Discovery Garden for children of all ages.', 'approved', 3);
INSERT INTO photos(user_id, photo_path, featured) 
VALUES (2, 'garden_district.jpg', true),
       (2, 'st_louis_catherdal.jpg', true),
       (2, 'longue_vue_house_gardens.jpg', true);
INSERT INTO landmarks_photos(landmark_id, photo_id) 
VALUES (1,1),
       (2,2),
       (3,3);
   
COMMIT TRANSACTION;