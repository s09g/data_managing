-- PostgreSQL
-- create table
CREATE TABLE q3 (
  projectid VARCHAR NOT NULL,
  step INTEGER NOT NULL,
  status CHAR NOT NULL,
  PRIMARY KEY (projectid, step)
);

-- insert value
INSERT INTO q3 VALUES
('P100',0,'C'),
('P100',1,'W'),
('P100',2,'W'),
('P201',0,'C'),
('P201',1,'C'),
('P333',0,'W'),
('P333',1,'W'),
('P333',2,'W'),
('P333',3,'W');

-- solution
SELECT projectid
FROM (
  SELECT projectid, count(projectid)
  FROM q3
  WHERE status = 'C'
  GROUP BY projectid
) AS tmp
WHERE count = 1;
