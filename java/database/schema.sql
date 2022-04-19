
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
DROP SEQUENCE IF EXISTS seq_order_column;

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
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (10, '6500 Magazine St', '', 'New Orleans', 'LA', 70118);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (11, 'Lafitte Greenway', '', 'New Orleans', 'LA', 70119);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (12, '701 N Rampart St', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (13, 'River St', '', 'New Orleans', 'LA', 70114);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (14, '930 Poydras St #1106', '', 'New Orleans', 'LA', 70112);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (15, '1 Canal St', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (16, '600 Bourbon St, New Orleans', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (17, '726 St Peter', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (18, '733 Bourbon St', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (19, '1403 Washington Ave', '', 'New Orleans', 'LA', 70130);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (20, '1039 Decatur St', '', 'New Orleans', 'LA', 70116);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (21, '1 Palm Dr', '', 'New Orleans', 'LA', 70124);
INSERT INTO public.address (address_id, address_line_1, address_line_2, city, state, zipcode) VALUES (22, '700 Bourbon', '', 'New Orleans', 'LA', 70116);


SELECT pg_catalog.setval('public.address_address_id_seq', 22, true);









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
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (10, 'Audubon Zoo', 'Audubon Zoo is a New Orleans, Louisiana-based American zoo. It is managed by the Audubon Nature Institute, which also oversees the Audubon Aquarium of the Americas, the Audubon Louisiana Nature Center, the Freeport-McMoran Species Survival Center, Audubon Park, and the Audubon Coastal Wildlife Network. It is 58 acres (23 ha) in size and home to over 2,000 animals. It is located on the Mississippi River side of Magazine Street in Audubon Park in Uptown New Orleans. The park and zoo are named after artist and naturalist John James Audubon, who lived in New Orleans beginning in 1821.', 10, 'approved', 7);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (11, 'Lafitte Greenway', 'The Lafitte Greenway is a 2.6-mile linear park in New Orleans that connects people to nature, their destinations, and one another. The Greenway has been the city''s premier bicycle and pedestrian pathway since its inception in 2015, connecting neighborhoods from the French Quarter to City Park. The Greenway is the place to be if you want to connect with your community, spend time in nature, or get active. The greenway area is open for activities such as a bicycle path, all-purpose fields, outdoor fitness equipment, an outdoor pool (in the summer), a recreation center, tennis courts, and a walking path.', 11, 'approved', 7);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (12, 'Congo Square', 'Congo Square is one of the most revered locations in American music history. This area, which was once a grassy common behind the original city rampart (now Rampart Street), was one of several gathering places for African enslaved people and their descendants. Slaves were allowed to buy and sell goods on Sundays in the 1700s under French and Spanish colonial rule. They also played African-style musical instruments and dances from their native countries. After New Orleans was admitted to the Union in the early 1800s, a city ordinance restricted slave gatherings to this location and only until sunset. Nonetheless, the weekly ritual maintained a continuity of African culture in the New World, with far-reaching implications for music''s future. There are several events which are held on the street of the square. For example, every year, the Congo Square New World Rhythms Festival takes place in Armstrong Park. Mardi Gras Indians, African dance, and music of all genres are featured, including jazz, brass bands, soul, funk, Latin Jazz, and West African highlife. The festival celebrates African diaspora traditions in New Orleans. Notably, the festival takes place in Congo Square, where enslaved Africans and free people of color gathered on Sundays to continue their traditions of song, dance, and drumming.
The festival usually includes an arts market, a food court, and a Mardi Gras Indian "battle" in Congo Square, where various Mardi Gras Indian tribes gather. There may also be workshops on topics such as African dance and others.', 12, 'approved', 3);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (13, 'Holocaust Memorial', 'The Holocaust Memorial, designed by Israeli artist YaacovAgam, is a modern sculpture made of 9 panels that stand parallel to each other and show different interpretations with each shift in the Observer''s position. The Yellow Star design, which was important during Nazi rule, is included in the sculpture, and one of the designs also depicts the chaos and oppression that came with the star.
Don''t miss out on seeing the monument if you''re in New Orleans. It''s abstract art with a human touch.', 13, 'approved', 2);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (14, 'Airboat swamp tours', 'On a New Orleans swamp tour, you''ll get up close and personal with alligators as you explore acres of authentic Louisiana swamps and waterways! Buckle up, it''s going to be a wild ride!
The Ride: A thrilling ride on the airboats followed by a scenic cruise on the pontoon.
The History: Discover the history of the bayous and the swamplands of New Orleans.
Interact with all of the living creatures, including gators, raccoons, wild hogs, birds, and many more! 
Tour information: Boats depart from the dock at 9:45 a.m., 12 p.m., 2 p.m., 4 p.m., and 6 p.m. (if there is enough daylight for the 6 pm tour). It is critical that you arrive at least 15-30 minutes early so that you have enough time to check in!
All tours last 1 hour 45 minutes and are jam-packed with excitement!!', 14, 'approved', 11);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (15, 'Audubon Aquarium of the Americas', 'The Audubon Aquarium of the Americas is a marine aquarium in New Orleans, Louisiana, USA. It is managed by the Audubon Nature Institute, which also oversees the Audubon Zoo, the Audubon Louisiana Nature Center, the Freeport-McMoRan Audubon Species Survival Center, the Audubon Center for Research of Endangered Species (ACRES), the Coastal Wildlife Network, the Audubon Wilderness Park, and the Audubon Park. It''s at the upper end of Woldenberg Park, on the banks of the Mississippi River near the edge of the historic French Quarter. It first opened its doors on September 1, 1990. The aquarium, as the name suggests, specializes in aquatic life from the Americas. The exhibits depict regions from North and South America. Among the 10,000 animals representing 530 species on display are the following:
A clear, 30-foot (9 m) long tunnel surrounds a 132,000 US gallons (500 m3) tank of exemplary sea life such as tarpon and angelfish in a Caribbean reef exhibit. The Amazon exhibit, encased in a glass cylinder and effectively a humid, climate-controlled greenhouse that is a prominent feature of the riverfront, includes macaws, piranhas, an anaconda, freshwater stingrays, and other specimens from the area basin; the Mississippi River gallery, which includes catfish, paddlefish, owls, and a leucitic white alligator. The Gulf of Mexico exhibit includes a 17-foot (5 m) tall tank of 400,000 US gallons (1,500 m3) of water carrying sharks, sea turtles, and stingrays.', 15, 'approved', 7);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (16, 'French Quarter', 'The French Quarter, also known as the Vieux Carré, is New Orleans'' oldest neighborhood. After Jean-Baptiste Le Moyne de Bienville founded New Orleans (French: La Nouvelle-Orléans) in 1718, the city grew around the Vieux Carré ("Old Square" in English), a central square. Today, the district is more commonly known as the French Quarter, or simply "The Quarter," owing to changes in the city brought about by American immigration following the 1803 Louisiana Purchase. The majority of the existing historic buildings were built either in the late 18th century, during the city''s Spanish rule, or in the first half of the 19th century, after U.S. purchase and statehood. 
The district as a whole has been designated a National Historic Landmark, with numerous contributing buildings each deemed significant in their own right. It is a popular tourist destination in the city, as well as a popular hangout for locals. Because of its distance from areas where the levee was breached during Hurricane Katrina in 2005, as well as the strength and height of the nearest Mississippi River Levees in comparison to other levees along the canals and lakefront, it received relatively light floodwater damage in comparison to other areas of the city and the greater region.', 16, 'approved', 1);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (17, 'Preservation Hall', 'Preservation Hall in New Orleans was founded in 1961 to honor one of America''s most enduring art forms: traditional New Orleans jazz. Preservation Hall, which operates as a music venue, a touring band, and a non-profit organization, continues its mission today as a cornerstone of New Orleans music and culture. The Preservation Hall venue, located on St. Peter Street in the heart of the French Quarter, presents intimate, acoustic New Orleans Jazz concerts over 350 nights a year, featuring ensembles from a current collective of 100+ local master practitioners. On any given night, audiences witness the evolution of this venerable and living tradition with joy.', 17, 'approved', 1);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (18, 'Fritzel’s Jazz Club', 'In the heart of the French Quarter, in a historic 1831 structure. It has become a hotspot for jazz fans and performers alike since its founding in 1969. Traditional New Orleans jazz is played here. Fritzel''s European Jazz Club is housed in an 1831 building and exudes history on its own, but it was founded in 1969 by Gunter "Dutch" Seutter and has been a fixture ever since. It''s a little rough around the edges, with bench seating and a classic dive-bar vibe, but that''s part of what makes it so appealing.
Don''t be fooled by the vintage, disheveled appearance. On Bourbon Street, this is a sophisticated jazz venue. They serve local Abita ale, spirits, and a few craft cocktails, and everything except the jazz is simple and straightforward.', 18, 'approved', 1);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (19, 'Commander’s Palace', 'The unique striped awning in front of this landmark eatery near Lafayette Cemetery. it can''t be missed by visitors to the Garden District. Commander''s Palace is known for its superb interpretations of Creole classics, classy but joyous ambience, and 25-cent martini lunches, thanks to Paul Prudhomme and Emeril Lagasse, who elevated the restaurant to worldwide recognition as their careers took off.', 19, 'approved', 7);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (20, 'Cafe Du Monde', 'This restaurant serves only one meal, but it is a well-known one. Beignets from Cafe du Monde are a popular local dessert that may be enjoyed at any time. The brand is well-known worldwide, and many celebrities and influencers have taken to social media to share a powdered sugar-covered selfie.', 20, 'approved', 1);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (21, 'New Orleans City Park', 'City Park, a 1,300-acre public park in New Orleans, Louisiana, is the country''s 87th largest and 20th most frequented urban park. City Park is roughly half the size of Central Park in New York City, which is regarded as the ideal urban greenspace by Americans across the country.
Friends of City Park has contributed to approximately 40 development projects since 1979, with the goal of sustaining and improving the value and importance of City Park as a location of natural beauty, culture, enjoyment, and education for the public. Friends of City Park has raised more than $3.8 million for projects such as the restoration of the Historic Wooden Carousel, the restoration of the Peristyle, assistance in funding the construction of City Putt, NOLA City Bark, the Conservatory of the Two Sisters, the Marconi Drive Bike Path, and much more over the last ten years.
Families enjoy bringing their children to City Park for a day of outdoor fun because everything is kids friendly. In fact, the park has a few rides designed exclusively for children.', 21, 'approved', 1);
INSERT INTO public.landmarks (landmark_id, name, content, address_id, status, district_id) VALUES (22, 'Bourbon Street', 'Bourbon Street is a historic street in the heart of the French Quarter of New Orleans. Extending thirteen blocks from Canal Street to Esplanade Avenue, Bourbon Street is famous for its many bars and strip clubs. With 17.74 million visitors in 2017 alone, New Orleans depends on Bourbon Street as a main tourist attraction. Bourbon Street is packed with historic venues, social tales, and famous structures in one of America''s oldest towns. The boulevard was named after Jean-Baptiste Le Moyne de Bienville, who founded New Orleans in 1718. In 1721, French engineer Adrien de Pauger laid New Orleans'' streets, choosing one to bear the name of the dominant French royal family at the time, Rue Bourbon. This magnificent boulevard runs 13 blocks from Canal Street to Esplanade Avenue before meandering through the Marigny district in the heart of the French Quarter.
On the junction of Bourbon and St. Phillip streets, visitors and residents alike frequent Jean Lafitte''s Blacksmith Shop. Legends, mystery, and days of old New Orleans abound on the walls of this Creole cottage tavern. The structure was built before 1772, and it is supposed to be where the Lafitte brothers set up their blacksmith shop as a front for their privateering activities.', 22, 'approved', 1);






SELECT pg_catalog.setval('public.landmarks_landmark_id_seq', 22, true);




INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (1, 2, 'fair-grounds-race-course-slots.jpg ', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (2, 2, 'new-orleans-jazz-market.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (3, 2, 'the-national-wwii-museum.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (4, 2, 'pitot-house.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (5, 2, 'new-canel-lighthouse.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (6, 2, 'https://whitewallapi.wpenginepowered.com/wp-content/uploads/2019/08/AAM-09.13.18-l-8039-e1566912107888-1366x823.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (7, 2, 'https://bloximages.newyork1.vip.townnews.com/nola.com/content/tncms/assets/v3/editorial/9/43/94339bff-3384-5a7d-bba1-a660fcb46808/5dd75a99a8e4c.image.jpg?crop=1567%2C1175%2C98%2C0&resize=1567%2C1175&order=crop%2Cresize', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (8, 2, 'https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,g_auto,h_500,q_50,w_1400/https://assets.simpleviewinc.com/simpleview/image/upload/crm/neworleans/MarkJSindlerLSMPhoto_20110302_MG_2936_97776C47-6256-4225-881D19A220A62A4A_359a8e24-ec0b-408a-a7d694627e50a54c.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (9, 2, 'https://ir.4sqi.net/img/general/original/6566947_aHQ3guUIZnAjRa5P16OGfCiLs7eRRsl2V2jZYG5OyBQ.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (10, 2, 'audubon-zoo-new-orleans.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (11, 2, 'lafitte-greenway-new-orleans.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (12, 2, 'congo-square.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (13, 2, 'new-orleans-holocaust-museum.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (14, 2, 'New-Orleans-Swamp-Boat-Tour.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (15, 2, 'new-orleans-audubon-aquarium-of-america.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (16, 2, 'French_Quarter_New_Orleans.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (17, 2, 'preservation-hall.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (18, 2, 'Fritzels- Jazz- Club.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (19, 2, 'Commanders-Palace.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (20, 2, 'cafe-du-monde.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (21, 2, 'new-orleans-city-park.jpg', true);
INSERT INTO public.photos (photo_id, user_id, photo_path, featured) VALUES (22, 2, 'bourbon-street.jpg', true);



SELECT pg_catalog.setval('public.photos_photo_id_seq', 22, true);


INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (1, 1);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (2, 2);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (3, 3);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (4, 4);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (5, 5);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (6, 6);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (7, 7);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (8, 8);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (9, 9);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (10, 10);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (11, 11);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (12, 12);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (13, 13);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (14, 14);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (15, 15);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (16, 16);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (17, 17);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (18, 18);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (19, 19);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (20, 20);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (21, 21);
INSERT INTO public.landmarks_photos (photo_id, landmark_id) VALUES (22, 22);


SELECT pg_catalog.setval('public.reviews_review_id_seq', 1, false);
COMMIT TRANSACTION;