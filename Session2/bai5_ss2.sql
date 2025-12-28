CREATE DATABASE bai_5_ss2;

USE bai_5_ss2;

CREATE TABLE Student(
    studentID CHAR(10) PRIMARY KEY,
    name NVARCHAR(30) NOT NULL
);

CREATE TABLE Subject(
    subjectID CHAR(5) PRIMARY KEY ,
    name NVARCHAR(30) NOT NULL,
    credits INT CHECK ( credits > 0) NOT NULL
);

CREATE TABLE Score(
    studentID CHAR(10) not null,
    subjectID CHAR(5) not null ,
    processScore DECIMAL(4,2) CHECK ( processScore >= 0 AND processScore <=10),
    finalScore DECIMAL(4,2) CHECK ( finalScore >= 0 AND finalScore <=10),
    PRIMARY KEY (studentID, subjectID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (subjectID) REFERENCES Subject(subjectID)
);


