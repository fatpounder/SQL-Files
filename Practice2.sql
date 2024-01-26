create table plant (
    plant_name VARCHAR(50),
    zone integer,
    season varchar(50)
);

select * from plant;

alter table plant
add plant_id integer primary key auto_increment;

create table seeds (
    expiration_date date,
    quantity integer,
    reorder boolean,
    plant_id integer,
    foreign key (plant_id) references plant(plant_id)
);

alter table seeds
add seed_id integer primary key auto_increment;

select * from seeds;

create table garden_bed(
	date_planted date,
    doing_well boolean,
    plant_id integer,
    foreign key (plant_id) references plant(plant_id)
);

alter table garden_bed
add space_number integer primary key auto_increment;

select * from garden_bed;

select * from seeds
inner join garden_bed ON (seeds.plant_id=garden_bed.plant_id);

select * from garden_bed
left join seeds ON garden_bed.plant_id=seeds.plant_id;  

SELECT *
FROM seeds
RIGHT JOIN garden_bed ON seeds.plant_id=garden_bed.plant_id;

SELECT plant_name
FROM plant
INNER JOIN
        (SELECT seeds.plant_id FROM seeds INNER JOIN garden_bed ON seeds.plant_id=garden_bed.plant_id) AS planted_plants ON plant.plant_id=planted_plants.plant_id;