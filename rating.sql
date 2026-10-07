SQL> CREATE TABLE Rating (
  2      Rating_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER,
  4      Product_ID NUMBER,
  5      Rating NUMBER,
  6      Rating_Date DATE,
  7      FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  8      FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
  9  );

Table created.


SQL> INSERT INTO Rating
  2  (Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
  3  VALUES
  4  (1, 101, 101, 5, DATE '2026-09-15');

1 row created.


SQL> INSERT INTO Rating
  2  (Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
  3  VALUES
  4  (2, 102, 102, 4, DATE '2026-09-16');

1 row created.


SQL> INSERT INTO Rating
  2  (Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
  3  VALUES
  4  (3, 103, 103, 5, DATE '2026-09-17');

1 row created.


SQL> INSERT INTO Rating
  2  (Rating_ID, Customer_ID, Product_ID, Rating, Rating_Date)
  3  VALUES
  4  (4, 104, 104, 4, DATE '2026-09-18');

1 row created.


SQL> COMMIT;

Commit complete.


SQL> SELECT * FROM Rating;

 RATING_ID CUSTOMER_ID PRODUCT_ID     RATING RATING_DA
---------- ----------- ---------- ---------- ---------
         1         101        101          5 15-SEP-26
         2         102        102          4 16-SEP-26
         3         103        103          5 17-SEP-26
         4         104        104          4 18-SEP-26


SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      AVG(r.Rating) AS Average_Rating
  5  FROM Product p
  6  JOIN Rating r
  7      ON p.Product_ID = r.Product_ID
  8  GROUP BY
  9      p.Product_ID,
 10      p.Product_Name;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
       101
Titan Classic Frame
             5

       102
Titan Metal Frame
             4

       103
Titan Aviator Sunglasses
             5

       104
Titan Round Sunglasses
             4


SQL> SELECT
  2      p.Product_ID,
  3      p.Product_Name,
  4      AVG(r.Rating) AS Average_Rating
  5  FROM Product p
  6  JOIN Rating r
  7      ON p.Product_ID = r.Product_ID
  8  GROUP BY
  9      p.Product_ID,
 10      p.Product_Name
 11  HAVING AVG(r.Rating) >= 4;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
       101
Titan Classic Frame
             5

       102
Titan Metal Frame
             4

       103
Titan Aviator Sunglasses
             5

       104
Titan Round Sunglasses
             4
