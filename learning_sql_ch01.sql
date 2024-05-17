## ----- Chapter 1 ------ 
# these tables have been added to the sakila db as it's wahat's used the
# rest of the Learning SQL book

# create a table

CREATE TABLE person
	(person_id SMALLINT UNSIGNED,
    fname VARCHAR(20),
    lname VARCHAR(20),
    eye_color ENUM('BR', 'BL','GR'),
    birth_date DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code VARCHAR(10),
    CONSTRAINT pk_person PRIMARY KEY (person_id)
    );
    

# show the table definition
DESC person;

# create a favorite food table
CREATE TABLE favorite_food
	(person_id SMALLINT UNSIGNED,
    food VARCHAR(20),
    CONSTRAINT pk_favorite_food PRIMARY KEY (food),
    CONSTRAINT pk_person FOREIGN KEY (person_id)
    REFERENCES person (person_id)
    );

# show the table definition
DESC favorite_food;

# alter table to auto-incremennt person_id
# as running in DB need to disable foreign key constraint first 
set foreign_key_checks= 0;
ALTER TABLE person
	MODIFY person_id SMALLINT UNSIGNED AUTO_INCREMENT;
set foreign_key_checks=1;

# insert into table
INSERT INTO person
	(person_id, fname, lname, eye_color, birth_date)
    VALUES(null, 'Paul', 'Smith', 'BR', '1972-02-27');

# some simply queries to view data
SELECT * FROM person;
SELECT person_id, fname, lname, eye_color, birth_date FROM person
	WHERE person_id=1;
SELECT person_id, fname, lname, eye_color, birth_date FROM person
	WHERE lname='Smith';
    
 
# insert into favorite foods table
INSERT INTO favorite_food (person_id, food)
    VALUE(1, 'Pizza');    
INSERT INTO favorite_food (person_id, food)
    VALUE(1, 'Apple');
INSERT INTO favorite_food (person_id, food)
    VALUE(1, 'Banana');

SELECT * FROM favorite_food
	WHERE person_id = 1;

SELECT p.lname, f.food 
	FROM person p
	JOIN favorite_food f
    ON p.person_id = f.person_id
	WHERE p.person_id = 1;

# insert address in person table
INSERT INTO person
	(person_id, fname, lname, eye_color, birth_date, street, city, state, postal_code)
	VALUE(NULL, 'Mary', 'Jones', 'GR', '1975-08-25', '14 Row Street', 'Perth', 'WA', '6052');
 
# update person 2 to add country
UPDATE person
	SET country = 'Australia'
    WHERE person_id = 2;

# Delete a person
 INSERT INTO person
	(person_id, fname, lname, eye_color, birth_date, street, city, state, postal_code)
	VALUE(NULL, 'Peter', 'Jones', 'GR', '1975-08-25', '14 Row Street', 'Perth', 'WA', '6052');   

DELETE FROM person
	WHERE person_id = 3;

# Explictly state the format of a string (eg. date)
SET birth_date = str_to_date('DEC-21-1980', '%b-%d-%Y');

# delete tables from sakila db
DROP TABLE favorite_food;
DROP TABLE person;

SHOW TABLES;

    
    

    


