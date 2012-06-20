DROP TABLE IF EXISTS ACCOUNTS;
DROP TABLE IF EXISTS CART;
DROP TABLE IF EXISTS PURCHASES;
DROP TABLE IF EXISTS LOCATIONS;
DROP TABLE IF EXISTS COUPONS;

CREATE TABLE LOCATIONS (
	LOC_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	LOC_NAME VARCHAR(30),
	LOC_STATE CHAR(2),
	LOC_ZIP INT
);

CREATE TABLE ACCOUNTS (
	ACCT_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	ACCT_NAME VARCHAR(30),
	ACCT_PASS varchar(40),
	ACCT_EMAIL varchar(32),
	ACCT_SQUEST varchar(100),
	ACCT_SANSER varchar(100),
	ACCT_JOIN TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	ACCT_LOC INT
);

CREATE TABLE COUPONS (
	COUP_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	COUP_NAME varchar(30),
	COUP_TOTAL INT,
	COUP_LEFT INT,
	COUP_PRICE DECIMAL(6,2),
	COUP_CATNAME VARCHAR(20),
	COUP_VENDOR VARCHAR(30),
	COUP_DESC VARCHAR(1000),
	COUP_START TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	COUP_EXPR TIMESTAMP
);

CREATE TABLE CART (
	CART_ID INT NOT NULL,
	CART_ACCT_ID INT NOT NULL,
	CART_COUP_ID INT NOT NULL,
	CART_NUMB INT,
	CART_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PURCHASES (
	PUR_ID INT NOT NULL,
	PUR_ACCT_ID INT NOT NULL,
	PUR_COUP_ID INT NOT NULL,
	PUR_NUMB INT,
	PUR_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX LOC_INDEX ON LOCATIONS(LOC_ID ASC);
CREATE UNIQUE INDEX ACCT_INDEX ON ACCOUNTS(ACCT_ID ASC);
CREATE UNIQUE INDEX COUP_INDEX ON COUPONS(COUP_ID ASC);
CREATE INDEX CART_INDEX ON CART(CART_ID ASC);
CREATE INDEX PUR_INDEX ON PURCHASES(PUR_ID ASC);

ALTER TABLE ACCOUNTS ADD CONSTRAINT ACCTFK_LOC FOREIGN KEY(ACCT_LOC) REFERENCES LOCATIONS(LOC_ID);
ALTER TABLE CART ADD CONSTRAINT CARTFK_ACCT FOREIGN KEY(CART_ACCT_ID) REFERENCES ACCOUNTS(ACCT_ID);
ALTER TABLE CART ADD CONSTRAINT CARTFK_COUP FOREIGN KEY(CART_COUP_ID) REFERENCES COUPONS(COUP_ID);
ALTER TABLE PURCHASES ADD CONSTRAINT PURFK_ACCT FOREIGN KEY(PUR_ACCT_ID) REFERENCES ACCOUNTS(ACCT_ID);
ALTER TABLE PURCHASES ADD CONSTRAINT PURFK_COUP FOREIGN KEY(PUR_COUP_ID) REFERENCES COUPOUNS(COUP_ID);

