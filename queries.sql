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

SELECT a.*
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'William Tatcher'
ORDER BY v.date DESC
LIMIT 1;
SELECT COUNT(DISTINCT a.id)
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Stephanie Mendez';
SELECT a.*
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Stephanie Mendez'
AND v.date BETWEEN '2020-04-01' AND '2020-08-30';
SELECT a.*, COUNT(a.id)
FROM animals a
JOIN visits v ON a.id = v.animal_id
GROUP BY a.id
ORDER BY COUNT(a.id) DESC
LIMIT 1;
SELECT a.*
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Maisy Smith'
ORDER BY v.date
LIMIT 1;
SELECT a.*, vt.*, v.date
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vt ON vt.id = v.vet_id
ORDER BY v.date DESC
LIMIT 1;
SELECT species.name AS MARY_SMITH_should_specialse_on FROM visits
JOIN vets ON visits.vet_id=vets.id 
JOIN animals ON visits.animal_id=animals.id 
JOIN species ON animals.species_id=species.id 
WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Maisy Smith') 
GROUP BY species.name 
ORDER BY COUNT(visits.animal_id) DESC LIMIT 1;

SELECT * FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com'; 
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
