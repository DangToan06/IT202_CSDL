CREATE DATABASE ManagerLibrary;

use ManagerLibrary;

CREATE TABLE Reader(
    reader_id INT AUTO_INCREMENT PRIMARY KEY,
    reader_name VARCHAR(100) NOT NULL ,
    phone VARCHAR(100) ,
    register_date DATE DEFAULT (CURRENT_DATE),

    CONSTRAINT
        UQ_Phone_Reader UNIQUE (phone)
);

CREATE TABLE Book(
    book_id INT PRIMARY KEY ,
    book_title VARCHAR(150) NOT NULL ,
    author VARCHAR(100),
    publish_year INT,

    CONSTRAINT
        CK_PublishYear_Book CHECK ( publish_year >= 1900 )
);

CREATE  TABLE  Borrow(
    reader_id INT NOT NULL ,
    book_id INT NOT NULL,
    borrow_date DATE DEFAULT (CURRENT_DATE),
    return_date DATE,
    PRIMARY KEY (reader_id, book_id, borrow_date),

    CONSTRAINT FK_Borrow_Reader FOREIGN KEY (reader_id) REFERENCES Reader(reader_id),
    CONSTRAINT FK_Borrow_Book FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

SELECT * FROM Reader;
SELECT * FROM Book;
SELECT * FROM Borrow;

ALTER TABLE Reader
ADD email VARCHAR(100) UNIQUE ;

ALTER TABLE Book
MODIFY author VARCHAR(150);

ALTER TABLE Borrow
ADD CONSTRAINT CK_returnDate_Borrow CHECK ( return_date >= borrow_date );

INSERT INTO Reader(reader_id, reader_name, phone, email,register_date)
VALUES
    (1, 'Nguyễn Văn An', '0901234567', 'an.nguyen@gmail.com', '2024-09-01'),
    (2, 'Trần Thị Bình', '0912345678', 'binh.tran@gmail.com', '2024-09-05'),
    (3, 'Lê Minh Châu', '0923456789', 'chau.le@gmail.com', '2024-09-10');

INSERT INTO Book(book_id, book_title, author, publish_year)
VALUES
    (101, 'Lập trình C căn bản', 'Nguyễn Văn A', 2018),
    (102, 'Cơ sở dữ liệu', 'Trần Thị B', 2020),
    (103, 'Lập trình Java', 'Lê Minh C', 2019),
    (104, 'Hệ quản trị MySQL', 'Phạm Văn D', 2021);

INSERT INTO Borrow(reader_id, book_id, borrow_date, return_date)
VALUES
    (1, 101, '2024-09-15', null),
    (1, 102, '2024-09-15', '2024-09-25'),
    (2, 103, '2024-09-13', null);

UPDATE Borrow
SET Borrow.return_date = '2024-10-01'
WHERE Borrow.reader_id = 1;

UPDATE Book
SET publish_year = 2023
WHERE  publish_year >= 2021;

DELETE Borrow,
WHERE