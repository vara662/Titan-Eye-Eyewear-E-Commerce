

-- 1. Create Table

CREATE TABLE Seller (
    Seller_ID NUMBER PRIMARY KEY,
    Seller_Name VARCHAR2(100),
    Seller_Email VARCHAR2(100),
    Seller_Phone VARCHAR2(15)
);

-- Table created.


-- 2. Insert Values

INSERT INTO Seller
VALUES (1, 'Titan Eye Seller', 'titan.eye@gmail.com', '9876543210');

INSERT INTO Seller
VALUES (2, 'Vision Care Seller', 'vision.care@gmail.com', '8765432109');

COMMIT;

-- 1 row created.
-- 1 row created.
-- Commit complete.


-- 3. Display Seller Table

SELECT * FROM Seller;

-- SELLER_ID  SELLER_NAME           SELLER_EMAIL              SELLER_PHONE
-- ---------  --------------------  ------------------------  ------------
-- 1          Titan Eye Seller      titan.eye@gmail.com       9876543210
-- 2          Vision Care Seller    vision.care@gmail.com     8765432109


-- 4. Seller + Inventory JOIN - Total Stock (Group By)

SELECT
    s.Seller_ID,
    s.Seller_Name,
    SUM(i.Stock_Quantity) AS Total_Stock
FROM Seller s
JOIN Inventory i
    ON s.Seller_ID = i.Seller_ID
GROUP BY s.Seller_ID, s.Seller_Name;

-- SELLER_ID  SELLER_NAME           TOTAL_STOCK
-- ---------  --------------------  -----------
-- 1          Titan Eye Seller      45
-- 2          Vision Care Seller    0
