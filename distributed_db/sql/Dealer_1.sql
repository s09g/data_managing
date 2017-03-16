PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "Representative"
(
    rep_no INT PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    phone VARCHAR(20) NOT NULL,
    base_salary VARCHAR NOT NULL,
    ytd_sales VARCHAR NOT NULL,
    comm VARCHAR
);
INSERT INTO "Representative" VALUES(987,'FRANK DOE','10 BROAD ST','573-555-6666','60000','122000','56000');
CREATE TABLE rebate1
(
    model VARCHAR PRIMARY KEY NOT NULL,
    amount INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
INSERT INTO "rebate1" VALUES('RAV4',1000,1391230800000,1398830400000);
CREATE TABLE Cars
(
    serialNo VARCHAR PRIMARY KEY NOT NULL,
    model VARCHAR NOT NULL,
    color VARCHAR NOT NULL,
    autoTrans varchar NOT NULL,
    warehouse VARCHAR NOT NULL
);
INSERT INTO "Cars" VALUES('S11111','Tacoma','Blue','yes','Bridgeport');
INSERT INTO "Cars" VALUES('S13313','Camry','Red','no','St Charlers');
CREATE TABLE Customer_D1
(
    SerialNo VARCHAR PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    phone VARCHAR NOT NULL
);
INSERT INTO "Customer_D1" VALUES('C1234','MARY JONES','23 HILLSIDE','573-555-2345');
CREATE TABLE "transaction"
(
    deal_no varchar not NULL PRIMARY KEY,
    rep_no varchar NOT NULL,
    customer_no varchar NOT NULL,
    serial_no varchar NOT NULL,
    amount INT NOT NULL,
    fin_amt int NOT NULL,
    date DATE NOT NULL,
    rebate_amt int NOT NULL
);
INSERT INTO "transaction" VALUES('T123456','R987','C852','S13313',20000,10000,1392008400000,1500);
CREATE TABLE loan
(
    serial_no VARCHAR PRIMARY KEY NOT NULL,
    amount INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
INSERT INTO "loan" VALUES('S13313',10000,1392008400000,1550638800000);
COMMIT;
