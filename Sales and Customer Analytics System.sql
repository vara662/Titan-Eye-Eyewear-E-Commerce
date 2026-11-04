SQL> SELECT COUNT(*) AS Total_Orders
  2  FROM Orders;

TOTAL_ORDERS
------------
           5

SQL> SELECT SUM(Total_Amount) AS Total_Sales
  2  FROM Orders;

TOTAL_SALES
-----------
      24996

SQL> SELECT AVG(Total_Amount) AS Average_Order
  2  FROM Orders;

AVERAGE_ORDER
-------------
       4999.2

SQL> SELECT MIN(Total_Amount) AS Minimum_Order
  2  FROM Orders;

MINIMUM_ORDER
-------------
         1999

SQL> SELECT MAX(Total_Amount) AS Maximum_Order
  2  FROM Orders;

MAXIMUM_ORDER
-------------
         7499

SQL> SELECT SUM(Total_Amount) AS Total_Sales
  2  FROM Orders;

TOTAL_SALES
-----------
      24996
SQL> SELECT
  2      C.Customer_ID,
  3      C.Customer_Name,
  4      O.Order_ID,
  5      O.Order_Date,
  6      O.Total_Amount,
  7      O.Order_Status
  8  FROM Customer C
  9  INNER JOIN Orders O
 10  ON C.Customer_ID = O.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
--------- ------------ ------------------------------
        101 Arun Kumar                                                101
01-SEP-26         4500 Shipped

        102 Priya Sharma                                              102
03-SEP-26         4999 Shipped

        103 Kavin Raj                                                 103
05-SEP-26         5999 Processing


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
--------- ------------ ------------------------------
        104 Divya S                                                   104
07-SEP-26         1999 Delivered

        105 Rahul Das                                                 105
10-SEP-26         7499 Pending


SQL> SELECT * FROM Category;

CATEGORY_ID
-----------
CATEGORY_NAME
--------------------------------------------------------------------------------
          1
Eyeglasses

          2
Sunglasses

          3
Contact Lenses

SQL> SELECT SUM(TOTAL_AMOUNT) AS TOTAL_SALES
  2  FROM Orders;

TOTAL_SALES
-----------
      24996

SQL> SELECT
  2      C.Customer_ID,
  3      C.Customer_Name,
  4      SUM(O.Total_Amount) AS Total_Purchase
  5  FROM Customer C, Orders O
  6  WHERE C.Customer_ID = O.Customer_ID
  7  GROUP BY C.Customer_ID, C.Customer_Name
  8  ORDER BY C.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME                                      TOTAL_PURCHASE
----------- -------------------------------------------------- --------------
        101 Arun Kumar                                                   4500
        102 Priya Sharma                                                 4999
        103 Kavin Raj                                                    5999
        104 Divya S                                                      1999
        105 Rahul Das                                                    7499

SQL> SELECT
  2      C.Customer_ID,
  3      C.Customer_Name,
  4      SUM(O.Total_Amount) AS Total_Purchase
  5  FROM Customer C, Orders O
  6  WHERE C.Customer_ID = O.Customer_ID
  7  GROUP BY C.Customer_ID, C.Customer_Name
  8  ORDER BY Total_Purchase DESC;

CUSTOMER_ID CUSTOMER_NAME                                      TOTAL_PURCHASE
----------- -------------------------------------------------- --------------
        105 Rahul Das                                                    7499
        103 Kavin Raj                                                    5999
        102 Priya Sharma                                                 4999
        101 Arun Kumar                                                   4500
        104 Divya S                                                      1999

SQL> DESC Product;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PRODUCT_ID                                NOT NULL NUMBER
 PRODUCT_NAME                              NOT NULL VARCHAR2(150)
 PRICE                                              NUMBER(10,2)
 STOCK                                              NUMBER
 CATEGORY_ID                                        NUMBER
 FRAME_COLOR                                        VARCHAR2(50)
 LENS_TYPE                                          VARCHAR2(100)

SQL> DESC Order_Item;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ORDER_ITEM_ID                             NOT NULL NUMBER
 ORDER_ID                                           NUMBER
 PRODUCT_ID                                         NUMBER
 QUANTITY                                           NUMBER
 PRICE                                              NUMBER(10,2)

SQL> SELECT
  2      P.PRODUCT_ID,
  3      P.PRODUCT_NAME,
  4      SUM(OI.QUANTITY) AS TOTAL_QUANTITY_SOLD
  5  FROM Product P, Order_Item OI
  6  WHERE P.PRODUCT_ID = OI.PRODUCT_ID
  7  GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME
  8  ORDER BY TOTAL_QUANTITY_SOLD DESC;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_QUANTITY_SOLD
-------------------
       101
Titan Classic Frame
                  2

       103
Titan Aviator Sunglasses
                  1

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_QUANTITY_SOLD
-------------------

       104
Titan Round Sunglasses
                  1

       102
Titan Metal Frame

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_QUANTITY_SOLD
-------------------
                  1


SQL> SELECT
  2      P.PRODUCT_ID,
  3      P.PRODUCT_NAME,
  4      SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
  5  FROM Product P, Order_Item OI
  6  WHERE P.PRODUCT_ID = OI.PRODUCT_ID
  7  GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME
  8  ORDER BY TOTAL_SALES DESC;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_SALES
-----------
       101
Titan Classic Frame
       9000

       103
Titan Aviator Sunglasses
       5999

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_SALES
-----------

       102
Titan Metal Frame
       4800

       104
Titan Round Sunglasses

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
TOTAL_SALES
-----------
       1999


SQL> SELECT
  2      C.CATEGORY_ID,
  3      C.CATEGORY_NAME,
  4      SUM(OI.QUANTITY * OI.PRICE) AS TOTAL_SALES
  5  FROM Category C, Product P, Order_Item OI
  6  WHERE C.CATEGORY_ID = P.CATEGORY_ID
  7  AND P.PRODUCT_ID = OI.PRODUCT_ID
  8  GROUP BY C.CATEGORY_ID, C.CATEGORY_NAME
  9  ORDER BY TOTAL_SALES DESC;

CATEGORY_ID
-----------
CATEGORY_NAME
--------------------------------------------------------------------------------
TOTAL_SALES
-----------
          1
Eyeglasses
      13800

          2
Sunglasses
       7998

CATEGORY_ID
-----------
CATEGORY_NAME
--------------------------------------------------------------------------------
TOTAL_SALES
-----------
