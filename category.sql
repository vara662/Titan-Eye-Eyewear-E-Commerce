CREATE TABLE Category (
    Category_ID NUMBER PRIMARY KEY,
    Category_Name VARCHAR2(100) NOT NULL
);

INSERT INTO Category VALUES (1, 'Eyeglasses');

INSERT INTO Category VALUES (2, 'Sunglasses');

INSERT INTO Category VALUES (3, 'Contact Lenses');

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

