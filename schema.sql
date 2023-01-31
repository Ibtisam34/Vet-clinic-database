/* Database schema to keep the structure of entire database. */
CREATE DATABASE VET_CLINIC:

USE VET_CLINIC;

CREATE TABLE animals (
 id BIGSERIAL NOT NULL PRIMARY KEY,
 name VARCHAR(255) NOT NULL,
 date_of_birth DATE NOT NULL,
 escape_attemps INT NOT NULL,
 neutered BOOLEAN NOT NULL,
 weight_kg DECIMAL(5,2) NOT NULL
);

-- Add a column species of type string to the animals table
ALTER TABLE animals
ADD COLUMN species varchar(255);

CREATE TABLE owners (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);
CREATE TABLE species (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255)
);ALTER TABLE animals
ADD COLUMN species_id INTEGER,
ADD COLUMN owner_id INTEGER,
DROP COLUMN species;ALTER TABLE animals
ADD CONSTRAINT fk_species_id
FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals
ADD CONSTRAINT fk_owner_id
FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  species_id INT,
  vet_id INT,
  FOREIGN KEY (species_id) REFERENCES species(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);
CREATE TABLE visits (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  animal_id INT,
  vet_id INT,
  date DATE,
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);







