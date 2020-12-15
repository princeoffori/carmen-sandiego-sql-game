-- find out what language is spoken in this country
SELECT language
FROM countrylanguage
WHERE isofficial = 't' 
AND countrycode = (
   SELECT code 
    FROM country 
    WHERE population = (
    SELECT MIN(population)
    FROM country 
    WHERE region = 'Southern Europe'));

