-- PostgreSQL
-- creat table and insert values
CREATE TABLE q4 (
  name VARCHAR NOT NULL,
  address CHAR NOT NULL,
  id INTEGER NOT NULL,
  samefam INTEGER,
  PRIMARY KEY (id)
);

INSERT INTO q4 VALUES
('Alice'  , 'A',      10,  NULL),
('Bob'    , 'B',      15,  NULL),
('Carmen' , 'C',      22,  NULL),
('Diego'  , 'A',      9 ,  10),
('Ella'   , 'B',      3 ,  15),
('Farkhad', 'D',      11,  NULL);

-- Solution
-- Here is the query for finding the person we are looking for
SELECT name FROM q4
WHERE id IN (
  SELECT id
  FROM q4
  WHERE (
    id IN (SELECT samefam FROM q4) AND samefam IS NULL
  )
);
-- and then we delete them from table
DELETE FROM q4
WHERE id IN (
  SELECT id
  FROM q4
  WHERE (
    id IN (SELECT samefam FROM q4) AND samefam IS NULL
  )
);
