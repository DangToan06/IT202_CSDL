create database bai_1_ss2;

use bai_1_ss2;

CREATE TABLE Class (
    classId char(5) primary key,
    name nvarchar(30) not null ,
    school_year int not null
);

CREATE TABLE Student (
    studentId char(10) primary key,
    classId char(5) not null,
    name nvarchar(30) not null ,
    dob date not null,
    foreign key (classId) references Class(classId)
);

