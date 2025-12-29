CREATE DATABASE kiemTraTrenLop;

USE kiemTraTrenLop;

CREATE TABLE Student(
    studentID CHAR(10) PRIMARY KEY,
    name NVARCHAR(30) NOT NULL
);

CREATE TABLE Subject(
    subjectID CHAR(5) PRIMARY KEY ,
    name NVARCHAR(30) NOT NULL UNIQUE ,
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

CREATE TABLE Score(
    studentID CHAR(10) not null,
    subjectID CHAR(5) not null ,
    processScore DECIMAL(4,2) CHECK ( processScore >= 0 AND processScore <=10),
    finalScore DECIMAL(4,2) CHECK ( finalScore >= 0 AND finalScore <=10),
    PRIMARY KEY (studentID, subjectID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (subjectID) REFERENCES Subject(subjectID)
);

INSERT INTO Student(studentID, name) VALUES
('B24DTCN100', 'Trần Trí Dương'),
('B24DTCN200', 'Tôn Phạm Quang Huy'),
('B24DTCN300', 'Đinh Trọng An');

INSERT INTO Subject(subjectID, name, credits) VALUES
('IT101', 'Cấu trúc dữ liệu và giải thuật', '4'),
('IT102', 'Lập trình web', '5'),
('IT103', 'Lập trình hướng đối tượng', '3'),
('IT104', 'Java', '4');

INSERT INTO Enrollment(studentID, subjectID, date) VALUES
('B24DTCN100', 'IT103', '2025-09-07'),
('B24DTCN100', 'IT101', '2025-09-08'),
('B24DTCN200', 'IT102', '2025-09-09'),
('B24DTCN300', 'IT104', '2025-09-09');

INSERT INTO Score(studentID, subjectID) VALUES
('B24DTCN100', 'IT103'),
('B24DTCN100', 'IT101'),
('B24DTCN200', 'IT102'),
('B24DTCN300', 'IT104');

SELECT * FROM Score;

UPDATE Score
SET processScore = 7.5, finalScore = 8.0
WHERE studentID = 'B24DTCN100' AND  subjectID  = 'IT101';

DELETE FROM Score
WHERE studentID = 'B24DTCN100' AND  subjectID  = 'IT103';

SELECT * FROM Student;
SELECT * FROM Subject;
SELECT * FROM Enrollment;