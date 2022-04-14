BEGIN TRANSACTION;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS landmarks_photos;
DROP TABLE IF EXISTS landmarks_itinerary; 
DROP TABLE IF EXISTS landmarks;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS itinerary;
DROP TABLE IF EXISTS districts;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS users;
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
CREATE TABLE itinerary(
	itinerary_id serial primary key,
	user_id bigint not null,
	starting_point varchar(500) not null,
	active boolean DEFAULT 'true',
	constraint fk_user_id foreign key (user_id) references users(user_id)
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


CREATE TABLE landmarks_itinerary(
	itinerary_id bigint not null,
	landmark_id bigint not null,
	constraint fk_landmark_id foreign key(landmark_id) references landmarks(landmark_id),
	constraint fk_itinerary_id foreign key(itinerary_id) references itinerary(itinerary_id),
	constraint pk_landmarks_itinerary primary key(itinerary_id,landmark_id)
);



INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO itinerary(itinerary_id, user_id, starting_point, active) VALUES(DEFAULT, 1, '1 Terminal Dr, Kenner, LA 70062', DEFAULT);
INSERT INTO itinerary(itinerary_id, user_id, starting_point, active) VALUES(DEFAULT, 2, '221 Camp St, New Orleans, LA 70130', DEFAULT);

INSERT INTO address(address_id, address_line_1, city, state, zipcode) VALUES(DEFAULT, '123street','new orleans', 'La', 12345);
INSERT INTO districts(district_id,district_name) VALUES (DEFAULT, 'districtTest');
INSERT INTO landmarks(landmark_id, name,content,address_id, status, district_id) VALUES(DEFAULT, 'TEST 1', 'TEST INFO', 1, 'approved', 1);
INSERT INTO landmarks_itinerary(itinerary_id, landmark_id) VALUES (1,1);
INSERT INTO landmarks_itinerary(itinerary_id, landmark_id) VALUES (2,1);


INSERT INTO districts (district_name) VALUES 
('French Quarter'),
('Uptown'),
('Treme'),
('Arts/Warehouse'),
('Marigny/Bywater'),
('Downtown'),
('Mid-City'),
('Algiers'),
('Esplanade Ridge'),
('Lakeview'),
('Gentilly'),
('Metairie/Kenner'),
('Westbank');	

   
COMMIT TRANSACTION;