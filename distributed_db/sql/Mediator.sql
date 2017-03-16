PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE rebate_global
(
    model VARCHAR PRIMARY KEY NOT NULL,
    amount INT NOT NULL,
    dealer VARCHAR NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
INSERT INTO "rebate_global" VALUES('Camry',1500,'One',1391230800000,1398830400000);
CREATE TABLE employee
(
    emp_no INT PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    phone VARCHAR NOT NULL,
    position VARCHAR NOT NULL
);
INSERT INTO "employee" VALUES(987,'FRANK','10 BROAD ST','573-555-6666','MANAGER');
CREATE TABLE salesperson
(
    rep_no INT PRIMARY KEY NOT NULL,
    base_salary INT NOT NULL,
    ytd_sales INT NOT NULL,
    comm VARCHAR
);
INSERT INTO "salesperson" VALUES(987,60000,122000,'56000');
CREATE TABLE model
(
    model VARCHAR PRIMARY KEY NOT NULL,
    price REAL NOT NULL,
    type VARCHAR NOT NULL,
    gas_mileage INT NOT NULL,
    seat INT NOT NULL,
    engine real NOT NULL
);
INSERT INTO "model" VALUES('Tacoma',22000.0,'Truck',20,7,4.0);
INSERT INTO "model" VALUES('Tundra',12000.0,'Truck',25,5,5.6);
INSERT INTO "model" VALUES('Avalon',23000.0,'Sedan',34,4,3.5);
INSERT INTO "model" VALUES('Camry',20000.0,'Sedan',30,5,2.3);
INSERT INTO "model" VALUES('4Runner',40000.0,'SUV',20,6,4.0);
INSERT INTO "model" VALUES('RAV4',23000.0,'SUV',30,5,2.0);
CREATE TABLE add_on
(
    package_no INT PRIMARY KEY NOT NULL,
    package_description VARCHAR NOT NULL,
    price REAL NOT NULL,
    model_available VARCHAR NOT NULL
);
INSERT INTO "add_on" VALUES(1,'NAVIGATION',2000.0,'SE, XE, XLE');
INSERT INTO "add_on" VALUES(2,'SECURITY',1200.0,'SE, XE, XLE');
CREATE TABLE potential_buyer
(
    buyer_no VARCHAR PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    phone VARCHAR NOT NULL,
    email VARCHAR NOT NULL
);
INSERT INTO "potential_buyer" VALUES('B023','JOHN SMITH','123 MAIN','573-555-1212','JSMITH@EMAIL.COM');
CREATE TABLE available_auto
(
    serial_no VARCHAR PRIMARY KEY NOT NULL,
    model VARCHAR NOT NULL,
    color VARCHAR NOT NULL,
    dealer VARCHAR NOT NULL
);
INSERT INTO "available_auto" VALUES('S11111','Tacoma','Blue','One');
INSERT INTO "available_auto" VALUES('S12212','Tundra','Silver','Two');
INSERT INTO "available_auto" VALUES('S13313','Camry','Red','One');
INSERT INTO "available_auto" VALUES('S14414','RAV4','Yellow','Two');
CREATE TABLE sales
(
    transaction_no VARCHAR PRIMARY KEY NOT NULL,
    rep_no VARCHAR NOT NULL,
    customer_no VARCHAR NOT NULL,
    veh_no VARCHAR NOT NULL,
    date DATE NOT NULL
);
INSERT INTO "sales" VALUES('t123456','R987','C852','S14414',1391749200000);
CREATE TABLE customer_global
(
    customer_no varchar PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    phone VARCHAR NOT NULL
);
INSERT INTO "customer_global" VALUES('C1234','MARY JONES','23 HILLSIDE','573-555-2345');
COMMIT;
