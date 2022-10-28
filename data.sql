/* Populate database with sample data. */
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Pikachu', '2017-01-07', 1, FALSE, 15.04);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);

-- These are the lines for the new project.
INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Charmander', '2020-02-08', 0, FALSE, -11);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.7);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Angemon', '2005-06-12', 1, TRUE, -45);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, TRUE, -20.4);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Blossom', '1998-10-13', 3, TRUE, 17);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Ditto', '2002-05-14', 4, TRUE, 22);

-- I made a mistake when trying to change the weight so I put -20.4 instead of 20.4 so I used this to update the value back
UPDATE animals SET weight_kg = 20.4 WHERE id = 9;

-- Insert data into owners table 
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age) VALUES ('Bob', 45);

INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Insert into species table 

INSERT INTO species (name) VALUES ('Pokemon');

INSERT INTO species (name) VALUES ('Digimon');

-- UPDATE animals where the end is mon
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

-- UPDATE animals where the species_id is empty
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';

UPDATE animals SET owners_id = 2 WHERE name IN ('Gabumon','Pikachu');

UPDATE animals SET owners_id = 3 WHERE name IN ('Devimon','Plantmon');

 UPDATE animals SET owners_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');

 UPDATE animals SET owners_id = 5 WHERE name IN ('Angemon','Boarmon');