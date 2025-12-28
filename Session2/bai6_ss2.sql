CREATE DATABASE bai_6_ss2;

USE bai_6_ss2;

CREATE TABLE Class (
    classID CHAR(5) PRIMARY KEY,
    className NVARCHAR(50) NOT NULL,
    schoolYear VARCHAR(20) NOT NULL,

    CONSTRAINT UQ_ClassName UNIQUE (className)
);

CREATE TABLE Teacher (
    teacherID CHAR(10) PRIMARY KEY,
    fullName NVARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),

    CONSTRAINT UQ_Teacher_Email UNIQUE (email),
    CONSTRAINT UQ_Teacher_Phone UNIQUE (phone)
);

CREATE TABLE Student (
    studentID CHAR(10) PRIMARY KEY,
    fullName NVARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    classID CHAR(5) NOT NULL,

    CONSTRAINT FK_Student_Class FOREIGN KEY (classID) REFERENCES Class(classID)
);

CREATE TABLE Subject (
    subjectID CHAR(5) PRIMARY KEY,
    subjectName NVARCHAR(50) NOT NULL,
    credits INT NOT NULL,
    teacherID CHAR(10) NOT NULL,

    CONSTRAINT CK_Credits CHECK (credits > 0),
    CONSTRAINT FK_Subject_Teacher FOREIGN KEY (teacherID) REFERENCES Teacher(teacherID)
);

CREATE TABLE Enrollment (
    studentID CHAR(10) NOT NULL,
    subjectID CHAR(5) NOT NULL,
    registerDate DATE DEFAULT (CURRENT_DATE),

    processScore DECIMAL(4, 2),
    finalScore DECIMAL(4, 2),

    PRIMARY KEY (studentID, subjectID),

    CONSTRAINT FK_Enroll_Student FOREIGN KEY (studentID) REFERENCES Student(studentID),
    CONSTRAINT FK_Enroll_Subject FOREIGN KEY (subjectID) REFERENCES Subject(subjectID),

    CONSTRAINT CK_ProcessScore CHECK (processScore >= 0 AND processScore <= 10),
    CONSTRAINT CK_FinalScore CHECK (finalScore >= 0 AND finalScore <= 10)
);