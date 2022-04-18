--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8
-- Dumped by pg_dump version 12.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: landmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

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


--
-- Name: landmarks_landmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.landmarks_landmark_id_seq', 9, true);


--
-- PostgreSQL database dump complete
--

