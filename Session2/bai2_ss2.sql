CREATE DATABASE bai_2_ss2;

USE bai_2_ss2;

CREATE TABLE Student(
    studentID CHAR(10) PRIMARY KEY,
    name NVARCHAR(30) NOT NULL
);

CREATE TABLE Subject(
    subjectID CHAR(5) PRIMARY KEY ,
    name NVARCHAR(30) NOT NULL,
    credits INT CHECK ( credits > 0) NOT NULL
);