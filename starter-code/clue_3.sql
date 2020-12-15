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
    AND percentage = 100
);