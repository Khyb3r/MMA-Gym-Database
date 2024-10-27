/*
Student name: Khyber Jan               
Student username: adgd932            
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE TABLE adgd932Coach
(
coach_id INTEGER PRIMARY KEY,
first_name CHAR(20),
surname CHAR(20),
specialisation CHAR(20),
years_of_experience INTEGER(2)
);

CREATE TABLE adgd932Member
(
membership_id INTEGER(4) PRIMARY KEY,
first_name CHAR(20),
surname CHAR(20),
town_of_residence CHAR(20),
coach_id INTEGER,
FOREIGN KEY (coach_id) REFERENCES adgd932Coach (coach_id)
);

CREATE TABLE adgd932Class
(
class_no INTEGER PRIMARY KEY,
coach_id INTEGER,
type_of_martial_art CHAR(20),
scheduled_day CHAR(10),
scheduled_time INTEGER(4),
duration INTEGER(4),
capacity INTEGER,
FOREIGN KEY (coach_id) REFERENCES adgd932Coach (coach_id)
);

CREATE TABLE adgd932Attendance
(
training_date INTEGER(6),
membership_id INTEGER(4),
class_no INTEGER,
presence_at_training CHAR(8),
FOREIGN KEY (membership_id) REFERENCES adgd932Member (membership_id),
FOREIGN KEY (class_no) REFERENCES adgd932Class (class_no),
PRIMARY KEY (membership_id,class_no,training_date)
);

CREATE TABLE  adgd932Equipment
(
equipment_id INTEGER PRIMARY KEY,
equipment_name CHAR(25),
quantity INTEGER,
state CHAR(10)
);

CREATE TABLE adgd932Equipment_Usage
(
usage_id INTEGER,
class_no INTEGER,
equipment_id INTEGER,
quantity_needed INTEGER,
FOREIGN KEY (class_no) REFERENCES adgd932Class (class_no),
FOREIGN KEY (equipment_id) REFERENCES adgd932Equipment (equipment_id),
PRIMARY KEY (class_no, equipment_id, usage_id)
);


/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO adgd932Coach VALUES
(100, "Pat", "Barry", "Wrestling", 15),
(101, "Goffredo", "Nesta", "Boxing", 8),
(102, "Trevor", "Whittman", "BJJ", 11),
(103, "Fabricio", "Werdum", "Boxing", 25),
(104, "Cain", "Velasquez", "Kickboxing", 16),
(105, "Marko", "Bernardman", "BJJ", 6),
(106, "Justin", "Brandt", "Judo", 20),
(107, "Dillon", "Hughes", "Judo", 19),
(108, "Dominic", "Cruz", "Kickboxing", 4),
(109, "John", "Kavanaugh", "BJJ", 10);

INSERT INTO adgd932Member VALUES
(01, "Khabib", "Nurmagomedov" , "Harrow", 100),
(02,"Jon", "Jones", "Wembley", 102),
(03,"Devin", "Haney", "Pinner", 109),
(04, "Gervonta", "Davis", "Hounslow", 103),
(05, "Teofimo", "Lopez", "Harrow", 101),
(06, "Said", "Nurmagomedov", "Uxbridge", 106),
(07, "Daniel", "Cormier" , "Barking", 105),
(08, "Shavkat", "Rakhmonov", "Wembley", 104),
(09, "Leon", "Edwards" , "South Acton", 106),
(10, "Terence", "Crawford" , "Ealing", 100),
(11, "Errol", "Spence" , "North Acton", 108),
(12, "Kamaru", "Usman", "Pinner", 107);

INSERT INTO adgd932Class VALUES
(01, 100, "Striking", "Monday", 1000, 0130, 50),
(02, 101, "Boxing", "Tuesday", 1000, 0130, 50),
(03, 102, "BJJ", "Wednesday", 1000, 0130, 45),
(04, 103, "Wrestling", "Thursday", 1000, 0130, 40),
(05, 104, "Kickboxing", "Monday", 1700, 0130, 45),
(06, 105, "Judo", "Tuesday", 1700, 0100, 30);
       
INSERT INTO adgd932Attendance VALUES
(230115, 01, 03, "Present"),
(230115, 02, 05, "Absent"),
(230115, 03, 06, "Present"),
(230115, 04, 02, "Present"),
(230115, 05, 04, "Absent"),
(230115, 06, 01, "Present"),
(230115, 07, 02, "Present"),
(230115, 08, 03, "Absent"),
(230115, 09, 04, "Absent"),
(230115, 10, 05, "Present"),
(230115, 11, 06, "Present"),
(230115, 12, 01, "Absent");

INSERT INTO adgd932Equipment VALUES
(01, "RDX Gloves", 30, " Brand New"),
(02, "Venum Gloves", 28, "New"),
(03, "White Handwraps", 25, "Very Used"),
(04, "Black Handwraps", 20, "Used"),
(05, "Pads", 30, "New"),
(06, "Heavy Bags", 6, "New"),
(07, "Speed Bags", 5, "Brand New"),
(08, "Mats", 8, "Used"),
(09, "Large Mats", 10, "Very Used"),
(10, "Headgear", 35, "New");

INSERT INTO adgd932Equipment_Usage VALUES
(001, 01, 01, 28),
(002, 01, 05, 30),
(003, 01, 06, 6),
(004, 01, 10, 35),
(005, 02, 02, 25),
(006, 02, 06, 4),
(007, 01, 07, 5),
(008, 01, 10, 15),
(009, 03, 08, 6),
(010, 04, 07, 3),
(011, 04, 08, 8),
(012, 05, 01, 15),
(013, 05, 03, 20),
(014, 05, 04, 15),
(015, 05, 06, 2),
(016, 06, 08, 8),
(017, 06, 09, 9);
                     
/* SECTION 3 - UPDATE STATEMENTS */

/*1*/
UPDATE adgd932Coach SET first_name = 'Naoya', surname = 'Inoue'
WHERE coach_id = 101;
/*2*/
UPDATE adgd932Equipment SET quantity = 37
WHERE equipment_id = 10;

/* SECTION 4 - SINGLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/*  1)  List the member Gervonta Davis' town of residence. */
SELECT town_of_residence
FROM adgd932Member
WHERE first_name = 'Gervonta' AND surname = 'Davis';

/*  2) List the names and specialisations of all coaches who have a surname beginning with "B". List each Coach only once. */
SELECT DISTINCT first_name,surname,specialisation
FROM adgd932Coach
WHERE surname LIKE "B%";

/*  3) List the equipment name which have a quantity of 15 or more and are deemed some state of "New". */
SELECT equipment_name
FROM adgd932Equipment
WHERE quantity >= 15 AND state LIKE '%New';

/*  4)  Select the number of members 'Present' at any class on the 15th of January 2023. */
SELECT COUNT(presence_at_training) AS Attendees_amount
FROM adgd932Attendance
WHERE presence_at_training = 'Present' AND training_date = '230115';

/*  5)  Select the average combined amount of Handwraps and Gloves. */
SELECT AVG(quantity)
FROM adgd932Equipment
WHERE equipment_name LIKE '% Handwraps' OR equipment_name LIKE '% Gloves';

/*  6) List all details of members who aren't residents of "Harrow" or "Hounslow". Order them by ascending by town name.  */
SELECT *
FROM adgd932Member
WHERE town_of_residence NOT IN ('Harrow','Hounslow')
ORDER BY town_of_residence ASC;

/* SECTION 5 - MULTIPLE TABLE SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs */


/*  1) List all the coach details of the member with first name 'Terence'. */
SELECT *
FROM adgd932Coach
WHERE coach_id IN
(SELECT coach_id
FROM adgd932Member
WHERE first_name = 'Terence');

/*  2) List the day, duration and capacity of the Class wherein the Coach's specialisation is Boxing. */
SELECT C2.scheduled_day, C2.duration, C2.capacity
FROM adgd932Coach AS C1, adgd932Class AS C2
WHERE C1.coach_id = C2.coach_id
AND C1.specialisation = 'Boxing';

/*  3) What is the quantity of any type of Boxing Gloves needed for the Tuesday Boxing Class. Compared to the quantity had.  */
SELECT e.quantity_needed, e1.quantity
FROM adgd932Equipment_Usage AS e, adgd932Class AS c, adgd932Equipment AS e1
WHERE e.class_no = c.class_no
AND e1.equipment_id = e.equipment_id
AND c.type_of_martial_art = 'Boxing'
AND c.scheduled_day = 'Tuesday'
AND e1.equipment_name LIKE '% Gloves';

/*  4)  Select the coach id and full names of which Coaches are assigned to more than one member. */
SELECT c.coach_id, c.first_name, c.surname, COUNT(m.coach_id)
FROM adgd932Member AS m, adgd932Coach AS c
WHERE m.coach_id = c.coach_id
GROUP BY c.coach_id, c.first_name, c.surname
HAVING COUNT(m.coach_id) > 1;

/*  5) Select the coach full names and id's of those members from 'Wembley' who were absent to any class on the 15th of January 2023. */
SELECT coach_id, first_name, surname
FROM adgd932Coach
WHERE coach_id IN
(SELECT coach_id
FROM adgd932Member
WHERE town_of_residence = 'Wembley'
AND membership_id IN
(SELECT membership_id
FROM adgd932Attendance
WHERE training_date = 230115
AND presence_at_training = 'Absent'));

/*  6) Select the equipment names and their total quantity used in all classes wherein the state of the equipment was deemed 'New.
The total quantity is only to be listed if it amounts to 10 or more. Also list the equipment name in descending alphabetical order. */
SELECT equipment_name, SUM(quantity)
FROM adgd932Equipment_Usage as EU, adgd932Equipment AS E
WHERE EU.equipment_id = E.equipment_id
AND state =  'New'
GROUP BY E.equipment_name
HAVING SUM(quantity) >= 10
ORDER BY equipment_name DESC;

/* SECTION 6 - DELETE ROWS (make sure the SQL is commented out in this section)

DELETE FROM adgd932Attendance WHERE presence_at_training = 'Absent';
DELETE FROM adgd932Equipment_Usage WHERE class_no = 2;

*/

/* SECTION 7 - DROP TABLES (make sure the SQL is commented out in this section)

DROP TABLE adgd932Equipment_Usage;
DROP TABLE adgd932Equipment;
DROP TABLE adgd932Attendance;
DROP TABLE adgd932Class;
DROP TABLE adgd932Member;
DROP TABLE adgd932Coach;

*/