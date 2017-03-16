-- PostgreSQL
--
-- Solution:
-- We could replace (arrDate, depDate) pair with every record represents a date,
-- since we do not need to concerned with efficiency.
-- Each record will represent a room is used on a date.
--
-- The table will like below.
CREATE TABLE HotelStays(
  roomNum INTEGER NOT NULL,
  inUseDate DATE NOT NULL,
  guestName VARCHAR(50) NOT NULL,
  PRIMARY KEY (roomNum, inUseDate)
);

-- In this case, we will use insert in this way.
-- For guest A

INSERT INTO HotelStays(roomNum, inUseDate, guestName) VALUES
(123, to_date('20160202', 'YYYYMMDD'), 'A'),
(123, to_date('20160203', 'YYYYMMDD'), 'A'),
(123, to_date('20160204', 'YYYYMMDD'), 'A'),
(123, to_date('20160205', 'YYYYMMDD'), 'A'),
(123, to_date('20160206', 'YYYYMMDD'), 'A');

-- And we are not able to enroll for guest B, since Key (roomnum, inusedate)=(123, 2016-02-04) already exists.
/*
INSERT INTO HotelStays(roomNum, inUseDate, guestName) VALUES
(123, to_date('20160204', 'YYYYMMDD'), 'B'),
(123, to_date('20160205', 'YYYYMMDD'), 'B'),
(123, to_date('20160206', 'YYYYMMDD'), 'B'),
(123, to_date('20160207', 'YYYYMMDD'), 'B'),
(123, to_date('20160208', 'YYYYMMDD'), 'B');
*/
-- This sentense are not able to be executed.

-- And we can't write a query for guest C.
