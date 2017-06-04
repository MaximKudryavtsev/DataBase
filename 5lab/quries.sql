--1--

--1.1 �������� ������ 2 ������ ������� stock--
SELECT * FROM stock LIMIT 2;

--2--

--2.1 �������� ��� ������ �� ������� stock, ��� ���� name == NULL--
SELECT * FROM stock WHERE empty IS NULL;

--2.2 �������� ��� ������ �� ������� stock, ��� ���� name != NULL--
SELECT * FROM stock WHERE name IS NOT NULL;

--2.3 �������� ��� ������ ������� stock, ��� �������� ���� area ��������� ����� 10 � 100--
SELECT * FROM stock WHERE area BETWEEN 10 AND 100;

--2.4 �������� ��� ������ ������� stock, ��� �������� ���� area ������ � ��������� {11, 30, 200}
SELECT * FROM stock WHERE area IN(11, 30, 200);

--2.5 �������� ��� ������ �� ����� �������--
SELECT * FROM stock WHERE adress = 'ul. petrova';

--2.6 �������� ��� ������ ����� ������� ��  ����� �������--
SELECT * FROM stock WHERE adress != 'ul. petrova';

--3--

--3.1 �������� ��� ������ ��������������� �� ������� �� �����������--
SELECT * FROM stock ORDER BY area ASC;

--3.2 �������� ��� ������ ��������������� �� ������� �� ��������--
SELECT * FROM stock ORDER BY area DESC;

--3.3 �������� ��� ������ ��������������� �� ����� �� �����������--
--� ���� ����� ���������, �� ����������� �� �������� �� �������--
SELECT * FROM stock ORDER BY adress ASC, area DESC;

--3.4 �������� ��� ������ �� ������� �������� (id_stock) �� �����������--
SELECT * FROM stock ORDER BY id_stock ASC;

--4--

--4.1 �������� ����� � ����������� ��������--
SELECT MIN(area) FROM stock;

--4.2 �������� ����� � ������������ ��������--
SELECT MAX(area) FROM stock;

--4.3 �������� ������� �������������� ��������--
SELECT AVG(area) FROM stock;

--4.4 �������� ����� ���� �������� �������--
SELECT SUM(area) FROM stock;

--5--

--5.1 �������� ������ ���������� ����, �� ������� ��������� ������--
SELECT DISTINCT adress FROM stock;

--5.2 �������� ������ ���������� ����--
SELECT COUNT(DISTINCT adress) FROM stock;

--6--

--6.1 �������� ������� ������� ������ �� ������ �����--
SELECT adress, AVG(area) FROM stock GROUP BY adress;

--6.2 �������� ������� ������� ������ �� ������ �����, ���� ������� > 15 --
SELECT adress, AVG(area) FROM stock WHERE area > 15 GROUP BY adress;

--6.3 ��������--
SELECT adress, AVG(area) FROM stock GROUP BY adress HAVING AVG(area) > 50;