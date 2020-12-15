-- Find the country in southern europe with the least population
SELECT name 
FROM country
WHERE population = (
    SELECT MIN(population)
    FROM country 
    WHERE region = 'Southern Europe');