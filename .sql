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


===========
