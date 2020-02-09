-- drop stuffs if it's already exist
DROP VIEW IF EXISTS joined;
DROP VIEW IF EXISTS toyotas;
DROP TABLE IF EXISTS "public"."make";
DROP TABLE IF EXISTS "public"."cars";

-- create table "cars"
-- "public" is tablespace
-- SERIAL is data type int with auto increament
CREATE TABLE "public"."cars" (
  id SERIAL PRIMARY KEY,
  type TEXT,
  model TEXT,
  cost INT,
  make_id INT
);

-- insert records into "cars"
-- notice we don't need to pass id since it's set to auto increament
INSERT INTO "public"."cars" ("type", "model", "cost", "make_id") VALUES
	('sedan', 'roadster', '33', '2'),
	('sedan', 'prius', '22', '1'),
	('sedan', 'focus', '18', '3'),
	('suv', 'highlander', '40', '1');

-- create table "make"
CREATE TABLE "public"."make" (
  id SERIAL PRIMARY KEY,
  name TEXT
);

-- insert records into "make"
INSERT INTO "public"."make" ("name") VALUES ('toyota'), ('tesla'), ('ford');

-- note: in postbird app, views has blue table icon beside it while normal table has green icon

-- create a view to store the result of our sql select query
CREATE VIEW joined AS
SELECT cars.type, cars.cost, cars.model, make.name
  FROM cars
  INNER JOIN make ON (cars.make_id = make.id) -- join on foreign-primary keys
  ORDER BY cost DESC  LIMIT 30;

CREATE VIEW toyotas AS
SELECT cars.type, cars.cost, cars.model, make.name
  FROM cars
  INNER JOIN make ON (cars.make_id = make.id) -- join on foreign-primary keys
  WHERE make.name = 'toyota'
  ORDER BY cost DESC  LIMIT 30;