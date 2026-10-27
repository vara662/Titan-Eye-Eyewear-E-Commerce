SQL> SELECT * FROM Product;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
       101
Titan Classic Frame
      2699         30           1

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
Black
Anti-Glare


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
       102
Titan Metal Frame
      3299         15           1

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
Silver
Blue Cut


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
       103
Titan Aviator Sunglasses
      2999         20           2

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
Black
UV Protection


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
       104
Titan Round Sunglasses
      2799         12           2

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
Brown
Polarized


SQL> SELECT Customer.CUSTOMER_ID,
  2         Customer.CUSTOMER_NAME,
  3         Orders.ORDER_ID
  4  FROM Customer
  5  INNER JOIN Orders
  6  ON Customer.CUSTOMER_ID = Orders.CUSTOMER_ID;

no rows selected

SQL> SELECT * FROM Orders;

  ORDER_ID CUSTOMER_ID ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
---------- ----------- --------- ------------ ------------------------------
       101           1 01-SEP-26         4500 Shipped
       102           2 03-SEP-26         4999 Shipped
       103           3 05-SEP-26         5999 Processing
       104           4 07-SEP-26         1999 Delivered
       105           5 10-SEP-26         7499 Pending

SQL> SELECT * FROM Order_Item;

ORDER_ITEM_ID   ORDER_ID PRODUCT_ID   QUANTITY      PRICE
------------- ---------- ---------- ---------- ----------
            1        101        201          2       4500
            2        102        202          1       4800
            3        103        203          1       5999
            4        104        204          1       1999
            5        105        205          1       7499

SQL> SELECT * FROM Payment;

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
       501        101 20-SEP-26 UPI                                      2500
Paid

       502        102 21-SEP-26 Card                                     1800
Paid

       503        103 22-SEP-26 Cash on Delivery                         3200
Paid


PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
       504        104 23-SEP-26 Net Banking                              1500
Failed

       505        105 24-SEP-26 UPI                                      2750
Paid


SQL> SELECT * FROM Customer
  2  WHERE CUSTOMER_ID IN (1, 2, 3, 4, 5);

no rows selected

SQL> UPDATE Orders
  2  SET CUSTOMER_ID = ORDER_ID;

5 rows updated.

SQL> COMMIT;

Commit complete.

SQL> SELECT Customer.CUSTOMER_ID,
  2         Customer.CUSTOMER_NAME,
  3         Orders.ORDER_ID,
  4         Orders.TOTAL_AMOUNT,
  5         Orders.ORDER_STATUS
  6  FROM Customer
  7  INNER JOIN Orders
  8  ON Customer.CUSTOMER_ID = Orders.CUSTOMER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT ORDER_STATUS
------------ ------------------------------
        101 Arun Kumar                                                101
        4500 Shipped

        102 Priya Sharma                                              102
        4999 Shipped

        103 Kavin Raj                                                 103
        5999 Processing


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT ORDER_STATUS
------------ ------------------------------
        104 Divya S                                                   104
        1999 Delivered

        105 Rahul Das                                                 105
        7499 Pending


SQL> SELECT Customer.CUSTOMER_ID,
  2         Customer.CUSTOMER_NAME,
  3         Orders.ORDER_ID,
  4         Orders.TOTAL_AMOUNT,
  5         Orders.ORDER_STATUS
  6  FROM Customer
  7  LEFT JOIN Orders
  8  ON Customer.CUSTOMER_ID = Orders.CUSTOMER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT ORDER_STATUS
------------ ------------------------------
        101 Arun Kumar                                                101
        4500 Shipped

        102 Priya Sharma                                              102
        4999 Shipped

        103 Kavin Raj                                                 103
        5999 Processing


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT ORDER_STATUS
------------ ------------------------------
        104 Divya S                                                   104
        1999 Delivered

        105 Rahul Das                                                 105
        7499 Pending

        107 Vijay Kumar



CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT ORDER_STATUS
------------ ------------------------------
        108 Anitha R


        109 Suresh Babu


        106 Meena Devi



9 rows selected.

SQL> SELECT Customer.CUSTOMER_ID,
  2         Customer.CUSTOMER_NAME,
  3         Orders.ORDER_ID,
  4         Orders.TOTAL_AMOUNT,
  5         Orders.ORDER_STATUS
  6  FROM Customer
  7  RIGHT JOIN Orders
  8  ON Customer.CUSTOMER_ID = Orders.CUSTOMER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT ORDER_STATUS
------------ ------------------------------
        101 Arun Kumar                                                101
        4500 Shipped

        102 Priya Sharma                                              102
        4999 Shipped

        103 Kavin Raj                                                 103
        5999 Processing


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT ORDER_STATUS
------------ ------------------------------
        104 Divya S                                                   104
        1999 Delivered

        105 Rahul Das                                                 105
        7499 Pending


SQL> SELECT * FROM Product;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
       101
Titan Classic Frame
      2699         30           1

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
Black
Anti-Glare


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
       102
Titan Metal Frame
      3299         15           1

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
Silver
Blue Cut


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
       103
Titan Aviator Sunglasses
      2999         20           2

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
Black
UV Protection


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
       104
Titan Round Sunglasses
      2799         12           2

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
     PRICE      STOCK CATEGORY_ID
---------- ---------- -----------
FRAME_COLOR
--------------------------------------------------
LENS_TYPE
--------------------------------------------------------------------------------
Brown
Polarized


SQL> SELECT PRODUCT_ID, PRODUCT_NAME
  2  FROM Product;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
       101
Titan Classic Frame

       102
Titan Metal Frame

       103
Titan Aviator Sunglasses


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
       104
Titan Round Sunglasses


SQL> SELECT ORDER_ITEM_ID, ORDER_ID, PRODUCT_ID
  2  FROM Order_Item;

ORDER_ITEM_ID   ORDER_ID PRODUCT_ID
------------- ---------- ----------
            1        101        201
            2        102        202
            3        103        203
            4        104        204
            5        105        205

SQL> UPDATE Order_Item
  2  SET PRODUCT_ID = ORDER_ITEM_ID + 100;

5 rows updated.

SQL> COMMIT;

Commit complete.

SQL> SELECT PRODUCT_ID, PRODUCT_NAME
  2  FROM Product;

PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
       101
Titan Classic Frame

       102
Titan Metal Frame

       103
Titan Aviator Sunglasses


PRODUCT_ID
----------
PRODUCT_NAME
--------------------------------------------------------------------------------
       104
Titan Round Sunglasses


SQL> SELECT c.CUSTOMER_ID,
  2         c.CUSTOMER_NAME,
  3         o.ORDER_ID,
  4         o.ORDER_DATE,
  5         p.PRODUCT_NAME,
  6         oi.QUANTITY,
  7         oi.PRICE,
  8         o.TOTAL_AMOUNT,
  9         o.ORDER_STATUS
 10  FROM Customer c
 11  INNER JOIN Orders o
 12  ON c.CUSTOMER_ID = o.CUSTOMER_ID
 13  INNER JOIN Order_Item oi
 14  ON o.ORDER_ID = oi.ORDER_ID
 15  INNER JOIN Product p
 16  ON oi.PRODUCT_ID = p.PRODUCT_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT
---------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT ORDER_STATUS
---------- ---------- ------------ ------------------------------
        101 Arun Kumar                                                101
01-SEP-26
Titan Classic Frame
         2       4500         4500 Shipped


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT
---------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT ORDER_STATUS
---------- ---------- ------------ ------------------------------
        102 Priya Sharma                                              102
03-SEP-26
Titan Metal Frame
         1       4800         4999 Shipped


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT
---------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT ORDER_STATUS
---------- ---------- ------------ ------------------------------
        103 Kavin Raj                                                 103
05-SEP-26
Titan Aviator Sunglasses
         1       5999         5999 Processing


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT
---------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT ORDER_STATUS
---------- ---------- ------------ ------------------------------
        104 Divya S                                                   104
07-SEP-26
Titan Round Sunglasses
         1       1999         1999 Delivered


SQL> SELECT c.CUSTOMER_ID,
  2         c.CUSTOMER_NAME,
  3         o.ORDER_ID,
  4         p.PRODUCT_NAME,
  5         oi.QUANTITY,
  6         oi.PRICE,
  7         o.TOTAL_AMOUNT,
  8         o.ORDER_STATUS,
  9         pay.PAYMENT_METHOD,
 10         pay.PAYMENT_AMOUNT,
 11         pay.PAYMENT_STATUS
 12  FROM Customer c
 13  INNER JOIN Orders o
 14  ON c.CUSTOMER_ID = o.CUSTOMER_ID
 15  INNER JOIN Order_Item oi
 16  ON o.ORDER_ID = oi.ORDER_ID
 17  INNER JOIN Product p
 18  ON oi.PRODUCT_ID = p.PRODUCT_ID
 19  LEFT JOIN Payment pay
 20  ON o.ORDER_ID = pay.ORDER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT ORDER_STATUS
---------- ---------- ------------ ------------------------------
PAYMENT_METHOD                 PAYMENT_AMOUNT PAYMENT_STATUS
------------------------------ -------------- ------------------------------
        101 Arun Kumar                                                101
Titan Classic Frame
         2       4500         4500 Shipped
UPI                                      2500 Paid


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT ORDER_STATUS
---------- ---------- ------------ ------------------------------
PAYMENT_METHOD                 PAYMENT_AMOUNT PAYMENT_STATUS
------------------------------ -------------- ------------------------------
        102 Priya Sharma                                              102
Titan Metal Frame
         1       4800         4999 Shipped
Card                                     1800 Paid


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT ORDER_STATUS
---------- ---------- ------------ ------------------------------
PAYMENT_METHOD                 PAYMENT_AMOUNT PAYMENT_STATUS
------------------------------ -------------- ------------------------------
        103 Kavin Raj                                                 103
Titan Aviator Sunglasses
         1       5999         5999 Processing
Cash on Delivery                         3200 Paid


CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE TOTAL_AMOUNT ORDER_STATUS
---------- ---------- ------------ ------------------------------
PAYMENT_METHOD                 PAYMENT_AMOUNT PAYMENT_STATUS
------------------------------ -------------- ------------------------------
        104 Divya S                                                   104
Titan Round Sunglasses
         1       1999         1999 Delivered
Net Banking                              1500 Failed


SQL> SELECT c.CUSTOMER_ID,
  2         c.CUSTOMER_NAME,
  3         o.ORDER_ID,
  4         p.PRODUCT_NAME,
  5         oi.QUANTITY,
  6         oi.PRICE,
  7         o.ORDER_DATE
  8  FROM Customer c
  9  INNER JOIN Orders o
 10  ON c.CUSTOMER_ID = o.CUSTOMER_ID
 11  INNER JOIN Order_Item oi
 12  ON o.ORDER_ID = oi.ORDER_ID
 13  INNER JOIN Product p
 14  ON oi.PRODUCT_ID = p.PRODUCT_ID
 15  ORDER BY c.CUSTOMER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE ORDER_DAT
---------- ---------- ---------
        101 Arun Kumar                                                101
Titan Classic Frame
         2       4500 01-SEP-26

        102 Priya Sharma                                              102
Titan Metal Frame
         1       4800 03-SEP-26

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE ORDER_DAT
---------- ---------- ---------

        103 Kavin Raj                                                 103
Titan Aviator Sunglasses
         1       5999 05-SEP-26

        104 Divya S                                                   104
Titan Round Sunglasses

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
PRODUCT_NAME
--------------------------------------------------------------------------------
  QUANTITY      PRICE ORDER_DAT
---------- ---------- ---------
         1       1999 07-SEP-26


SQL> SELECT c.CUSTOMER_ID,
  2         c.CUSTOMER_NAME,
  3         o.ORDER_ID,
  4         o.ORDER_DATE,
  5         o.TOTAL_AMOUNT,
  6         o.ORDER_STATUS,
  7         pay.PAYMENT_METHOD,
  8         pay.PAYMENT_STATUS
  9  FROM Customer c
 10  INNER JOIN Orders o
 11  ON c.CUSTOMER_ID = o.CUSTOMER_ID
 12  LEFT JOIN Payment pay
 13  ON o.ORDER_ID = pay.ORDER_ID
 14  ORDER BY o.ORDER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
--------- ------------ ------------------------------
PAYMENT_METHOD                 PAYMENT_STATUS
------------------------------ ------------------------------
        101 Arun Kumar                                                101
01-SEP-26         4500 Shipped
UPI                            Paid

        102 Priya Sharma                                              102
03-SEP-26         4999 Shipped
Card                           Paid

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
--------- ------------ ------------------------------
PAYMENT_METHOD                 PAYMENT_STATUS
------------------------------ ------------------------------

        103 Kavin Raj                                                 103
05-SEP-26         5999 Processing
Cash on Delivery               Paid

        104 Divya S                                                   104
07-SEP-26         1999 Delivered

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
ORDER_DAT TOTAL_AMOUNT ORDER_STATUS
--------- ------------ ------------------------------
PAYMENT_METHOD                 PAYMENT_STATUS
------------------------------ ------------------------------
Net Banking                    Failed

        105 Rahul Das                                                 105
10-SEP-26         7499 Pending
UPI                            Paid


SQL> SELECT p.PRODUCT_ID,
  2         p.PRODUCT_NAME,
  3         SUM(oi.QUANTITY) AS TOTAL_QUANTITY_SOLD
  4  FROM Product p
  5  INNER JOIN Order_Item oi
  6  ON p.PRODUCT_ID = oi.PRODUCT_ID
  7  GROUP BY p.PRODUCT_ID, p.PRODUCT_NAME
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


SQL> SELECT c.CUSTOMER_ID,
  2         c.CUSTOMER_NAME,
  3         o.ORDER_ID,
  4         o.TOTAL_AMOUNT,
  5         pay.PAYMENT_ID,
  6         pay.PAYMENT_METHOD,
  7         pay.PAYMENT_AMOUNT,
  8         pay.PAYMENT_STATUS
  9  FROM Customer c
 10  INNER JOIN Orders o
 11  ON c.CUSTOMER_ID = o.CUSTOMER_ID
 12  LEFT JOIN Payment pay
 13  ON o.ORDER_ID = pay.ORDER_ID
 14  ORDER BY o.ORDER_ID;

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT PAYMENT_ID PAYMENT_METHOD                 PAYMENT_AMOUNT
------------ ---------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
        101 Arun Kumar                                                101
        4500        501 UPI                                      2500
Paid

        102 Priya Sharma                                              102
        4999        502 Card                                     1800
Paid

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT PAYMENT_ID PAYMENT_METHOD                 PAYMENT_AMOUNT
------------ ---------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------

        103 Kavin Raj                                                 103
        5999        503 Cash on Delivery                         3200
Paid

        104 Divya S                                                   104
        1999        504 Net Banking                              1500

CUSTOMER_ID CUSTOMER_NAME                                        ORDER_ID
----------- -------------------------------------------------- ----------
TOTAL_AMOUNT PAYMENT_ID PAYMENT_METHOD                 PAYMENT_AMOUNT
------------ ---------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
Failed

        105 Rahul Das                                                 105
        7499        505 UPI                                      2750
Paid


SQL> SELECT o.ORDER_ID,
  2         o.CUSTOMER_ID,
  3         o.TOTAL_AMOUNT,
  4         o.ORDER_STATUS,
  5         pay.PAYMENT_METHOD,
  6         pay.PAYMENT_STATUS
  7  FROM Orders o
  8  INNER JOIN Payment pay
  9  ON o.ORDER_ID = pay.ORDER_ID
 10  WHERE pay.PAYMENT_STATUS = 'Paid'
 11  ORDER BY o.ORDER_ID;

  ORDER_ID CUSTOMER_ID TOTAL_AMOUNT ORDER_STATUS
---------- ----------- ------------ ------------------------------
PAYMENT_METHOD                 PAYMENT_STATUS
------------------------------ ------------------------------
       101         101         4500 Shipped
UPI                            Paid

       102         102         4999 Shipped
Card                           Paid

       103         103         5999 Processing
Cash on Delivery               Paid


  ORDER_ID CUSTOMER_ID TOTAL_AMOUNT ORDER_STATUS
---------- ----------- ------------ ------------------------------
PAYMENT_METHOD                 PAYMENT_STATUS
------------------------------ ------------------------------
       105         105         7499 Pending
UPI                            Paid
