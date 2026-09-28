
CREATE TABLE Order_Item (
    Order_Item_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER,
    Product_ID NUMBER,
    Quantity NUMBER,
    Price NUMBER(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Order_Item VALUES (1, 101, 201, 1, 4500.00);
INSERT INTO Order_Item VALUES (2, 102, 202, 1, 2999.00);
INSERT INTO Order_Item VALUES (3, 103, 203, 1, 5999.00);
INSERT INTO Order_Item VALUES (4, 104, 204, 1, 1999.00);
INSERT INTO Order_Item VALUES (5, 105, 205, 1, 7499.00);


UPDATE Order_Item SET Quantity = 2 WHERE Order_Item_ID = 1;
UPDATE Order_Item SET Price = 4800.00 WHERE Order_Item_ID = 2;


SELECT * FROM Order_Item;ORDER_ITEM TABLE OUTPUT
------------- -------- ---------- -------- ------
            1      101        201        2  4500
            2      102        202        1  4800
            3      103        203        1  5999
            4      104        204        1  1999
            5      105        205        1  7499
