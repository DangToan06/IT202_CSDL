CREATE DATABASE bai_4_ss2;

USE bai_4_ss2;

CREATE TABLE Teacher(
    teacherID CHAR(10) PRIMARY KEY,
    name NVARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Subject(
    subjectID CHAR(5) PRIMARY KEY ,
    name NVARCHAR(30) NOT NULL,
    credits INT CHECK ( credits > 0) NOT NULL,
    teacherID CHAR(10) not null ,
    foreign key (teacherID) REFERENCES Teacher(teacherID)
);

