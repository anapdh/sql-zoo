=========== SELECT basics ===========
Introducing the world table of countries


1.
SELECT population FROM world
  WHERE name = 'Germany'

Correct answer
population
83149300

2.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

Correct answer
name	population
Denmark	5822763
Norway	5367580
Sweden	10338368

3.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

Correct answer
name	area
Belarus	207600
Ghana	238533
Guinea	245857
Guyana	214969
Laos	236800
Romania	238391
Uganda	241550
United Kingdom	242900

=========== QUIZZ 1 ===========

1.
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

2.
Table-E
Albania	3200000
Algeria	32900000

3.
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

4.
name	length(name)
Italy	5
Malta	5
Spain	5

5.
Andorra	936

6.
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000



=========== SELECT from WORLD Tutorial ===========
In this tutorial you will use the SELECT command on the table world.


1.
SELECT name, continent, population FROM world

2.
SELECT name
  FROM world
 WHERE population >= 200000000

3.
SELECT name, gdp / population
  FROM world
WHERE population  > 200000000

4.
SELECT name, population / 1000000
  FROM world
WHERE continent = 'South America'

5.
SELECT name, population
  FROM world
WHERE name IN ('France', 'Germany', 'Italy')

6.
SELECT name
  FROM world
WHERE name LIKE '%United%'

7.
SELECT name, population, area
  FROM world
WHERE area > 3000000 OR population > 250000000

8.
SELECT name, population, area
  FROM world
WHERE area > 3000000 XOR population > 250000000

9.
SELECT name, ROUND(population / 1000000, 2), ROUND(gdp / 1000000000, 2)
  FROM world
WHERE continent = 'South America';

10.
SELECT name, ROUND(gdp / population, -3)
  FROM world
WHERE gdp >= 1000000000000

11.
SELECT name, capital
  FROM world
WHERE LENGTH(name) = LENGTH(capital)

12.
SELECT name, capital
  FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital

13.
SELECT name
  FROM world
WHERE
name LIKE '%a%' AND 
name  LIKE '%e%' AND 
name  LIKE '%i%' AND 
name  LIKE '%o%' AND 
name  LIKE '%u%' AND 
name NOT LIKE '% %'

=========== QUIZZ 2 ===========

1.
SELECT name
  FROM world
 WHERE name LIKE 'U%'

2.
 SELECT population
  FROM world
 WHERE name = 'United Kingdom'

3.
 'name' should be name

4
Nauru	990

5.
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')

6.
 SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')

7.
Brazil
Colombia


=========== SELECT from Nobel Tutorial ===========
This tutorial is concerned with a table of Nobel prize winners:

1.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

 2.
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

3.
SELECT yr, subject
  FROM nobel
WHERE winner = 'Albert Einstein'

4.
SELECT winner
  FROM nobel
WHERE subject = 'Peace' AND yr >= 2000

5.
SELECT yr, subject, winner
  FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

6.
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

7.
SELECT winner
 FROM nobel
WHERE winner LIKE 'John%'

8.
SELECT * FROM nobel
WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984

9.
SELECT * FROM nobel
WHERE yr = 1980 AND subject != 'Chemistry' AND subject != 'Medicine'

10.
SELECT * FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)

11.
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

12.
SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL'

13.
SELECT winner, yr, subject
  FROM nobel
WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner ASC

14.
SELECT winner, subject
  FROM nobel
 WHERE yr = 1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner

 QUIZZ 3

 1.
 SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

 2.
 SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

3.
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

4.
Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet

5.
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

6.
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

7.
Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1



=========== SELECT within SELECT Tutorial ===========
This tutorial looks at how we can use SELECT statements within SELECT statements to perform more complex queries.

1.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

2.
SELECT name FROM world
WHERE continent = 'Europe' AND gdp / population >
(SELECT gdp / population FROM world WHERE name = 'United Kingdom')

3.
SELECT name, continent FROM world
WHERE continent IN 
(SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name ASC;

4.
SELECT name, population FROM world
WHERE population >
(SELECT name FROM world WHERE population > 'Canada' AND population < 'Poland')

5.
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world
WHERE name = 'Germany')*100), '%') FROM world WHERE continent = 'Europe';

6.
SELECT name FROM world
WHERE gdp > ALL
(SELECT gdp FROM world WHERE gdp > 0 AND continent = 'Europe');

7.
SELECT continent, name, area FROM world x
  WHERE area >= ALL
(SELECT area FROM world y WHERE x.continent = y.continent AND y.area>0);

8.
SELECT continent, name FROM world x
WHERE name <= ALL(SELECT name FROM world y WHERE x.continent = y.continent);

9.
SELECT name, continent, population FROM world
WHERE continent IN
(SELECT continent FROM world  x
WHERE 25000000 >= (SELECT MAX(population) FROM world y
WHERE x.continent = y.continent));
or
SELECT y.name, y.continent, y.population
FROM world AS y
JOIN
(SELECT continent,max(population) FROM world
GROUP BY continent
HAVING max(population) <= 25000000) AS x
ON y.continent = x.continent

10.
SELECT name, continent FROM world x
WHERE population > ALL(SELECT 3*population FROM world y WHERE x.continent = y.continent AND x.name <> y.name)

