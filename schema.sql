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
