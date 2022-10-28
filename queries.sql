/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND  '2019-12-31';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name='Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg < 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg  >= 10.4 AND weight_kg <= 17.3;

-- DAY 2

-- Set the species column to some text and then turning it back to the first state.
BEGIN;

UPDATE animals

SET species = 'unspecified';

ROLLBACK;

-- Transaction 2 this is where I change the values of species according to the conditions that I set.
BEGIN;

UPDATE animals

SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals

SET species = 'pokemon' WHERE species IS NULL;

COMMIT;

-- Transaction 3 Where I delete all from the table and hold my breath till I rollback all the changes. LOL

BEGIN;

DELETE FROM animals;

ROLLBACK;

-- Transaction 4

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SP1;

UPDATE animals SET weight_kg = weight_kg * - 1 WHERE weight_kg < 0;

COMMIT;

-- QUERY

-- How many animals are there?
SELECT COUNT(id) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) AS avg_weight FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts) AS escapeattemps 
FROM animals 
GROUP BY neutered 
ORDER BY escapeattemps  DESC;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg) AS max_weight, MIN(weight_kg) AS min_weight 
FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '1999-12-31' 
GROUP BY species;

SELECT name, owners.full_name AS owner FROM animals INNER JOIN owners ON owners_id = owners.id WHERE full_name = 'Melody Pond';

SELECT animal.name, type.name FROM animals AS animal INNER JOIN species AS type ON species_id = type.id WHERE type.name = 'Pokemon';

SELECT owners.full_name,animals.name as animal_name FROM owners LEFT JOIN animals ON owners.id = animals.owners_id;

SELECT species.name,COUNT(*) FROM animals LEFT JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name FROM animals LEFT JOIN species ON animals.species_id = species.id LEFT JOIN owners ON owners_id = owners.id WHERE species.name = 'Digimon' AND full_name = 'Jennifer Orwell';

SELECT animals.name FROM animals LEFT JOIN owners ON animals.owners_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT full_name, COUNT(*) FROM animals LEFT JOIN owners ON owners_id = owners.id GROUP BY full_name ORDER BY COUNT(*);

SELECT full_name, COUNT(*) FROM animals LEFT JOIN owners ON owners_id = owners.id GROUP BY full_name ORDER BY COUNT(*) DESC LIMIT 1;