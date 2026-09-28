SQL> CREATE TABLE Payment (
  2      Payment_ID NUMBER PRIMARY KEY,
  3      Order_ID NUMBER,
  4      Payment_Date DATE,
  5      Payment_Method VARCHAR2(30),
  6      Payment_Amount NUMBER(10,2),
  7      Payment_Status VARCHAR2(30),
  8      FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
  9  );

Table created.

SQL> INSERT INTO Payment VALUES
  2  (501, 101, TO_DATE('20-09-2026','DD-MM-YYYY'), 'UPI', 2500.00, 'Paid');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (502, 102, TO_DATE('21-09-2026','DD-MM-YYYY'), 'Card', 1800.00, 'Paid');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (503, 103, TO_DATE('22-09-2026','DD-MM-YYYY'), 'Cash on Delivery', 3200.00, 'Pending');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (504, 104, TO_DATE('23-09-2026','DD-MM-YYYY'), 'Net Banking', 1500.00, 'Failed');

1 row created.

SQL> INSERT INTO Payment VALUES
  2  (505, 105, TO_DATE('24-09-2026','DD-MM-YYYY'), 'UPI', 2750.00, 'Paid');

1 row created.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT *
  2  FROM Payment
  3  WHERE Payment_Status = 'Paid';

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
       501        101 20-SEP-26 UPI                                      2500
Paid

       502        102 21-SEP-26 Card                                     1800
Paid

       505        105 24-SEP-26 UPI                                      2750
Paid


SQL> SELECT *
  2  FROM Payment
  3  WHERE Payment_Status IN ('Failed', 'Pending');

PAYMENT_ID   ORDER_ID PAYMENT_D PAYMENT_METHOD                 PAYMENT_AMOUNT
---------- ---------- --------- ------------------------------ --------------
PAYMENT_STATUS
------------------------------
       503        103 22-SEP-26 Cash on Delivery                         3200
Pending

       504        104 23-SEP-26 Net Banking                              1500
Failed


SQL> UPDATE Payment
  2  SET Payment_Status = 'Paid'
  3  WHERE Payment_ID = 503;

1 row updated.

SQL>
SQL> COMMIT;

Commit complete.

SQL> SELECT Payment_Method, COUNT(*) AS Total_Transactions
  2  FROM Payment
  3  GROUP BY Payment_Method;

PAYMENT_METHOD                 TOTAL_TRANSACTIONS
------------------------------ ------------------
UPI                                             2
Card                                            1
Cash on Delivery                                1
Net Banking                                     1

SQL> SELECT Payment_Method,
  2         SUM(Payment_Amount) AS Total_Amount
  3  FROM Payment
  4  GROUP BY Payment_Method;

PAYMENT_METHOD                 TOTAL_AMOUNT
------------------------------ ------------
UPI                                    5250
Card                                   1800
Cash on Delivery                       3200
Net Banking                            1500

SQL> SELECT
  2      Payment_ID,
  3      Order_ID,
  4      Payment_Date,
  5      Payment_Method,
  6      Payment_Amount,
  7      Payment_Status
  8  FROM Payment
  9  ORDER BY Payment_Date;

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


SQL> SELECT
  2      o.Customer_ID,
  3      p.Order_ID,
  4      p.Payment_ID,
  5      p.Payment_Date,
  6      p.Payment_Method,
  7      p.Payment_Amount,
  8      p.Payment_Status
  9  FROM Orders o
 10  JOIN Payment p
 11  ON o.Order_ID = p.Order_ID
 12  ORDER BY o.Customer_ID;

CUSTOMER_ID   ORDER_ID PAYMENT_ID PAYMENT_D PAYMENT_METHOD
----------- ---------- ---------- --------- ------------------------------
PAYMENT_AMOUNT PAYMENT_STATUS
-------------- ------------------------------
          1        101        501 20-SEP-26 UPI
          2500 Paid

          2        102        502 21-SEP-26 Card
          1800 Paid

          3        103        503 22-SEP-26 Cash on Delivery
          3200 Paid


CUSTOMER_ID   ORDER_ID PAYMENT_ID PAYMENT_D PAYMENT_METHOD
----------- ---------- ---------- --------- ------------------------------
PAYMENT_AMOUNT PAYMENT_STATUS
-------------- ------------------------------
          4        104        504 23-SEP-26 Net Banking
          1500 Failed

          5        105        505 24-SEP-26 UPI
          2750 Paid


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
