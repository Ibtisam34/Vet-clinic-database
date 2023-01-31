/* Populate database with sample data. */
USE VET_CLINIC;
INSERT INTO animals (name, date_of_birth, escape_attemps,neutered,weight_kg) 
VALUES 
('Agumon', '2020-02-03', 0, true, 10.23);
('Gabumon', '2018-11-15', 2, true, 8.00);
('Pikachu', '2021-01-07', 1, false, 15.04);
('Devimon', '2017-05-12', 5, true, 11.00);
 
-- Insert data
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Charmander', '2020-02-08', 0, false, -11.0);
('Plantmon', '2021-11-15', 2, true, -5.7);
('Squirtle', '1993-04-02', 3, false, -12.13);
('Angemon', '2005-06-12', 1, true, -45.0);
('Boarmon', '2005-06-07', 7, true, 20.4);
('Blossom', '1998-10-13', 3, true, 17.0);
('Ditto', '2022-05-14', 4, true, 22.0);

INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34);
  ('Jennifer Orwell', 19);
  ('Bob', 45);
  ('Melody Pond', 77);
  ('Dean Winchester', 14);
  ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');
 UPDATE animals
SET species_id = (
  CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1)
    ELSE (SELECT id FROM species WHERE name = 'Pokemon' LIMIT 1)
  END
),
owner_id = (CASE
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith' LIMIT 1)
    WHEN name = 'Gabumon' THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell' LIMIT 1)
    WHEN name = 'Pikachu' THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell' LIMIT 1)
    WHEN name = 'Devimon' THEN (SELECT id FROM owners WHERE full_name = 'Bob' LIMIT 1)
    WHEN name = 'Plantmon' THEN (SELECT id FROM owners WHERE full_name = 'Bob' LIMIT 1)
    WHEN name = 'Charmander' THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond' LIMIT 1)
    WHEN name = 'Squirtle' THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond' LIMIT 1)
    WHEN name = 'Blossom' THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond' LIMIT 1)
    WHEN name = 'Angemon' THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester' LIMIT 1)
    WHEN name = 'Boarmon' THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester' LIMIT 1)
  END
);

INSERT INTO vets (name, age, date_of_graduation)
VALUES

('Wlliam Tatcher', '45', '2000-4-23');
('Maisy Smith', '26', '2019-1-17');
('Stephanie Mendez', '64', '1981-5-4');
('Jack Harkness', '38', '2008-6-8');


/*Add data to specialization table*/

INSERT INTO specializations (vet_id, species_id) VALUES (1,1) , (3,1), (3,2), (4,2);

/* Add data to visits*/

INSERT INTO visits  (animal_id, vet_id, date ) VALUES 
    (1,1,'2020-05-24');
    (1,3,'2020-07-22');
    (2,4,'2021-02-02');
    (3,2,'2020-01-05');
    (3,2,'2020-03-08');
    (3,2,'2020-05-14');
    (4,3,'2021-05-04');
    (5,4,'2021-02-24');
    (7,2,'2019-12-21');
    (7,1,'2020-08-10');
    (7,2,'2021-04-07');
    (8,3,'2019-09-29');
    (9,4,'2020-10-03');
    (9,4,'2020-11-04');
    (10,2,'2019-01-24');
    (10,2,'2019-05-15');
    (10,2,'2020-02-27');
    (10,2,'2020-08-03');
    (11,3,'2020-05-24'); 
    (11,1,'2021-01-11');

