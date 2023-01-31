/*Queries that provide answers to the questions from all projects.*/

-- FINd all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';


--List the name of all animals born between 2016 and 2019
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01'  and '2019-12-31';


--List the name of all animals that are neutered and have less than 3 escape attemps
SELECT name FROM animals WHERE neutered = true AND escape_attemps < 3 ;


--List the date of birth  of all animals names either "Aguman" or "Pikachu"
SELECT date_of_birth from animals WHERE name IN('Agumon', 'Pikachu');


--List the name of all escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attemps  from animals WHERE weight_kg > 10.5 ;


--Find of all animals that are  neutered
SELECT * FROM animals WHERE neutered = true;


--find  of all animals not named Gabumon 
SELECT * FROM animals WHERE name != 'Gabumon';


--Find all animals with a weight between 10.4kg and 17.3kg(including the animals with that equals precisely 10.4kg or 17.3kg) 
SELECT * FROM  animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Update the animals table within a transaction, setting the species column to 'unspecified'
BEGIN;
UPDATE animals
SET species = 'unspecified';
-- Verify the change
SELECT *
FROM animals;
-- Roll back the transaction
ROLLBACK;
-- Verify that the species columns went back to the state before the transaction
SELECT *
FROM animals;
-- Update the animals table within a transaction
BEGIN;
-- Set the species column to 'digimon' for all animals that have a name ending in 'mon'
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
-- Set the species column to 'pokemon' for all animals that don't have a species already set
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
-- Commit the transaction
COMMIT;
-- Verify that the changes were made and persist after the commit
SELECT *
FROM animals;
--delete all records in the animals table,then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;
--verify table still exists
SELECT * FROM animals;

BEGIN;
SAVEPOINT my_savepoint;
DELETE FROM animals WHERE birthdate > '2022-01-01';
ROLLBACK TO my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
UPDATE animals SET weight_kg = ABS( weight_kg);
COMMIT;


SELECT COUNT(*) FROM animals;
SELECT ABS(weight_kg) FROM animals;
SELECT
  neutered,
  AVG(escape_attempts) as average_escape
FROM animals
GROUP BY neutered;
SELECT
  species,
  MIN(weight_kg) as min_weight,
  MAX(weight_kg) as max_weight
FROM animals
GROUP BY species;
SELECT
  species,
  AVG(escape_attempts) as average_escape
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

-- What animals belong to Melody Pond?
SELECT animals.*
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
SELECT *
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.*, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;
-- How many animals are there per species?
SELECT species.name, COUNT(*) as animal_count
FROM species
JOIN animals ON animals.species_id = species.id
GROUP BY species.name;
















