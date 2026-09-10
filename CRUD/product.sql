CREATE TABLE Product (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(150) NOT NULL,
    Price NUMBER(10,2),
    Stock NUMBER,
    Category_ID NUMBER,
    Frame_Color VARCHAR2(50),
    Lens_Type VARCHAR2(100)
);

ALTER TABLE Product
ADD CONSTRAINT fk_product_category
FOREIGN KEY (Category_ID)
REFERENCES Category(Category_ID);

INSERT INTO Product
(Product_ID, Product_Name, Price, Stock, Category_ID, Frame_Color, Lens_Type)
VALUES
(101, 'Titan Classic Frame', 2499.00, 25, 1, 'Black', 'Anti-Glare');


INSERT INTO Product
(Product_ID, Product_Name, Price, Stock, Category_ID, Frame_Color, Lens_Type)
VALUES
(102, 'Titan Metal Frame', 3299.00, 15, 1, 'Silver', 'Blue Cut');


INSERT INTO Product
(Product_ID, Product_Name, Price, Stock, Category_ID, Frame_Color, Lens_Type)
VALUES
(103, 'Titan Aviator Sunglasses', 2999.00, 20, 2, 'Black', 'UV Protection');


INSERT INTO Product
(Product_ID, Product_Name, Price, Stock, Category_ID, Frame_Color, Lens_Type)
VALUES
(104, 'Titan Round Sunglasses', 2799.00, 12, 2, 'Brown', 'Polarized');


INSERT INTO Product
(Product_ID, Product_Name, Price, Stock, Category_ID, Frame_Color, Lens_Type)
VALUES
(105, 'Daily Contact Lens', 999.00, 50, 3, NULL, 'Monthly');


SELECT * FROM Product;


UPDATE Product
SET Price = 2699.00,
    Stock = 30
WHERE Product_ID = 101;


SELECT * FROM Product
WHERE Product_ID = 101;

COMMIT;


DELETE FROM Product
WHERE Product_ID = 105;


SELECT * FROM Product;

COMMIT;


SELECT
    C.Category_Name,
    P.Product_ID,
    P.Product_Name,
    P.Price,
    P.Stock
FROM Category C
JOIN Product P
ON C.Category_ID = P.Category_ID
ORDER BY C.Category_Name;


SELECT
    C.Category_Name,
    COUNT(P.Product_ID) AS Total_Products,
    NVL(SUM(P.Stock), 0) AS Total_Stock
FROM Category C
LEFT JOIN Product P
ON C.Category_ID = P.Category_ID
GROUP BY C.Category_ID, C.Category_Name
ORDER BY C.Category_Name;
```
