-- Use the new database
USE my_database;

-- Create a table called 'transactions'
CREATE TABLE transactions (
  blockNumber INT,
  timeStamp INT,
  hash VARCHAR(255),
  nonce INT,
  blockHash VARCHAR(255),
  transactionIndex INT,
  fromAddress VARCHAR(255),
  toAddress VARCHAR(255),
  value DECIMAL(30,0),
  gas INT,
  gasPrice DECIMAL(30,0),
  isError INT,
  input VARCHAR(255),
  contractAddress VARCHAR(255),
  cumulativeGasUsed INT,
  gasUsed INT,
  confirmations INT
);

-- Load data from the '/Users/marcuscorbett/Dev/all_transactions.json' file into the 'transactions' table
LOAD DATA INFILE '/Users/marcuscorbett/Dev/all_transactions.json'
INTO TABLE transactions
CHARACTER SET 'utf8'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
