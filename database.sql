-- =========================================================
-- Bước 1: Tạo database
-- =========================================================
CREATE DATABASE IF NOT EXISTS customer_rfm_analysis
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE customer_rfm_analysis;

-- =========================================================
-- Bước 2: Bảng transactions - dữ liệu giao dịch đã làm sạch
-- (từ file sau khi chạy xong clean_and_rfm.py, TRƯỚC bước tính RFM tổng hợp)
-- =========================================================
CREATE TABLE IF NOT EXISTS transactions (
    invoice_no      VARCHAR(20)   NOT NULL,
    stock_code      VARCHAR(20),
    description     VARCHAR(255),
    quantity        INT           NOT NULL,
    invoice_date    DATETIME      NOT NULL,
    price           DECIMAL(10,2) NOT NULL,
    customer_id     INT           NOT NULL,
    country         VARCHAR(50),
    is_cancelled    TINYINT(1)    NOT NULL,   -- 0 = don that, 1 = don huy
    line_value      DECIMAL(12,2) NOT NULL
);

-- =========================================================
-- Bước 3: Bảng customer_rfm - kết quả RFM + phân khúc từng khách hàng
-- =========================================================
CREATE TABLE IF NOT EXISTS customer_rfm (
    customer_id     INT PRIMARY KEY,
    monetary        DECIMAL(12,2) NOT NULL,
    recency         INT           NOT NULL,
    frequency       INT           NOT NULL,
    r_score         TINYINT       NOT NULL,
    f_score         TINYINT       NOT NULL,
    m_score         TINYINT       NOT NULL,
    segment         VARCHAR(60)   NOT NULL
);

DESCRIBE transactions;
DESCRIBE customer_rfm;