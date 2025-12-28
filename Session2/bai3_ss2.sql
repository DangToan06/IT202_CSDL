CREATE DATABASE bai_3_ss2;

USE bai_3_ss2;

CREATE TABLE Student(
    studentID CHAR(10) PRIMARY KEY,
    name NVARCHAR(30) NOT NULL
);

CREATE TABLE Subject(
    subjectID CHAR(5) PRIMARY KEY ,
    name NVARCHAR(30) NOT NULL,
    credits INT CHECK ( credits > 0) NOT NULL
);

CREATE TABLE Enrollment(
    studentID CHAR(10) not null ,
    subjectID CHAR(5) not null ,
    date DATE not null ,
    PRIMARY KEY (studentID, subjectID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (subjectID) REFERENCES Subject(subjectID)
);