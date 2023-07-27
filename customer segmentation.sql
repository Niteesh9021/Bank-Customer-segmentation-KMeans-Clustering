
# How many transactions are there in the dataset?

SELECT 
    COUNT(TransactionID) AS total_transaction
FROM
    bank_transactions;

# How many unique customers are present in the data?

SELECT 
    COUNT(DISTINCT CustomerID) AS total_unique_customers
FROM
    bank_transactions;

# How many male and female customers are there?

SELECT 
    CustGender, COUNT(*) AS total
FROM
    bank_transactions
GROUP BY CustGender;

# What are the top 25 locations from which customers belong ("CustLocation")?

SELECT 
    CustLocation, COUNT(*) AS total
FROM
    bank_transactions
GROUP BY CustLocation
ORDER BY total DESC
LIMIT 25;

# What is the average account balance ("CustAccountBalance") of customers?

SELECT 
    CustomerID, AVG(CustAccountBalance) AS average_balance
FROM
    bank_transactions
GROUP BY CustomerID
ORDER BY CustomerID;

# What is the total transaction amount for each "TransactionDate"?

SELECT 
    TransactionDate,
    SUM(`TransactionAmount (INR)`) AS total_balance
FROM
    bank_transactions
GROUP BY TransactionDate
ORDER BY TransactionDate;

# What are the busiest times of the day for transactions ("TransactionTime")?

SELECT 
    TransactionTime,
    SUM(`TransactionAmount (INR)`) AS total_balance
FROM
    bank_transactions
GROUP BY TransactionTime
ORDER BY total_balance desc limit 10; 

# What is the average transaction amount ("TransactionAmount") for each gender?

SELECT 
    CustGender, AVG(`TransactionAmount (INR)`) AS total_amount
FROM
    bank_transactions
GROUP BY CustGender;

# How does the transaction amount vary across different locations?

SELECT CustLocation, 
       COUNT(*) AS transaction_count, 
       AVG(`TransactionAmount (INR)`) AS avg_transaction_amount,
       MIN(`TransactionAmount (INR)`) AS min_transaction_amount,
       MAX(`TransactionAmount (INR)`) AS max_transaction_amount
FROM bank_transactions
GROUP BY CustLocation
ORDER BY avg_transaction_amount DESC;

# Which customer have the highest number of transactions?

SELECT 
    CustomerID, COUNT(TransactionID) AS total_transaction
FROM
    bank_transactions
GROUP BY CustomerID
ORDER BY total_transaction DESC limit 1;

# What is the average transaction amount for each customer?

SELECT 
    CustomerID, AVG(`TransactionAmount (INR)`) AS average_amount
FROM
    bank_transactions
GROUP BY CustomerID
ORDER BY CustomerID;

# How many transactions were conducted by each customer on average?

SELECT CustomerID, AVG(transaction_count) AS avg_transactions
FROM (
    SELECT CustomerID, COUNT(TransactionID) AS transaction_count
    FROM bank_transactions
    GROUP BY CustomerID
) AS customer_transactions
GROUP BY CustomerID;

# Retrieve the total sum of TransactionAmount for each CustLocation, considering only transactions made by female customers.

SELECT CustLocation, SUM(`TransactionAmount (INR)`) AS TotalAmount
FROM bank_transactions
WHERE CustGender = 'F' 
GROUP BY CustLocation
ORDER BY TotalAmount DESC;

# List the CustomerID, CustomerDOB, and CustAccountBalance for customers, each with an amount greater than 5000 INR. Sort the results by CustomerID.

SELECT 
    CustomerID, CustomerDOB, CustAccountBalance
FROM
    bank_transactions
WHERE
    `TransactionAmount (INR)` > 5000
GROUP BY CustomerID , CustomerDOB , CustAccountBalance
ORDER BY CustomerID;