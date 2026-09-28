
CREATE TABLE Orders (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Order_Date DATE,
    Total_Amount NUMBER(10,2),
    Order_Status VARCHAR2(20),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- INSERT VALUES
INSERT INTO Orders VALUES (101, 1, TO_DATE('01-SEP-26','DD-MON-YY'), 4500.00, 'Pending');
INSERT INTO Orders VALUES (102, 2, TO_DATE('03-SEP-26','DD-MON-YY'), 2999.00, 'Shipped');
INSERT INTO Orders VALUES (103, 3, TO_DATE('05-SEP-26','DD-MON-YY'), 5999.00, 'Processing');
INSERT INTO Orders VALUES (104, 4, TO_DATE('07-SEP-26','DD-MON-YY'), 1999.00, 'Delivered');
INSERT INTO Orders VALUES (105, 5, TO_DATE('10-SEP-26','DD-MON-YY'), 7499.00, 'Pending');

-- UPDATE
UPDATE Orders SET Order_Status = 'Shipped' WHERE Order_ID = 101;
UPDATE Orders SET Total_Amount = 4999.00 WHERE Order_ID = 102;

-- DISPLAY
SELECT * FROM Orders;ORDER TABLE OUTPUT
-------- ----------- --------- ------------ ------------
     101           1 01-SEP-26         4500 Shipped
     102           2 03-SEP-26         4999 Shipped
     103           3 05-SEP-26         5999 Processing
     104           4 07-SEP-26         1999 Delivered
     105           5 10-SEP-26         7499 Pending
