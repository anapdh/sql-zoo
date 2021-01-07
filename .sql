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

QUIZZ 4

1.
SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

2.
SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

3.
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

4.
Table-D
France
Germany
Russia
Turkey

5.
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

6.
SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')

7.
  
Table-B
Bangladesh
India
Pakistan



=========== SUM and COUNT ===========
his tutorial is about aggregate functions such as COUNT, SUM and AVG. 
An aggregate function takes many values and delivers just one value. 
For example the function SUM would aggregate the values 2, 4 and 5 to deliver the single value 11.

1.
SELECT SUM(population)
FROM world;

2.
SELECT DISTINCT(continent)
FROM world;

3.
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

4.
SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

5.
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

6.
SELECT continent, COUNT(name)
FROM world
GROUP BY(continent);

7.
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

8.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;

QUIZZ 5

1.
 SELECT SUM(population) FROM bbc WHERE region = 'Europe'

2.
 SELECT COUNT(name) FROM bbc WHERE population < 150000

3.
AVG(), COUNT(), MAX(), MIN(), SUM()

4.
No result due to invalid use of the WHERE function

5.
 SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

6.
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

7.
 SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

8.
Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710



=========== The JOIN operation ===========
This tutorial introduces JOIN which allows you to use data from two or more tables.

1.
SELECT matchid, player
FROM goal
WHERE teamid = 'GER';

2.
SELECT id, stadium, team1, team2
  FROM game
WHERE id = 1012

3.
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id = matchid)
WHERE teamid = 'GER'

4.
SELECT team1, team2, player
  FROM game JOIN goal ON (id = matchid)
WHERE player LIKE 'Mario%';

5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
 WHERE gtime <= 10

6.
SELECT mdate, teamname
FROM game JOIN eteam ON team1 = eteam.id
WHERE coach = 'Fernando Santos'

7.
SELECT player
FROM game JOIN goal ON matchid = id
WHERE stadium = 'National Stadium, Warsaw'

8.
SELECT DISTINCT player
FROM game JOIN goal ON (id = matchid)
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER'

9.
SELECT teamname, COUNT(teamid)
FROM goal JOIN eteam ON (teamid = id)
GROUP BY teamname

10.
SELECT stadium, COUNT(*)
FROM game JOIN goal ON (id = matchid)
GROUP BY stadium

11.
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON (id = matchid)
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid

12.
SELECT matchid, mdate, COUNT(*)
FROM game JOIN goal ON (id = matchid)
WHERE teamid = 'GER'
GROUP BY matchid

13.
SELECT mdate, 
	   team1, 
	   SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1, 
	   team2, 
	   SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
	game LEFT JOIN goal ON (id = matchid)
	GROUP BY id
	ORDER BY mdate, matchid, team1, team2

QUIZZ 6

1.
game  JOIN goal ON (id=matchid);

2.
matchid, teamid, player, gtime, id, teamname, coach;

3.
SELECT player, teamid, COUNT(*) FROM game JOIN goal ON matchid = id
  WHERE (team1 = "GRE" OR team2 = "GRE") AND teamid != 'GRE' GROUP BY player, teamid;

4.
SELECT DISTINCT teamid, mdate FROM goal JOIN game on (matchid=id)
  WHERE mdate = '9 June 2012';

5.
SELECT DISTINCT player, teamid FROM game JOIN goal ON matchid = id
  WHERE stadium = 'National Stadium, Warsaw' AND (team1 = 'POL' OR team2 = 'POL') AND teamid != 'POL';

6.
SELECT DISTINCT player, teamid, gtime FROM game JOIN goal ON matchid = id
  WHERE stadium = 'Stadion Miejski (Wroclaw)' AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'));

7.
SELECT teamname, COUNT(*) FROM eteam
  JOIN goal ON teamid = id GROUP BY teamname HAVING COUNT(*) < 3;



=========== More JOIN operations ===========
This tutorial introduces the notion of a join. The database consists of three tables movie , actor and casting.

1.
SELECT id, title
 FROM movie
WHERE yr = 1962

2.
SELECT yr 
FROM movie
WHERE title = 'Citizen Kane'

3.
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

4.
SELECT id
FROM actor
WHERE name = 'Glenn Close'

5.
SELECT id
FROM movie
WHERE title = 'Casablanca'

6.
SELECT actor.name
FROM actor JOIN casting
ON casting.actorid = actor.id
WHERE casting.movieid = 11768;

7.
SELECT actor.name
FROM actor JOIN casting ON casting.actorid = actor.id
JOIN movie ON movie.id = casting.movieid
WHERE movie.title = 'Alien';

8.
SELECT movie.title
FROM movie JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford';

9.
SELECT movie.title
FROM movie JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford'
AND casting.ord != 1;

10.
SELECT movie.title, actor.name
FROM movie JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE movie.yr = 1962 AND casting.ord = 1;

11.
SELECT movie.yr, COUNT(*)
FROM movie JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Rock Hudson'
GROUP BY movie.yr
HAVING COUNT(movie.title) >= 2;

12.
SELECT DISTINCT m.title, a.name
FROM (SELECT movie.*
      FROM movie
      JOIN casting
      ON casting.movieid = movie.id
      JOIN actor
      ON actor.id = casting.actorid
      WHERE actor.name = 'Julie Andrews') AS m
JOIN (SELECT actor.*, casting.movieid AS movieid
      FROM actor
      JOIN casting
      ON casting.actorid = actor.id
      WHERE casting.ord = 1) as a
ON m.id = a.movieid
ORDER BY m.title;

13.
SELECT actor.name
FROM actor JOIN casting ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(*) >= 15;

14.
SELECT title, COUNT(actorid)
FROM movie JOIN casting ON movie.id = movieid WHERE yr = 1978
GROUP BY title ORDER BY COUNT(actorid) DESC, title

15.
SELECT name FROM actor JOIN casting ON actor.id = actorid
WHERE movieid IN
  (SELECT id FROM movie WHERE title IN
    (SELECT title FROM movie JOIN casting ON movie.id = movieid WHERE actorid IN
      (SELECT id FROM actor WHERE name = 'Art Garfunkel')))
  AND name != 'Art Garfunkel'

  QUIZZ 7

1.
SELECT name FROM actor INNER JOIN movie ON actor.id = director
  WHERE gross < budget;

2.
SELECT * FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid;

3.
SELECT name, COUNT(movieid) FROM casting JOIN actor ON actorid=actor.id
  WHERE name LIKE 'John %' GROUP BY name ORDER BY 2 DESC;

4.
SELECT title FROM movie JOIN casting ON (movieid=movie.id)
  JOIN actor   ON (actorid=actor.id) WHERE name='Paul Hogan' AND ord = 1;

5.
SELECT name FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid WHERE ord = 1 AND director = 351;

6.
link the director column in movies with the primary key in actor
connect the primary keys of movie and actor via the casting table


7.
SELECT title, yr FROM movie, casting, actor
  WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3;



  =========== Using Null ===========
This tutorial introduces the notion of a join. The database consists of three tables movie , actor and casting.

1.
SELECT name
FROM teacher
WHERE dept IS NULL

2.
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

3.
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)

4.
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)

5.
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

6.
-

7.
SELECT COUNT(name), COUNT(mobile)
FROM teacher;

8.
SELECT dept.name ,COUNT(teacher.name)
FROM teacher RIGHT OUTER JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name;

9.
SELECT teacher.name, 
CASE WHEN teacher.dept IN (1, 2) THEN 'Sci'
ELSE 'Art'
END
FROM teacher;

10.
SELECT teacher.name, 
CASE WHEN teacher.dept IN (1, 2) THEN 'Sci'
WHEN teacher.dept = 3 THEN 'Art'
ELSE 'None'
END
FROM teacher;

QUIZZ 8

1.
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id);

2.
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower';

3.
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name;

4.
SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher;

5.
SELECT name,
       CASE WHEN phone = 2752 THEN 'two'
            WHEN phone = 2753 THEN 'three'
            WHEN phone = 2754 THEN 'four'
            END AS digit
  FROM teacher;

6.
SELECT name, 
      CASE 
       WHEN dept 
        IN (1) 
        THEN 'Computing' 
       ELSE 'Other' 
      END 
  FROM teacher;
