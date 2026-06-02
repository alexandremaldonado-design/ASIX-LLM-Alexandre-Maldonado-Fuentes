-- Crear base de dades (opcional)
CREATE DATABASE IF NOT EXISTS bank_db;
USE bank_db;

-- Taula accounts
CREATE TABLE accounts (
    account_id VARCHAR(10) PRIMARY KEY,
    avail_balance DECIMAL(15,2),
    close_date DATE NULL,
    last_activity_date DATE,
    open_date DATE,
    pending_balance DECIMAL(15,2),
    status VARCHAR(10),
    cust_id INT,
    open_emp_id INT,
    open_branch_id VARCHAR(10),
    open_branch_name VARCHAR(100),
    open_branch_address VARCHAR(200),
    open_branch_city VARCHAR(50),
    open_branch_state VARCHAR(10),
    open_branch_zip_code VARCHAR(10),
    product_cd VARCHAR(10),
    product_date_offered DATE,
    product_date_retired DATE NULL,
    product_name VARCHAR(100),
    product_type_cd VARCHAR(20),
    product_type_name VARCHAR(100)
);

-- Taula transactions
CREATE TABLE transactions (
    txn_id VARCHAR(10) PRIMARY KEY,
    amount DECIMAL(15,2),
    funds_avail_date DATETIME,
    txn_date DATETIME,
    txn_type_cd VARCHAR(10),
    account_id VARCHAR(10),
    teller_emp_id INT,
    execution_branch_id VARCHAR(10) NULL,
    execution_branch_name VARCHAR(100) NULL,
    execution_branch_address VARCHAR(200) NULL,
    execution_branch_city VARCHAR(50) NULL,
    execution_branch_state VARCHAR(10) NULL,
    execution_branch_zip_code VARCHAR(10) NULL
);

-- Insertar des del JSON
-- Llegir el fitxer i convertir de binary a utf8mb4
SET @json_accounts = CONVERT(LOAD_FILE('C:/MYSQL/Accounts.json') USING utf8mb4);

-- INSERT amb el JSON convertit
INSERT INTO accounts 
SELECT * FROM JSON_TABLE(@json_accounts, '$.accounts[*]' COLUMNS(
    account_id VARCHAR(10) PATH '$.account_id',
    avail_balance DECIMAL(15,2) PATH '$.avail_balance',
    close_date DATE PATH '$.close_date',
    last_activity_date DATE PATH '$.last_activity_date',
    open_date DATE PATH '$.open_date',
    pending_balance DECIMAL(15,2) PATH '$.pending_balance',
    status VARCHAR(10) PATH '$.status',
    cust_id INT PATH '$.cust_id',
    open_emp_id INT PATH '$.open_emp_id',
    open_branch_id VARCHAR(10) PATH '$.open_branch_id',
    open_branch_name VARCHAR(100) PATH '$.open_branch_name',
    open_branch_address VARCHAR(200) PATH '$.open_branch_address',
    open_branch_city VARCHAR(50) PATH '$.open_branch_city',
    open_branch_state VARCHAR(10) PATH '$.open_branch_state',
    open_branch_zip_code VARCHAR(10) PATH '$.open_branch_zip_code',
    product_cd VARCHAR(10) PATH '$.product_cd',
    product_date_offered DATE PATH '$.product_date_offered',
    product_date_retired DATE PATH '$.product_date_retired',
    product_name VARCHAR(100) PATH '$.product_name',
    product_type_cd VARCHAR(20) PATH '$.product_type_cd',
    product_type_name VARCHAR(100) PATH '$.product_type_name'
)) AS jt;

-- Llegir el fitxer transactions.json
SET @json_transactions = CONVERT(LOAD_FILE('C:/MYSQL/Transactions.json') USING utf8mb4);

-- Insertar les dades a la taula transactions
INSERT INTO transactions 
SELECT * FROM JSON_TABLE(@json_transactions, '$.transactions[*]' COLUMNS(
    txn_id VARCHAR(10) PATH '$.txn_id',
    amount DECIMAL(15,2) PATH '$.amount',
    funds_avail_date DATETIME PATH '$.funds_avail_date',
    txn_date DATETIME PATH '$.txn_date',
    txn_type_cd VARCHAR(10) PATH '$.txn_type_cd',
    account_id VARCHAR(10) PATH '$.account_id',
    teller_emp_id INT PATH '$.teller_emp_id',
    execution_branch_id VARCHAR(10) PATH '$.execution_branch_id',
    execution_branch_name VARCHAR(100) PATH '$.execution_branch_name',
    execution_branch_address VARCHAR(200) PATH '$.execution_branch_address',
    execution_branch_city VARCHAR(50) PATH '$.execution_branch_city',
    execution_branch_state VARCHAR(10) PATH '$.execution_branch_state',
    execution_branch_zip_code VARCHAR(10) PATH '$.execution_branch_zip_code'
)) AS jt;



SET @json = CONVERT(LOAD_FILE('C:/MYSQL/Transactions.json') USING utf8mb4);

SELECT JSON_UNQUOTE(JSON_EXTRACT(value, '$.amount')) AS amount
FROM JSON_TABLE(@json, '$.transactions[*]' COLUMNS(value JSON PATH '$')) AS jt;



SET @json = CONVERT(LOAD_FILE('C:/MYSQL/Transactions.json') USING utf8mb4);

SELECT 
    JSON_UNQUOTE(JSON_EXTRACT(value, '$.txn_id')) AS txn_id,
    JSON_UNQUOTE(JSON_EXTRACT(value, '$.amount')) AS amount,
    JSON_UNQUOTE(JSON_EXTRACT(value, '$.txn_date')) AS txn_date,
    JSON_UNQUOTE(JSON_EXTRACT(value, '$.txn_type_cd')) AS txn_type_cd,
    JSON_UNQUOTE(JSON_EXTRACT(value, '$.account_id')) AS account_id
FROM JSON_TABLE(@json, '$.transactions[*]' COLUMNS(value JSON PATH '$')) AS jt
WHERE JSON_EXTRACT(value, '$.amount') > 200;


SET @json = CONVERT(LOAD_FILE('C:/MYSQL/Transactions.json') USING utf8mb4);

SELECT 
    JSON_UNQUOTE(JSON_EXTRACT(value, '$.txn_id')) AS txn_id,
    JSON_UNQUOTE(JSON_EXTRACT(value, '$.txn_date')) AS txn_date
FROM JSON_TABLE(@json, '$.transactions[*]' COLUMNS(value JSON PATH '$')) AS jt;


SELECT 
    t.account_id,
    t.amount
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id;


SELECT 
    account_id,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY account_id
ORDER BY account_id;