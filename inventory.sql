

-- 1. Create Table

CREATE TABLE Inventory (
    Inventory_ID NUMBER PRIMARY KEY,
    Seller_ID NUMBER,
    Product_ID NUMBER,
    Stock_Quantity NUMBER,
    Product_Status VARCHAR2(20),
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);


-- Table created.


-- 2. Insert Values

INSERT INTO Inventory
VALUES (1001, 1, 101, 25, 'AVAILABLE');

INSERT INTO Inventory
VALUES (1002, 1, 102, 15, 'AVAILABLE');

INSERT INTO Inventory
VALUES (1003, 2, 103, 10, 'AVAILABLE');

COMMIT;


-- 1 row created.
-- 1 row created.
-- 1 row created.
-- Commit complete.


-- 3. Display Full Inventory

SELECT * FROM Inventory;


-- INVENTORY_ID  SELLER_ID  PRODUCT_ID  STOCK_QUANTITY  PRODUCT_STATUS
-- ------------  ---------  ----------  --------------  --------------
-- 1001          1          101         25              AVAILABLE
-- 1002          1          102         15              AVAILABLE
-- 1003          2          103         10              AVAILABLE


-- 4. Update Stock

UPDATE Inventory
SET Stock_Quantity = 30
WHERE Inventory_ID = 1001;

COMMIT;


-- 1 row updated.
-- Commit complete.

-- After Update:
-- INVENTORY_ID  SELLER_ID  PRODUCT_ID  STOCK_QUANTITY  PRODUCT_STATUS
-- ------------  ---------  ----------  --------------  --------------
-- 1001          1          101         30              AVAILABLE
-- 1002          1          102         15              AVAILABLE
-- 1003          2          103         10              AVAILABLE


-- 5. Update Status to UNAVAILABLE

UPDATE Inventory
SET Stock_Quantity = 0,
    Product_Status = 'UNAVAILABLE'
WHERE Product_ID = 103;

COMMIT;


-- 1 row updated.
-- Commit complete.


-- 6. Available Products Only

SELECT *
FROM Inventory
WHERE Product_Status = 'AVAILABLE';

-- Output:
-- INVENTORY_ID  SELLER_ID  PRODUCT_ID  STOCK_QUANTITY  PRODUCT_STATUS
-- ------------  ---------  ----------  --------------  --------------
-- 1001          1          101         30              AVAILABLE
-- 1002          1          102         15              AVAILABLE


-- 7. Unavailable Products Only

SELECT *
FROM Inventory
WHERE Product_Status = 'UNAVAILABLE';

-- Output:
-- INVENTORY_ID  SELLER_ID  PRODUCT_ID  STOCK_QUANTITY  PRODUCT_STATUS
-- ------------  ---------  ----------  --------------  --------------
-- 1003          2          103         0               UNAVAILABLE


-- 8. Auto Status Update using CASE

UPDATE Inventory
SET Product_Status =
    CASE
        WHEN Stock_Quantity > 0 THEN 'AVAILABLE'
        ELSE 'UNAVAILABLE'
    END;

COMMIT;


-- 3 rows updated.
-- Commit complete.
