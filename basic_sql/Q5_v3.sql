-- PostgreSQL

-- Solution 3: we use EXISTS

-- create table and insert values

CREATE TABLE q5(
  chef VARCHAR NOT NULL,
  dish VARCHAR NOT NULL,
  PRIMARY KEY (chef, dish)
);

INSERT INTO q5 VALUES
('A','Mint chocolate brownie'),
('B','Upside down pineapple cake'),
('B','Creme brulee'),
('B','Mint chocolate brownie'),
('C','Upside down pineapple cake'),
('C','Creme brulee'),
('D','Apple pie'),
('D','Upside down pineapple cake'),
('D','Creme brulee'),
('E','Apple pie'),
('E','Upside down pineapple cake'),
('E','Creme brulee'),
('E','Bananas Foster');

CREATE TABLE partyDish (
  dish VARCHAR NOT NULL,
  PRIMARY KEY (dish)
);

INSERT INTO partyDish VALUES
('Apple pie'),
('Upside down pineapple cake'),
('Creme brulee');

-- Solution v3: use EXISTS

SELECT chef FROM
(
  SELECT chef, count(chef)
  FROM q5
  WHERE EXISTS
  (
  	SELECT dish
  	FROM partydish
  	WHERE q5.dish = partydish.dish
  )
  GROUP BY chef
) AS chefcandidate
WHERE count = (SELECT count(dish) FROM partydish);
