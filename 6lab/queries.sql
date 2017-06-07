--4.1 �������� ������ ���� �����������, ��� ���������� ����� �������--
SELECT film.id_film, film.name, cinema.id_cinema, cinema.name
FROM film
LEFT JOIN cinema ON film.id_film = cinema.id_cinema
WHERE film.name = 'Harry Potter'

1	SIMPLE	film		ref	name	name	1022	const	777	100.00	Using index	
1	SIMPLE	cinema		eq_ref	PRIMARY	PRIMARY	4	6lab-2.film.id_film	1	100.00		

--4.2 �������� ������ ���� �����������, ��� ���������� ����� �������--
SELECT film.id_film, film.name, cinema.id_cinema, cinema.name
FROM cinema
RIGHT JOIN film ON cinema.id_cinema = film.id_film
WHERE film.name = 'Harry Potter';

1	SIMPLE	film		ref	name	name	1022	const	777	100.00	Using index	
1	SIMPLE	cinema		eq_ref	PRIMARY	PRIMARY	4	6lab-2.film.id_film	1	100.00		

--4.3 �������� ������ ���� �����������, ��� ���������� ����� �������, � �������� ��������� Luke--
SELECT film.id_film, film.name, cinema.id_cinema, cinema.name
FROM film
LEFT JOIN cinema ON film.id_film = cinema.id_cinema
WHERE film.name = 'Harry Potter' AND film.screenwriter = 'Luke';

1	SIMPLE	film		ref	name	name	2044	const,const	1	100.00	Using index	
1	SIMPLE	cinema		eq_ref	PRIMARY	PRIMARY	4	6lab-2.film.id_film	1	100.00		

--4.4 �������� ������ �������, ������� ���� � ���������� October � ��������� ������� Taylor--
SELECT film.id_film, film.name, cinema.id_cinema, cinema.name
FROM film
LEFT JOIN cinema ON film.id_film = cinema.id_cinema
WHERE film.screenwriter = 'Taylor' AND cinema.name = 'October';

1	SIMPLE	cinema		ref	PRIMARY,name	name	1022	const	560	100.00	Using where; Using index	
1	SIMPLE	film		eq_ref	PRIMARY	PRIMARY	4	6lab-2.cinema.id_cinema	1	10.00	Using where	

--4.5--
SELECT actor.name, manger.name, film.name
FROM actor
LEFT JOIN film ON actor.id_actor = film.id_film
LEFT JOIN manger ON film.id_film = manger.id_manager
WHERE actor.name = 'Oliver Phelps ' AND manger.name = 'Richard' AND film.name = 'Harry Potter';

1	SIMPLE	film		ref	PRIMARY,name	name	1022	const	777	100.00	Using where; Using index	
1	SIMPLE	actor		eq_ref	PRIMARY	PRIMARY	4	6lab-2.film.id_film	1	10.00	Using where	
1	SIMPLE	manger		eq_ref	PRIMARY	PRIMARY	4	6lab-2.film.id_film	1	10.00	Using where	
_______________________________________________________________________________________________________________________________________________
sdano
_______________________________________________________________________________________________________________________________________________


--4.6 ������� ��� ������, ��� id_film == id_cinema � ��� ���������� Super-8--
SELECT * FROM film WHERE id_film IN
(SELECT cinema.id_cinema FROM cinema WHERE cinema.name = 'Super-8')

1	SIMPLE	cinema		ALL	PRIMARY				14798	10.00	Using where	
1	SIMPLE	film		eq_ref	PRIMARY	PRIMARY	4	6-2.cinema.id_cinema	1	100.00		

--4.7 ������� ����������,� ������� ���������� ������, ����� ����������� ������� == 4 �������--
SELECT * FROM cinema WHERE id_cinema IN
(SELECT film.id_film FROM film WHERE film.screenwriter LIKE '____')

1	SIMPLE	film		ALL	PRIMARY				14736	11.11	Using where	
1	SIMPLE	cinema		eq_ref	PRIMARY	PRIMARY	4	6-2.film.id_film	1	100.00		

--4.8--
SELECT * FROM film ORDER BY screenwriter;

1	SIMPLE	film		ALL					14736	100.00	Using filesort	

--4.9--
SELECT * FROM film ORDER BY screenwriter AND name;

1	SIMPLE	film		ALL					14736	100.00	Using filesort	


