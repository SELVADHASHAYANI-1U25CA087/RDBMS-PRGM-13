CREATE TABLE Department (
    DepartmentID NUMBER PRIMARY KEY,
    DepartmentName VARCHAR2(100) NOT NULL
);

-- Faculty Table
CREATE TABLE Faculty (
    FacultyID NUMBER PRIMARY KEY,
    FacultyName VARCHAR2(100) NOT NULL
);

-- Course Table
CREATE TABLE Course (
    CourseID NUMBER PRIMARY KEY,
    CourseName VARCHAR2(100) NOT NULL,
    FacultyID NUMBER,
    DepartmentID NUMBER,

    CONSTRAINT fk_course_faculty
        FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID),

    CONSTRAINT fk_course_department
        FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

-- Student Table
CREATE TABLE Student (
    StudentID NUMBER PRIMARY KEY,
    StudentName VARCHAR2(100) NOT NULL,
    CourseID NUMBER,

    CONSTRAINT fk_student_course
        FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);


-- ============================================================
-- SAMPLE DATA
-- ============================================================

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES (1, 'Computer Science');

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES (2, 'Information Technology');

INSERT INTO Faculty (FacultyID, FacultyName)
VALUES (101, 'Dr. Kumar');

INSERT INTO Faculty (FacultyID, FacultyName)
VALUES (102, 'Dr. Priya');

INSERT INTO Course (CourseID, CourseName, FacultyID, DepartmentID)
VALUES (201, 'BCA', 101, 1);

INSERT INTO Course (CourseID, CourseName, FacultyID, DepartmentID)
VALUES (202, 'B.Sc IT', 102, 2);

INSERT INTO Student (StudentID, StudentName, CourseID)
VALUES (1, 'Mohanesh', 201);

INSERT INTO Student (StudentID, StudentName, CourseID)
VALUES (2, 'Rahul', 202);

INSERT INTO Student (StudentID, StudentName, CourseID)
VALUES (3, 'Priya', 201);

COMMIT;
