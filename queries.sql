/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01'  and '2019=12-31';
SELECT name from animals WHERE neutered = true AND escape_attemps < 3 ;
SELECT date_of_birth from animals WHERE name IN('Agumon', 'Pikachu');
SELECT name, escape_attemps  from animals WHERE weight_kg > 10.5 ;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
