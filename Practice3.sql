create table artists(
	artist_id integer primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    country varchar(50)
);

select * from artists;

create table artworks(
	artworks_id integer primary key auto_increment,
    title varchar(50),
    details_id integer,
    artist_id integer,
    style_is integer,
    exhibit_id integer,
    on_display boolean
);

select * from artworks;

create table details(
	details_id integer primary key auto_increment,
    year_created integer,
    media varchar(50)
);

select * from details;

create table styles(
	styles_id integer primary key auto_increment,
    style varchar(50),
    blank1 varchar(50),
    blank2 varchar(50),
    blank3 varchar(50)
);

select * from styles;


