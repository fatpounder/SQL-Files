CREATE TABLE artwork (
	artwork_id INT PRIMARY KEY,
    title VARCHAR(50),
    artist VARCHAR(50),
    style VARCHAR(50)
);

INSERT INTO artwork
VALUES(1, "Mona Lisa", "Da Vinci", "Renaissance");

INSERT INTO artwork(artwork_id, title, artist)
VALUES(2, "Girl with a Pearl Earring", "Johnannes Vermeer");

INSERT INTO artwork
VALUES (3, "The Starry Night", "Van Gogh", "Post-Impressionism"),
(4, "The Kiss", "Gustav", "Art Nouveau");


SELECT * FROM examplespart1.artwork;

ALTER TABLE artwork
ADD on_display BOOLEAN;

UPDATE artwork
SET on_display=1
WHERE artwork_id=3;

UPDATE artwork
SET on_display=1, style="Baroque"
WHERE artwork_id=2;

INSERT INTO artwork
VALUES (5, "Vase with Twelve Sunflowers", "Van Gogh", "Post-Impressionism", 0),
(6, "The Church at Auvers", "Van Gogh", "Post-Impressionism", 0),
(7, "Still Life with a Curtain", "Paul Cezanne", "Post-Impressionism", 1),
(8, "The Milkmaid", "Vermeer", "Baroque", 0),
(9, "The Last Supper", "Da Vinci", "Renaissance", 1);

SELECT title, artist, style
FROM artwork
WHERE (style="Post-Impressionism") AND (on_display=0);

SELECT title, artist
FROM artwork
WHERE (artist="Da Vinci") OR (artist="Vermeer");

SELECT * FROM artwork
ORDER BY style ASC;


DELETE FROM artwork
WHERE artwork_id=6;

CREATE TABLE artist (
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50),
    nationality VARCHAR(20)
);

INSERT INTO artist (full_name, nationality)
VALUES ("Van Gogh", "Dutch"),
("Da Vinci", "Italian"),
("Johannes Vermeer", "Dutch"),
("Salvador Dali", "Spanish"),
("Claude Monet", "French");

SELECT artist
FROM artwork
INNER JOIN artist ON artwork.artist = artist.full_name;

SELECT DISTINCT artist
FROM artwork
INNER JOIN artist ON artwork.artist = artist.full_name;

SELECT DISTINCT title, artist, nationality
FROM artwork
LEFT JOIN artist ON artwork.artist = artist.full_name;

SELECT DISTINCT title, style, full_name, nationality
FROM artwork
RIGHT JOIN artist ON artwork.artist = artist.full_name;

SELECT * FROM artwork LEFT JOIN artist ON artwork.artist = artist.full_name
UNION	
SELECT * FROM artwork RIGHT JOIN artist ON artwork.artist = artist.full_name;