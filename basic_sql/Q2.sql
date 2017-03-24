-- PostgreSQL
-- create table
CREATE TABLE q2 (
  sid INTEGER NOT NULL,
  classname VARCHAR NOT NULL,
  grade VARCHAR NOT NULL,
  PRIMARY KEY (sid, classname)
);

-- insert VALUES
INSERT INTO q2 VALUES
(123,  'ART123',    'A'),
(123,  'BUS456',    'B'),
(666,  'REL100',    'D'),
(666,  'ECO966',    'A'),
(666,  'BUS456',    'B'),
(345,  'BUS456',    'A'),
(345,  'ECO966',    'F');

-- Solution
SELECT classname, count(sid) AS total
INTO classCapacity
FROM q2
GROUP BY classname
ORDER BY total;

SELECT * FROM classCapacity;
