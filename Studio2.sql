CREATE TABLE book (
   book_id INT AUTO_INCREMENT PRIMARY KEY,
   author_id INT,
   title VARCHAR(255),
   isbn INT,
   available BOOL,
   genre_id INT
);

CREATE TABLE author (
   author_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   birthday DATE,
   deathday DATE
);

CREATE TABLE patron (
   patron_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   loan_id INT
);

CREATE TABLE reference_books (
   reference_id INT AUTO_INCREMENT PRIMARY KEY,
   edition INT,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

INSERT INTO reference_books(edition, book_id)
VALUE (5,32);

CREATE TABLE genre (
   genre_id INT PRIMARY KEY,
   genres VARCHAR(100)
);

CREATE TABLE loan (
   loan_id INT AUTO_INCREMENT PRIMARY KEY,
   patron_id INT,
   date_out DATE,
   date_in DATE,
   book_id INT,
   FOREIGN KEY (book_id)
      REFERENCES book(book_id)
      ON UPDATE SET NULL
      ON DELETE SET NULL
);

SELECT title, isbn FROM book
INNER JOIN genre ON book.genre_id=genre.genre_id
WHERE genre.genres = "Mystery";

SELECT title, first_name, last_name FROM book
INNER JOIN author ON author.author_id=book.author_id
WHERE author.deathday IS NULL;

UPDATE book
SET AVAILABLE=0
WHERE book_id =30;
INSERT INTO loan(date_out, patron_id, book_id)
VALUES(CURRENT_DATE(), 17, 30);

UPDATE patron
SET loan_id=(
	SELECT loan_id FROM loan
    WHERE (patron_id=17) AND (date_out=CURRENT_DATE())
)
WHERE patron_id=17;

SET @returned_book_id=5;

SET @book_loan_id= (
	SELECT loan_id FROM loan
    WHERE  (book_id = @returned_book_id) AND (date_in IS NULL)
);

UPDATE book
SET available = 1
WHERE book_id = @returned_book_id;

UPDATE loan
SET date_in=current_date()
WHERE loan_id = book_loan_id;

UPDATE patron
SET loan_id=NULL
WHERE patron_id= ( SELECT patron_id FROM loan WHERE loan_id = @book_loan_id);

SET @returning_patron_id = (
	SELECT patron_id FROM loan
    WHERE loan_id = @book_loan_id
);

SELECT patron.first_name, patron.last_name, genre.genres
FROM patron
INNER JOIN loan ON patron.loan_id=loan.loan_id
INNER JOIN book ON book.book_id=loan.book_id
INNER JOIN genre ON book.genre_id=genre.genre_id
WHERE loan.date_in IS NULL;

