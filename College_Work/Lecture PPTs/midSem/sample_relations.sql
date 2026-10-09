-- =============================================
-- DROP TABLES IF THEY ALREADY EXIST
-- =============================================
USE midsem_db;

DROP TABLE IF EXISTS depositor;
DROP TABLE IF EXISTS borrower;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS credit_info;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS branch;


-- =============================================
-- CREATE ALL TABLES
-- =============================================

CREATE TABLE branch (
    branch_name CHAR(15) NOT NULL,
    branch_city CHAR(30),
    assets INTEGER,
    PRIMARY KEY (branch_name),
    CHECK (assets >= 0)
);


CREATE TABLE customer (
    customer_name CHAR(20) NOT NULL,
    customer_street CHAR(30),
    customer_city CHAR(30),
    PRIMARY KEY (customer_name)
);


CREATE TABLE loan (
    loan_number CHAR(10) NOT NULL,
    branch_name CHAR(15),
    amount NUMERIC(12,2),
    PRIMARY KEY (loan_number),
    FOREIGN KEY (branch_name)
        REFERENCES branch(branch_name)
);


CREATE TABLE borrower (
    customer_name CHAR(20) NOT NULL,
    loan_number CHAR(10) NOT NULL,
    PRIMARY KEY (customer_name, loan_number),
    FOREIGN KEY (customer_name)
        REFERENCES customer(customer_name),
    FOREIGN KEY (loan_number)
        REFERENCES loan(loan_number)
);


CREATE TABLE account (
    account_number CHAR(10) NOT NULL,
    branch_name CHAR(15),
    balance INTEGER,
    PRIMARY KEY (account_number),
    FOREIGN KEY (branch_name)
        REFERENCES branch(branch_name)
);


CREATE TABLE depositor (
    customer_name CHAR(20) NOT NULL,
    account_number CHAR(10) NOT NULL,
    PRIMARY KEY (customer_name, account_number),
    FOREIGN KEY (customer_name)
        REFERENCES customer(customer_name),
    FOREIGN KEY (account_number)
        REFERENCES account(account_number)
);


CREATE TABLE credit_info (
    customer_name CHAR(20),
    credit_limit NUMERIC(12,2),
    credit_balance NUMERIC(12,2)
);


-- =============================================
-- INSERT DATA INTO BRANCH
-- =============================================

INSERT INTO branch
    (branch_name, branch_city, assets)
VALUES
    ('Brighton',   'Brooklyn',   7100000),
    ('Downtown',   'Brooklyn',   9000000),
    ('Mianus',     'Horseneck',   400000),
    ('North Town', 'Rye',        3700000),
    ('Perryridge', 'Horseneck',  1700000),
    ('Pownal',     'Bennington',  300000),
    ('Redwood',    'Palo Alto',  2100000),
    ('Round Hill', 'Horseneck',  8000000);


-- =============================================
-- INSERT DATA INTO CUSTOMER
-- =============================================

INSERT INTO customer
    (customer_name, customer_street, customer_city)
VALUES
    ('Adams',   'Spring',    'Pittsfield'),
    ('Brooks',  'Senator',   'Brooklyn'),
    ('Curry',   'North',     'Rye'),
    ('Glenn',   'Sand Hill', 'Woodside'),
    ('Green',   'Walnut',    'Stamford'),
    ('Hayes',   'Main',      'Harrison'),
    ('Johnson', 'Alma',      'Palo Alto'),
    ('Jones',   'Main',      'Harrison'),
    ('Lindsay', 'Park',      'Pittsfield'),
    ('Smith',   'North',     'Rye'),
    ('Turner',  'Putnam',    'Stamford'),
    ('Williams','Nassau',    'Princeton'),
    ('Jackson', NULL, NULL);


-- =============================================
-- INSERT DATA INTO LOAN
-- =============================================

INSERT INTO loan
    (loan_number, branch_name, amount)
VALUES
    ('L-11',  'Round Hill',  900),
    ('L-14',  'Downtown',   1500),
    ('L-15',  'Perryridge', 1500),
    ('L-16',  'Perryridge', 1300),
    ('L-17',  'Downtown',   1000),
    ('L-23',  'Redwood',    2000),
    ('L-93',  'Mianus',      500),
    ('L-155', NULL, NULL),
    ('L-170', 'Downtown',   3000),
    ('L-230', 'Redwood',    4000),
    ('L-260', 'Perryridge', 1700);

-- =============================================
-- INSERT DATA INTO BORROWER
-- =============================================

INSERT INTO borrower
    (customer_name, loan_number)
VALUES
    ('Adams',    'L-16'),
    ('Curry',    'L-93'),
    ('Hayes',    'L-15'),
    ('Jackson',  'L-14'),
    ('Jones',    'L-17'),
    ('Smith',    'L-11'),
    ('Smith',    'L-23'),
    ('Williams', 'L-17');


-- =============================================
-- INSERT DATA INTO ACCOUNT
-- =============================================

INSERT INTO account
    (account_number, branch_name, balance)
VALUES
    ('A-101', 'Downtown',    500),
    ('A-102', 'Perryridge',  400),
    ('A-201', 'Brighton',    900),
    ('A-215', 'Mianus',      700),
    ('A-217', 'Brighton',    750),
    ('A-222', 'Redwood',     700),
    ('A-305', 'Round Hill',  350);


-- =============================================
-- INSERT DATA INTO DEPOSITOR
-- =============================================

INSERT INTO depositor
    (customer_name, account_number)
VALUES
    ('Hayes',   'A-102'),
    ('Johnson', 'A-101'),
    ('Johnson', 'A-201'),
    ('Jones',   'A-217'),
    ('Lindsay', 'A-222'),
    ('Smith',   'A-215'),
    ('Turner',  'A-305');


-- =============================================
-- INSERT DATA INTO CREDIT_INFO
-- =============================================

INSERT INTO credit_info
    (customer_name, credit_limit, credit_balance)
VALUES
    ('Curry', 2000, 1750),
    ('Hayes', 1500, 1500),
    ('Jones', 6000, 700),
    ('Smith', 2000, 400);