SELECT name
FROM country
WHERE code = (
    SELECT countrycode
    FROM city
    WHERE id IN (
        SELECT id
        FROM city
        WHERE countrycode IN(
            SELECT code 
            FROM country
            WHERE continent = 'South America'
        )
    )
    AND name LIKE CONCAT(SUBSTRING((
        SELECT name
        FROM city
        WHERE countrycode = (SELECT code 
            FROM country 
            WHERE code = (
                SELECT countrycode
                FROM countrylanguage
                WHERE language =  (
                    SELECT language
                    FROM countrylanguage
                    WHERE isofficial = 't' 
                    AND countrycode = (
                        SELECT code 
                        FROM country 
                        WHERE population = (
                            SELECT MIN(population)
                            FROM country 
                            WHERE region = 'Southern Europe'))
                )
                AND percentage = 100
    ))
        AND name != (
            SELECT name 
            FROM country 
            WHERE code = (
                SELECT countrycode
                FROM countrylanguage
                WHERE language =  (
                    SELECT language
                    FROM countrylanguage
                    WHERE isofficial = 't' 
                    AND countrycode = (
                        SELECT code 
                        FROM country 
                        WHERE population = (
                            SELECT MIN(population)
                            FROM country 
                            WHERE region = 'Southern Europe'))
                )
                AND percentage = 100)
    )
    ), 1, 5), '%')
);

-- - **Clue #5:** Oh no, she pulled a switch: there are two cities with very similar names, but in totally different parts of the globe! She's headed to South America as we speak; go find a city whose name is *like* the one we were headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!

