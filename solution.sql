USE CollegeDB;

-- Write your sql code
--Create tables
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


-- Department Table
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Commerce'),
(3, 'Mathematics'),
(4, 'Physics');


-- Faculty Table
INSERT INTO Faculty VALUES
(101, 'Ravi', 1),
(102, 'Priya', 2),
(103, 'Kumar', 3),
(104, 'Anitha', 4);


-- Course Table
INSERT INTO Course VALUES
(201, 'BCA', 101),
(202, 'BCom', 102),
(203, 'BSc Maths', 103),
(204, 'BSc Physics', 104);


-- Student Table
INSERT INTO Student VALUES
(1001, 'Arun', 201),
(1002, 'Priya', 202),
(1003, 'Karthik', 203),
(1004, 'Divya', 204);


-- Display Student Details
SELECT s.StudentID, s.StudentName, c.CourseName,
       f.FacultyName, d.DepartmentName
FROM Student s
JOIN Course c ON s.CourseID = c.CourseID
JOIN Faculty f ON c.FacultyID = f.FacultyID
JOIN Department d ON f.DepartmentID = d.DepartmentID;

