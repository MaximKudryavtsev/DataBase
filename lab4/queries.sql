--1.1--
INSERT INTO client VALUES (null, 'Max', 'Kudryavtsev');

--1.2--
INSERT INTO inventory (id_inventory, weight, description, name) VALUES (NULL, 50, 'cold machine', 'fridge-stinol');

--1.3--
INSERT INTO inventory (id_inventory, weight, description, name) 
        SELECT sale.id_sale, 25, 'hot machine', 'plate' FROM sale WHERE sale.id_sale = 2;
        
--2.1--
DELETE FROM inventory;

--2.2--
DELETE FROM inventory WHERE weight > 10;

--2.3-- 
TRUNCATE contract;

--3.1--
UPDATE inventory SET weight = 20;

--3.2--
UPDATE inventory SET weight = 20 WHERE description = 'cold machine';

--3.3--
UPDATE inventory SET weight = 20, name = 'holodilnik' WHERE description = 'cold machine';

--4.1--
SELECT weight, description FROM inventory;

--4.2--
SELECT * FROM inventory;

--4.3--
SELECT * FROM inventory WHERE name = 'holodilnik';