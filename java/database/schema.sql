
BEGIN TRANSACTION;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS landmarks_photos;
DROP TABLE IF EXISTS landmarks_itinerary; 
DROP TABLE IF EXISTS landmarks;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS itineraries;
DROP TABLE IF EXISTS districts;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS itinerary;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
CREATE SEQUENCE seq_order_column
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
	active boolean DEFAULT 'true',
	constraint fk_user_id foreign key (user_id) references users(user_id)
	
); 
CREATE TABLE itineraries(
    user_id bigint NOT NULL,
    storage jsonb,
    CONSTRAINT itineraries_pkey PRIMARY KEY (user_id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
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
	order_column bigint DEFAULT nextval('seq_order_column'::regclass) NOT NULL,
	constraint fk_landmark_id foreign key(landmark_id) references landmarks(landmark_id),
	constraint fk_itinerary_id foreign key(itinerary_id) references itinerary(itinerary_id),
	constraint pk_landmarks_itinerary primary key(itinerary_id,landmark_id)
	

);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (1, '1751 Gentilly Blvd', '', 'New Orleans', 'LA', 70119);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (2, '1436 Oretha Castle Haley Blvd', '', 'New Orleans', 'LA', 70113);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (3, '945 Magazine St', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (4, '1440 Moss St', '', 'New Orleans', 'LA', 70119);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (5, '8001 Lakeshore Dr.', '', 'New Orleans', 'LA', 70124);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (6, '1418 Governor Nicholls St', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (7, '500 Chartres St', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (8, '400 Esplanade Ave', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (9, '701 Chartres St.', '', 'New Orleans', 'LA', 70116);
SELECT pg_catalog.setval('public.districts_district_id_seq', 13, true);
INSERT INTO public.districts (district_id, district_name) VALUES (1, 'French Quarter');
INSERT INTO public.districts (district_id, district_name) VALUES (2, 'Uptown');
INSERT INTO public.districts (district_id, district_name) VALUES (3, 'Treme');
INSERT INTO public.districts (district_id, district_name) VALUES (4, 'Arts/Warehouse');
INSERT INTO public.districts (district_id, district_name) VALUES (5, 'Marigny/Bywater');
INSERT INTO public.districts (district_id, district_name) VALUES (6, 'Downtown');
INSERT INTO public.districts (district_id, district_name) VALUES (7, 'Mid-City');
INSERT INTO public.districts (district_id, district_name) VALUES (8, 'Algiers');
INSERT INTO public.districts (district_id, district_name) VALUES (9, 'Esplanade Ridge');
INSERT INTO public.districts (district_id, district_name) VALUES (10, 'Lakeview');
INSERT INTO public.districts (district_id, district_name) VALUES (11, 'Gentilly');
INSERT INTO public.districts (district_id, district_name) VALUES (12, 'Metairie/Kenner');
INSERT INTO public.districts (district_id, district_name) VALUES (13, 'Westbank');
SELECT pg_catalog.setval('public.districts_district_id_seq', 13, true);
INSERT INTO public.itineraries (user_id, storage) VALUES (1, '[{"name": "Trip1", "landmarks": [8, 9, 2, 3], "itineraryId": 1650049453489}]');

INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (2, 'New Orleans Jazz Market', 'The New Orleans Jazz Market is located in Central City at the intersection of Oretha Castle Haley and Martin Luther King Boulevards in the former Gators Department Store building, which once housed the historic Dryades Market.', 2, 'approved', 6);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (3, 'The National WWII Museum', 'Frequently honored as a top museum in the country, the National WWII Museum is a must on any traveler’s list. Telling the story of the American experience during the war, the museum is home to both special and traveling exhibits, a variety of events and a 4D theater experience. The expansive campus includes a hotel and multiple restaurants. Since its opening day on D-Day – June 6, 2000 – nearly two million visitors have toured the National WWII Museum. A must-see for history lovers and all patriots, it has been designated by the U.S. Congress as America’s official WWII Museum.', 3, 'approved', 6);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (4, 'The Pitot House Museum', 'Built in 1799 by Spanish merchant and shipowner, Bartholome Bosque, during the Spanish Colonial Period, The Pitot House has witnessed centuries of cultural history. Eleven families occupied the house; Missionary Sisters of the Sacred Heart used the home for a convent, and preservationists have cherished the building for its architectural beauty and historical significance.', 4, 'approved', 7);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (1, 'Fair Grounds Race Course', 'Fair Grounds Race Course & Slots, the nation’s third-oldest racetrack, has been in operation since 1872. Located in New Orleans, Fair Grounds operates a slot-machine gaming facility and 15 off-track betting parlors throughout southeast Louisiana. Live racing from November through March. Also operating thirteen off-track-betting facilities open year-round. Private events for 50 to 5,000 in our grandstand/clubhouse facility. Open Daily from 9 am-Midnight.', 1, 'approved', 7);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (5, 'New Canal Lighthouse', 'The original lighthouse was built in 1838 on a foundation of sheet piling filled in with shells. The tower was octagonal, built of cypress, about 28 feet (8.5 m) high. The tower deteriorated badly and was replaced in 1855 with a square wood-dwelling on screw piles with an iron lantern and a 5th order Fresnel lens. In 1890 the structure was again replaced, with the light being raised to 49 feet (15 m). The 1890 structure was substantially rebuilt in 1901. It was damaged by hurricanes in 1903, 1915, 1926, and 1927. It was moved to its current location in 1910. After the 1927 damage, it was raised on new concrete piers, and in 1936, the breakwater surrounding it was filled in, putting land under the structure for the first time. From the 1960s through 2001 there was a USCG station at the site.

The lighthouse was heavily damaged during the 2005 hurricane season by Hurricanes Katrina and Rita. The first floor had collapsed and its cupola had fallen off. In 2006, the Lake Pontchartrain Basin Foundation signed a lease with the United States Coast Guard to repair the damaged lighthouse. It was disassembled and the building was put into storage. Reconstruction of the lighthouse began in February 2012 and was completed in 2013 by a Certified Construction Professional of New Orleans, LA.

The lighthouse was added to the National Register of Historic Places in 1985 as the New Canal Lighthouse.

It is now operated as the New Canal Lighthouse Museum and Education Center by the Lake Pontchartrain Basin Foundation. The museum''s exhibits include the history of the lighthouse, the environment and ecology of the Pontchartrain Basin, a Fresnel lens that was believed to have been in the lighthouse in the early 1900s, the work of the Foundation, and area history and recreation', 5, 'approved', 10);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (6, 'African American Museum', 'Located in historically Black Tremé, the New Orleans African American Museum is dedicated to protecting, preserving, and promoting the history, art, contributions, and culture of African Americans in New Orleans and the African diaspora. The museum features exhibits from Black artists and showcases Black-owned businesses at a monthly market.', 6, 'approved', 3);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (7, 'Napoleon House', 'The Napoleon House, also known as the Mayor Girod House or Nicolas Girod House, is a historic building at 500 Chartres Street in the French Quarter of New Orleans, Louisiana, United States. Built-in 1794 and enlarged in 1814, its name derives from the local legend that it was intended as a residence for Napoleon Bonaparte after his exile', 7, 'approved', 1);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (8, 'New Orleans Jazz Museum', 'Celebrating jazz in the city where it was born, the New Orleans Jazz Museum sits quaintly on the edge of the French Quarter in the Old U.S. Mint building. The museum features dynamic interactive exhibits, multigenerational educational programming, research facilities and engaging musical performances. Great for all ages, the Jazz Museum is a must for history lovers, culture seekers, jazz enthusiasts and really anyone visiting New Orleans.', 8, 'approved', 5);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (9, 'The Cabildo', 'The Cabildo is one of the most historically significant buildings in America. Built between 1795 and 1799 to replace a structure that burned in the 1794 fire, the Cabildo served as the seat of government during the Spanish colonial period. In 1803, a ceremony commemorating the Louisiana Purchase was held in the Sala Capitular, one of the rooms in this three-story structure. This single transaction nearly doubled the size of the United States and opened areas west of the Mississippi River for exploration and settlement. From 1803 to 1812 the Cabildo was used by the Louisiana Territorial Superior Court. After Louisiana became a state in 1812, the New Orleans City Council continued to use the building until 1853 when their offices moved to Gallier Hall on St. Charles Avenue. The Louisiana Supreme Court called the building home between 1853 and 1910. During that period, several landmark cases including Plessy v. Ferguson, which upheld the constitutionality of racial segregation, came before the court. The building was transferred to the Louisiana State Museum in 1908 and has since served to educate the public about Louisiana history.
In 1988 the roof of the Cabildo and its third floor were severely damaged by fire. Over the next five years, the landmark was restored using 600-year-old French timber framing technology. It reopened to the public in 1994.', 9, 'approved', 1);

SELECT pg_catalog.setval('public.landmarks_landmark_id_seq', 9, true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (1, 2, 'fair-grounds-race-course-slots.jpg ', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (2, 2, 'new-orleans-jazz-market.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (3, 2, 'the-national-wwii-museum.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (4, 2, 'pitot-house.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (5, 2, 'new-canel-lighthouse.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (6, 2, 'https://whitewallapi.wpenginepowered.com/wp-content/uploads/2019/08/AAM-09.13.18-l-8039-e1566912107888-1366x823.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (7, 2, 'https://bloximages.newyork1.vip.townnews.com/nola.com/content/tncms/assets/v3/editorial/9/43/94339bff-3384-5a7d-bba1-a660fcb46808/5dd75a99a8e4c.image.jpg?crop=1567%2C1175%2C98%2C0&resize=1567%2C1175&order=crop%2Cresize', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (8, 2, 'https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,g_auto,h_500,q_50,w_1400/https://assets.simpleviewinc.com/simpleview/image/upload/crm/neworleans/MarkJSindlerLSMPhoto_20110302_MG_2936_97776C47-6256-4225-881D19A220A62A4A_359a8e24-ec0b-408a-a7d694627e50a54c.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (9, 2, 'https://ir.4sqi.net/img/general/original/6566947_aHQ3guUIZnAjRa5P16OGfCiLs7eRRsl2V2jZYG5OyBQ.jpg', true);

SELECT pg_catalog.setval('public.photos_photo_id_seq', 9, true);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (1, 1);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (2, 2);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (3, 3);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (4, 4);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (5, 5);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (6, 6);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (7, 7);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (8, 8);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (9, 9);

SELECT pg_catalog.setval('public.reviews_review_id_seq', 1, false);
COMMIT TRANSACTION;