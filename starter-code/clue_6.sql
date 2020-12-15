-- We're close! Our South American agent says she just got a taxi at the airport, and is headed towards the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll follow right behind you!

SELECT name
FROM city
WHERE id = (
    SELECT capital
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
    )
)