--1--

--1.1 получить первые 2 записи таблицы stock--
SELECT * FROM stock LIMIT 2;

--2--

--2.1 получить все записи из таблицы stock, где поле name == NULL--
SELECT * FROM stock WHERE empty IS NULL;

--2.2 получить все записи из таблицы stock, где поле name != NULL--
SELECT * FROM stock WHERE name IS NOT NULL;

--2.3 получить все записи таблицы stock, где значения поля area находится между 10 и 100--
SELECT * FROM stock WHERE area BETWEEN 10 AND 100;

--2.4 получить все записи таблицы stock, где значения поля area входят в множество {11, 30, 200}
SELECT * FROM stock WHERE area IN(11, 30, 200);

--2.5 получить все склады на улице Петрова--
SELECT * FROM stock WHERE adress = 'ul. petrova';

--2.6 получить все склады кроме складов на  улице Петрова--
SELECT * FROM stock WHERE adress != 'ul. petrova';

--3--

--3.1 получить все склады отсортированные по площади по возрастанию--
SELECT * FROM stock ORDER BY area ASC;

--3.2 получить все склады отсортированные по площади по убыванию--
SELECT * FROM stock ORDER BY area DESC;

--3.3 получить все склады отсортированные по улице по возрастанию--
--и если улицы одинаковы, то сортировать по убыванию по площади--
SELECT * FROM stock ORDER BY adress ASC, area DESC;

--3.4 получить все склады по первому атрибуту (id_stock) по возрастанию--
SELECT * FROM stock ORDER BY id_stock ASC;

--4--

--4.1 получить склад с минимальной площадью--
SELECT MIN(area) FROM stock;

--4.2 получить склад с максимальной площадью--
SELECT MAX(area) FROM stock;

--4.3 получить среднее арифметическое площадей--
SELECT AVG(area) FROM stock;

--4.4 получить сумму всех площадей складов--
SELECT SUM(area) FROM stock;

--5--

--5.1 получить список уникальных улиц, на которых находятся склады--
SELECT DISTINCT adress FROM stock;

--5.2 получить список уникальных улиц--
SELECT COUNT(DISTINCT adress) FROM stock;

--6--

--6.1 получить среднюю площадь склада на каждой улице--
SELECT adress, AVG(area) FROM stock GROUP BY adress;

--6.2 получить среднюю площадь склада на каждой улице, если площадь > 15 --
SELECT adress, AVG(area) FROM stock WHERE area > 15 GROUP BY adress;

--6.3 получить--
SELECT adress, AVG(area) FROM stock GROUP BY adress HAVING AVG(area) > 50;