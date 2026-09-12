-- =========================================================
-- SUA duong dan CSV cho dung may ban truoc khi chay
-- =========================================================
USE customer_rfm_analysis;
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
TRUNCATE TABLE transactions;

LOAD DATA LOCAL INFILE 'C:/Users/Admin/Documents/NEW_JOURNEY/PROJECT_3/transactions_clean.csv'
INTO TABLE transactions
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(invoice_no, stock_code, description, quantity, invoice_date, price, customer_id, country, is_cancelled, line_value);

SELECT COUNT(*) AS total_transactions FROM transactions;


TRUNCATE TABLE customer_rfm;

LOAD DATA LOCAL INFILE 'C:/Users/Admin/Documents/NEW_JOURNEY/PROJECT_3/rfm_segments.csv'
INTO TABLE customer_rfm
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(customer_id, monetary, recency, frequency, r_score, f_score, m_score, segment);

SELECT COUNT(*) AS total_customers FROM customer_rfm;

-- Kiem tra thu 1 cau JOIN
SELECT t.invoice_no, t.description, t.line_value, c.segment
FROM transactions t
JOIN customer_rfm c ON t.customer_id = c.customer_id
LIMIT 10;



