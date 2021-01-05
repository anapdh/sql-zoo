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


=========== ===========