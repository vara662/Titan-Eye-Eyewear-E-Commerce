SQL> CREATE TABLE Review (
  2      Review_ID NUMBER PRIMARY KEY,
  3      Customer_ID NUMBER,
  4      Product_ID NUMBER,
  5      Review_Text VARCHAR2(500),
  6      Review_Date DATE,
  7      FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  8      FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
  9  );

Table created.

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

SQL> INSERT INTO Review
  2  (Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
  3  VALUES
  4  (1, 101, 101, 'The frame is stylish and comfortable.', DATE '2026-09-15');

1 row created.

SQL>
SQL> INSERT INTO Review
  2  (Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
  3  VALUES
  4  (2, 102, 102, 'Good quality metal frame with a premium look.', DATE '2026-09-16');

1 row created.

SQL>
SQL> INSERT INTO Review
  2  (Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
  3  VALUES
  4  (3, 103, 103, 'The aviator sunglasses look attractive.', DATE '2026-09-17');

1 row created.

SQL>
SQL> INSERT INTO Review
  2  (Review_ID, Customer_ID, Product_ID, Review_Text, Review_Date)
  3  VALUES
  4  (4, 104, 104, 'Nice round frame and very comfortable to wear.', DATE '2026-09-18');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Review;

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         1         101        101
The frame is stylish and comfortable.
15-SEP-26

         2         102        102
Good quality metal frame with a premium look.
16-SEP-26

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------

         3         103        103
The aviator sunglasses look attractive.
17-SEP-26

         4         104        104
Nice round frame and very comfortable to wear.

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
18-SEP-26


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
  2      r.Review_ID,
  3      r.Customer_ID,
  4      r.Product_ID,
  5      p.Product_Name,
  6      r.Review_Text,
  7      r.Review_Date
  8  FROM Review r
  9  JOIN Product p
 10      ON r.Product_ID = p.Product_ID;

 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         1         101        101
Titan Classic Frame
The frame is stylish and comfortable.
15-SEP-26


 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         2         102        102
Titan Metal Frame
Good quality metal frame with a premium look.
16-SEP-26


 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         3         103        103
Titan Aviator Sunglasses
The aviator sunglasses look attractive.
17-SEP-26


 REVIEW_ID CUSTOMER_ID PRODUCT_ID
---------- ----------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
REVIEW_TEXT
--------------------------------------------------------------------------------
REVIEW_DA
---------
         4         104        104
Titan Round Sunglasses
Nice round frame and very comfortable to wear.
18-SEP-26


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

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------

       103
Titan Aviator Sunglasses
             5

       104
Titan Round Sunglasses

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
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

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------

       103
Titan Aviator Sunglasses
             5

       104
Titan Round Sunglasses

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
AVERAGE_RATING
--------------
             4
