CREATE TABLE COURSES(
Course_ID int NOT NULL,
Course_Name varchar(50),
Timing time NOT NULL,
PRIMARY KEY(Course_ID)
);

INSERT INTO COURSES( Course_ID, Course_Name,Timing)
VALUES ('223', 'English', '02:00:00');
INSERT INTO COURSES( Course_ID, Course_Name, Timing)
VALUES ('202', 'Math','11:00:00');
INSERT INTO COURSES( Course_ID, Course_Name,Timing)
VALUES ('228', 'Science','04:00:00')
INSERT INTO COURSES( Course_ID, Course_Name,Timing)
VALUES ('217', 'History', '10:00:00');
INSERT INTO COURSES( Course_ID, Course_Name,Timing)
VALUES ('220', 'Urdu','09:00:00');

CREATE TABLE TEACHERS(
Teacher_ID int NOT NULL,
Teacher_Name varchar(50),
Date_of_Joining date NOT NULL,
Course_ID int,
Salary int NOT NULL,
Primary Key (Teacher_ID),
FOREIGN KEY (Course_ID) REFERENCES COURSES(Course_ID)

);

INSERT INTO TEACHERS( Teacher_ID, Teacher_Name, Date_of_Joining, Course_ID, Salary)
VALUES ('12005', 'Jack Nicholes', '2018-02-12', '223', '35000');
INSERT INTO TEACHERS( Teacher_ID, Teacher_Name, Date_of_Joining, Course_ID, Salary)
VALUES ('12012', 'Sadia Khan', '2021-10-19', '220', '25000');
INSERT INTO TEACHERS( Teacher_ID, Teacher_Name, Date_of_Joining, Course_ID, Salary)
VALUES ('12017', 'Oscar Mart', '2017-05-22', '217', '40000');
INSERT INTO TEACHERS( Teacher_ID, Teacher_Name, Date_of_Joining, Course_ID, Salary)
VALUES ('12003', 'Pam Beasly', '2016-09-07', '228', '45000');
INSERT INTO TEACHERS( Teacher_ID, Teacher_Name, Date_of_Joining, Course_ID, Salary)
VALUES ('12009', 'Holly Micheal', '2020-01-19', '202', '38000');

CREATE TABLE STUDENTS(
Student_ID int NOT NULL,
Student_Name varchar(50),
Course_ID int,
Date_of_Birth date NOT NULL,
Attendance VARCHAR(5) NOT NULL,
Primary Key(Student_ID),
FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '001', 'Kevin Malone', '223', '2003-03-12', '66%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '002', 'Angela Martin', '223', '2004-02-08', '97%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '003', 'Andy Bernard', '223', '2001-11-27', '71%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '004', 'Stanley Hudson', '223', '2000-04-11', '73%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '005', 'Phyllis Vance', '202', '2002-04-19', '77%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '006', 'Dwight Schrute', '202', '2004-01-11', '100%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '007', 'Jim Halpert', '202', '2004-08-06', '80%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '008', 'Kelly Kapoor', '202', '2004-07-22', '70%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '009', 'Ryan Howard', '202', '2005-02-18', '78%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '010', 'Micheal Scott', '228', '2000-08-11', '72%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '011', 'Toby Flenderson', '228', '2001-01-09', '88%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '012', 'David Wallace', '217', '2000-05-07', '82%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '013', 'Jan Levinson', '217', '2001-02-10', '56%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '014', 'Erin Holland', '217', '2006-08-12', '89%');
INSERT INTO STUDENTS ( Student_ID, Student_Name, Course_ID, Date_of_Birth, Attendance)
VALUES ( '015', 'Ali Murtaza', '220', '2006-03-07', '90%');

create table FEE(Student_ID int not null, Fees int NOT NULL, Foreign Key (Student_ID) REFERENCES STUDENTS(Student_ID));
INSERT INTO FEE(Student_ID, Fees)
VALUES ('001',10000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ('002',10000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ('003',10000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '004',10000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '005',15000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '006',15000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '007',15000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '008',15000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '009',15000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '010',15000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '011',15000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '012',8000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '013',8000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '014',8000);
INSERT INTO FEE(Student_ID, Fees)
VALUES ( '015',10000);
--Queries;
--Student name with ID.
Select student_id,student_name from students 

--Teacher with ID.
Select Teacher_ID,Teacher_Name from TEACHERS

--Courses
--Courses taught by teachers.
Select COURSES.Course_Name, TEACHERS.Teacher_Name FROM COURSES,TEACHERS WHERE TEACHERS.Course_ID = COURSES.Course_ID
 
-- Highest salary teacher.
Select Teacher_Name,Salary from teachers
where salary = (Select max(salary) from teachers)

-- Minimum salary teacher.
Select Teacher_Name,Salary from teachers
where salary = (Select min(salary) from teachers)


--Student studying which courses.

select STUDENTS.Student_Name,COURSES.Course_Name from STUDENTS,COURSES
where STUDENTS.Course_ID = COURSES.Course_ID

--Attendance of students.
select Student_Name, Attendance from STUDENTS 

--Count Number of Students,Courses and Teachers.

Select Count(*) as 'Number Of Students' from STUDENTS

Select Count(*) as 'Number Of Teachers' from TEACHERS

Select Count(*) as 'Number Of Courses' from COURSES

--Courses with their timings.
Select TEACHERS.Teacher_Name, COURSES.Course_Name,Courses.Timing from Courses,TEACHERS 
WHERE TEACHERS.Course_ID = COURSES.Course_ID

--Student with their fees.

Select STUDENTS.Student_ID,STUDENTS.Student_Name,FEE.Fees from STUDENTS,FEE
Where STUDENTS.Student_ID = FEE.Student_ID

