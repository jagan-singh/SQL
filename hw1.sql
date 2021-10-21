--- HOMEWORK 1

--- 1. Print all the students by the name order desc by the gpa.
SELECT concat(fname,' ',lname) name  FROM Student ORDER BY gpa DESC;

--- 2. Print all the computer sciences courses, these courses with code start with ‘CS’ sorted alphabetically.
SELECT name FROM Course WHERE code LIKE 'CS%' ORDER BY name;

--- 3. Print all the students with a gpa less than 3.0
SELECT concat(fname,' ',lname) name  FROM Student WHERE gpa < 3.0;

--- 4. Print all the students with a gpa of a least 3.0
SELECT concat(fname,' ',lname) name  FROM Student WHERE gpa >= 3.0;

--- 5. Find all students that have enrolled in database course
SELECT concat(fname,' ',lname) name
FROM Student s, Course c, Enrolled e
WHERE c.cid = e.cid 
AND s.sid = e.sid
AND c.name like 'DATABASE';
  
  --- 6. Find all students that have enrolled in database and network courses
SELECT Concat(fname, ' ', lname) sname FROM student s, enrolled e, course c
WHERE s.sid=e.sid AND c.cid=e.cid AND c.name LIKE '%Database%' AND s.sid in (
	SELECT e.sid FROM  enrolled e, course c
	WHERE  c.cid=e.cid AND c.name LIKE '%Network%'  
);

--- 7. Find all the students that have (A or more) at least once
SELECT DISTINCT concat(fname,' ',lname) name
FROM Student s, Course c, Enrolled e
WHERE c.cid = e.cid 
AND s.sid = e.sid
AND (e.grade = 'A' OR e.grade = 'A+'); 
 