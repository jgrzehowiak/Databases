/* 	 Line 1: John Grzehowiak D10
     Line 2: COSC 3380   Fall 2015   Project 1
     Line 3: This is MY work
     Line 4: Will NOT disseminate */

/* CREATE ENTITY SET TABLES*/

DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
CREATE TABLE CUSTOMER(C_ID INTEGER PRIMARY KEY, LAST CHAR(15), FIRST CHAR(20), MI CHAR(1), DOB DATE, ADDRESS CHAR(20), CITY CHAR(15), STATE CHAR(2), ZIP INTEGER, DPHONE CHAR(13), EMAIL CHAR(25), USER_ID CHAR(20), PASS CHAR(20));

DROP TABLE "ORDERS" CASCADE CONSTRAINTS;
CREATE TABLE "ORDERS"(O_ID INTEGER PRIMARY KEY, O_DATE DATE, METHPMT CHAR(5), C_ID INTEGER, OS_ID INTEGER, FOREIGN KEY(C_ID) REFERENCES CUSTOMER(C_ID), FOREIGN KEY(OS_ID) REFERENCES ORDERSOURCE(OS_ID));

DROP TABLE ORDER_LINE CASCADE CONSTRAINTS;
CREATE TABLE ORDER_LINE(O_ID INTEGER, INV_ID INTEGER, OL_QUANTITY INTEGER, OL_PRICE INTEGER, PRIMARY KEY(O_ID,INV_ID), FOREIGN KEY(O_ID) REFERENCES "ORDERS", FOREIGN KEY(INV_ID) REFERENCES INVENTORY(INV_ID));

DROP TABLE ITEM CASCADE CONSTRAINTS;
CREATE TABLE ITEM(ITEM_ID INTEGER PRIMARY KEY, ITEM_DESC CHAR(255), CAT_ID INTEGER, ITEM_IMAGE CHAR(30), FOREIGN KEY(CAT_ID) REFERENCES CATEGORY(CAT_ID));

DROP TABLE ORDERSOURCE CASCADE CONSTRAINTS;
CREATE TABLE ORDERSOURCE(OS_ID INTEGER PRIMARY KEY, OS_DESC CHAR(255));

DROP TABLE "CATEGORY" CASCADE CONSTRAINTS;
CREATE TABLE "CATEGORY"(CAT_ID INTEGER PRIMARY KEY, CAT_DESC CHAR(255));

DROP TABLE INVENTORY CASCADE CONSTRAINTS;
CREATE TABLE INVENTORY(INV_ID INTEGER PRIMARY KEY, ITEM_ID INTEGER, COLOR VARCHAR2(20), INV_SIZE CHAR(2), INV_PRICE REAL, INV_QOH INTEGER, FOREIGN KEY(ITEM_ID) REFERENCES ITEM(ITEM_ID));

DROP TABLE SHIPMENTS CASCADE CONSTRAINTS;
CREATE TABLE SHIPMENTS(SHIP_ID INTEGER PRIMARY KEY, SHIP_DATE_EXPECTED DATE);

DROP TABLE SHIPMENT_LINE CASCADE CONSTRAINTS;
CREATE TABLE SHIPMENT_LINE(SHIP_ID INTEGER, INV_ID INTEGER, SL_QUANTITY INTEGER, SHIP_DATE_RECEIVED DATE, PRIMARY KEY(SHIP_ID,INV_ID), FOREIGN KEY(SHIP_ID) REFERENCES SHIPMENTS(SHIP_ID), FOREIGN KEY(INV_ID) REFERENCES INVENTORY(INV_ID));

DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
CREATE TABLE EMPLOYEE(E_ID INTEGER PRIMARY KEY, ROLE CHAR(2), ID CHAR(20), PASSWORD CHAR(20), EMAIL_ CHAR(30));

/*DATA ENTRY*/

/*CUSTOMERS*/

INSERT INTO CUSTOMER
VALUES(1, 'Graham', 'Neal', 'R', to_date('12/10/1967', 'mm/dd/yyyy'), '9815 Circle Dr.', 'Tallahassee', 'FL', '32308', '9045551897',  'GrahamN@gmail.com', 'grahamn', 'barbiecar');
INSERT INTO CUSTOMER
VALUES(2, 'Sanchez', 'Myra', 'T', to_date('08/14/1958', 'mm/dd/yyyy'), '172 Alto Park', 'Seattle', 'WA', '42180', '4185551791', 'SanchezM@gmail.com', 'sanchezmt', 'qwert5');
INSERT INTO CUSTOMER
VALUES(3, 'Smith', 'Lisa', 'M', to_date('04/12/1960', 'mm/dd/yyyy'), '850 East Main', 'Santa Ana', 'CA', '51875', '3075557841', 'SmithL@gmail.com', 'smithlm', 'joshua5');
INSERT INTO CUSTOMER
VALUES(4, 'Phelp', 'Paul', NULL,to_date('01/18/1981', 'mm/dd/yyyy'), '994 Kirkman Rd.', 'Houston', 'TX', '11795', '4825554788', 'TEAM?OSGSC4@gmail.com', 'TEAMOSGSC4','TEAMOSGSC4!');
INSERT INTO CUSTOMER
VALUES(5, 'Lewis', 'Sheila', 'A', to_date('08/30/1978', 'mm/dd/yyyy'), '195 College Blvd.', 'Newton', 'GA', '37812', '3525554972', 'LewisS@gmail.com', 'lewissa', '125pass');
INSERT INTO CUSTOMER
VALUES(6, 'James', 'Thomas', 'E', to_date('06/01/1973', 'mm/dd/yyyy'), '348 Rice Lane', 'Radcliff', 'WY', '87195', '7615553485', 'JamesT@gmail.com', 'jamest', 'nok$tell');

/*ITEMS*/

INSERT INTO ITEM
VALUES(1, 'Men''s Expedition Parka', 3, 'parka.jpg');
INSERT INTO ITEM
VALUES(2, '3-Season Tent', 4, 'tents.jpg');
INSERT INTO ITEM
VALUES(3, 'Women''s Hiking Shorts', 1, 'shorts.jpg');
INSERT INTO ITEM
VALUES(4, 'Women''s Fleece Pullover', 1, 'fleece.jpg');
INSERT INTO ITEM
VALUES(5, 'Children''s Beachcomber Sandals', 2, 'sandal.jpg');
INSERT INTO ITEM
VALUES(6, 'Boy''s Surf Shorts', 2, 'surfshorts.jpg');
INSERT INTO ITEM
VALUES(7, 'Girl''s Soccer Tee', 2, 'girlstee.jpg');


/*ORDERSOURCE*/

INSERT INTO ORDERSOURCE
VALUES(1, 'Winter 2011');
INSERT INTO ORDERSOURCE
VALUES(2, 'Spring 2012');
INSERT INTO ORDERSOURCE
VALUES(3, 'Summer 2012');
INSERT INTO ORDERSOURCE
VALUES(4, 'Outdoor 2012');
INSERT INTO ORDERSOURCE
VALUES(5, 'Children 2012');
INSERT INTO ORDERSOURCE
VALUES(6, 'Web Site');

/*CATEGORIES*/

INSERT INTO CATEGORY
VALUES(1, 'Women"s Clothing');
INSERT INTO CATEGORY
VALUES(3, 'Men"s Clothing');
INSERT INTO CATEGORY
VALUES(2, 'Children"s Clothing');
INSERT INTO CATEGORY
VALUES(4, 'Outdoor Gear');

/*INVENTORY*/

INSERT INTO INVENTORY
VALUES(1, 2, 'Sky Blue', NULL, 259.99, 16);
INSERT INTO INVENTORY
VALUES(2, 2, 'Light Grey', NULL, 259.99, 12);
INSERT INTO INVENTORY
VALUES(3, 3, 'Khaki', 'S', 29.95, 150);
INSERT INTO INVENTORY
VALUES(4, 3, 'Khaki', 'M', 29.95, 147);
INSERT INTO INVENTORY
VALUES(5, 3, 'Khaki', 'L', 29.95, 0);
INSERT INTO INVENTORY
VALUES(6, 3, 'Navy', 'S', 29.95, 139);
INSERT INTO INVENTORY
VALUES(7, 3, 'Navy', 'M', 29.95, 137);
INSERT INTO INVENTORY
VALUES(8, 3, 'Navy', 'L', 29.95, 115);
INSERT INTO INVENTORY
VALUES(9, 4, 'Eggplant', 'S', 59.95, 135);
INSERT INTO INVENTORY
VALUES(10, 4, 'Eggplant', 'M', 59.95, 168);
INSERT INTO INVENTORY
VALUES(11, 4, 'Eggplant', 'L', 59.95, 187);
INSERT INTO INVENTORY
VALUES(12, 4, 'Royal', 'S', 59.95, 0);
INSERT INTO INVENTORY
VALUES(13, 4, 'Royal', 'M', 59.95, 124);
INSERT INTO INVENTORY
VALUES(14, 4, 'Royal', 'L', 59.95, 112);
INSERT INTO INVENTORY
VALUES(15, 5, 'Turquoise', '10', 15.99, 121);
INSERT INTO INVENTORY
VALUES(16, 5, 'Turquoise', '11', 15.99, 111);
INSERT INTO INVENTORY
VALUES(17, 5, 'Turquoise', '12', 15.99, 113);
INSERT INTO INVENTORY
VALUES(18, 5, 'Turquoise', '1', 15.99, 121);
INSERT INTO INVENTORY
VALUES(19, 5, 'Bright Pink', '10', 15.99, 148);
INSERT INTO INVENTORY
VALUES(20, 5, 'Bright Pink', '11', 15.99, 137);
INSERT INTO INVENTORY
VALUES(21, 5, 'Bright Pink', '12', 15.99, 134);
INSERT INTO INVENTORY
VALUES(22, 5, 'Bright Pink', '1', 15.99, 123);
INSERT INTO INVENTORY
VALUES(23, 1, 'Spruce', 'S', 199.95, 114);
INSERT INTO INVENTORY
VALUES(24, 1,  'Spruce', 'M',199.95, 17);
INSERT INTO INVENTORY
VALUES(25, 1, 'Spruce', 'L', 209.95, 0);
INSERT INTO INVENTORY
VALUES(26, 1, 'Spruce', 'XL', 209.95, 12);
INSERT INTO INVENTORY
VALUES(27, 6, 'Blue', 'S', 15.95, 50);
INSERT INTO INVENTORY
VALUES(28, 6, 'Blue', 'M', 15.95, 100);
INSERT INTO INVENTORY
VALUES(29, 6, 'Blue', 'L', 15.95, 100);
INSERT INTO INVENTORY
VALUES(30, 7, 'White', 'S', 19.99, 100);
INSERT INTO INVENTORY
VALUES(31, 7, 'White', 'M', 19.99, 100);
INSERT INTO INVENTORY
VALUES(32, 7, 'White', 'L', 19.99, 100);


/*ORDERS*/

INSERT INTO "ORDERS"
VALUES(1, TO_DATE('01/29/2012', 'MM/DD/YYYY'), 'CC', 1, 2);
INSERT INTO "ORDERS"
VALUES(2, TO_DATE('02/29/2012', 'MM/DD/YYYY'), 'CC', 6, 6);
INSERT INTO "ORDERS"
VALUES(3, TO_DATE('03/31/2012', 'MM/DD/YYYY'), 'CHECK', 2, 2);
INSERT INTO "ORDERS"
VALUES(4, TO_DATE('03/31/2012', 'MM/DD/YYYY'), 'CC', 3, 3);
INSERT INTO "ORDERS"
VALUES(5, TO_DATE('04/23/2012', 'MM/DD/YYYY'), 'CC', 4, 6);
INSERT INTO "ORDERS"
VALUES(6, TO_DATE('04/23/2012', 'MM/DD/YYYY'), 'CC', 4, 3);

/*ORDER_LINE*/

INSERT INTO ORDER_LINE
VALUES(1, 1, 1, 259.99);
INSERT INTO ORDER_LINE
VALUES(1, 14, 2, 59.99);
INSERT INTO ORDER_LINE
VALUES(2, 19, 1, 15.99);
INSERT INTO ORDER_LINE
VALUES(3, 24, 1, 199.95);
INSERT INTO ORDER_LINE
VALUES(3, 26, 1, 209.95);
INSERT INTO ORDER_LINE
VALUES(4, 12, 2, 59.95);
INSERT INTO ORDER_LINE
VALUES(5, 8, 1, 29.95);
INSERT INTO ORDER_LINE
VALUES(5, 13, 1, 59.95);
INSERT INTO ORDER_LINE
VALUES(6, 2, 1, 259.99);
INSERT INTO ORDER_LINE
VALUES(6, 7, 3, 29.95);

/*SHIPMENTS*/

INSERT INTO SHIPMENTS
VALUES(1, TO_DATE('03/15/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENTS
VALUES(2, TO_DATE('05/15/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENTS
VALUES(3, TO_DATE('04/25/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENTS
VALUES(4, TO_DATE('04/25/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENTS
VALUES(5, TO_DATE('06/15/2012', 'MM/DD/YYYY'));

/*SHIPMENT_LINE*/

INSERT INTO SHIPMENT_LINE
VALUES(1, 1, 25, TO_DATE('02/10/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENT_LINE
VALUES(1, 2, 25, TO_DATE('02/10/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENT_LINE
VALUES(2, 2, 25, NULL);
INSERT INTO SHIPMENT_LINE
VALUES(3, 5, 200, NULL);
INSERT INTO SHIPMENT_LINE
VALUES(3, 6, 200, NULL);
INSERT INTO SHIPMENT_LINE
VALUES(3, 7, 200, NULL);
INSERT INTO SHIPMENT_LINE
VALUES(4, 12, 100, TO_DATE('04/15/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENT_LINE
VALUES(4, 13, 100, TO_DATE('04/25/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENT_LINE
VALUES(5, 23, 50, TO_DATE('04/15/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENT_LINE
VALUES(5, 24, 100, TO_DATE('04/15/2012', 'MM/DD/YYYY'));
INSERT INTO SHIPMENT_LINE
VALUES(5, 25, 100, TO_DATE('04/15/2012', 'MM/DD/YYYY'));

/*EMPLOYEES*/
INSERT INTO EMPLOYEE
VALUES(1, 'PM', 'TEAMOSCSPM', 'TEAMOSCSPM#', 'TEAMOSCSPM@fake.com');
INSERT INTO EMPLOYEE
VALUES(2, 'MM', 'TEAMOSCSMM', 'TEAMOSCSMM#', 'TEAMOSCSMM@fake.com');
INSERT INTO EMPLOYEE
VALUES(3, 'RC', 'TEAMOSCSRC', 'TEAMOSCSRC#', 'TEAMOSCSRC@fake.com');
INSERT INTO EMPLOYEE
VALUES(4, 'WM', 'TEAMOSCSWM', 'TEAMOSCSWM#', 'jgrzehowiak@gmail.com');
INSERT INTO EMPLOYEE
VALUES(5, 'CS', 'TEAMOSCSCS', 'TEAMOSCSCS#', 'TEAM?OSCSCS@gmail.com');

set serveroutput on;
CREATE OR REPLACE PROCEDURE CustomerReport IS
CURSOR curs IS SELECT * FROM CUSTOMER;
v_row CUSTOMER%ROWTYPE;
BEGIN
	OPEN curs; 
	LOOP
		FETCH curs INTO v_row;
		EXIT when curs%NOTFOUND;
		dbms_output.put_line(v_row.C_ID || ' ' || v_row.LAST || ' ' || v_row.FIRST || ' ' || v_row.DOB || ' ' || v_row.DPHONE || ' ' || v_row.EMAIL);
	END LOOP;
	CLOSE curs;
END;
/

CREATE OR REPLACE PROCEDURE ShipmentsNotReceivedReport IS
CURSOR ship_curs IS SELECT * FROM SHIPMENTS;
s_row SHIPMENTS%ROWTYPE;
BEGIN
	OPEN ship_curs;
	LOOP
		FETCH ship_curs INTO s_row;
		EXIT when ship_curs%NOTFOUND;
		dbms_output.put_line(s_row.SHIP_ID || ' ' || s_row.SHIP_DATE_EXPECTED);
	END LOOP;
	CLOSE ship_curs;
END;
/

CREATE OR REPLACE PROCEDURE SEND_MAIL(product INTEGER, product_des VARCHAR2, WMan_Email VARCHAR2)
IS
c utl_smtp.connection;
msg_from varchar2(50) := 'vhilford@cs.uh.edu';
msg_to varchar2(50) := WMan_Email;
msg_subject varchar2(50) := 'Inventory Order';
mailhost varchar2(30) := 'smtp.cs.uh.edu';

BEGIN

c:= utl_smtp.open_connection(mailhost,25);
utl_smtp.helo(c, mailhost);
utl_smtp.mail(c,msg_from);
utl_smtp.rcpt(c,msg_to);

utl_smtp.data(c,'From: ' || msg_from || utl_tcp.crlf ||
'To: ' || msg_to || utl_tcp.crlf ||
'Subject: ' || msg_subject ||
utl_tcp.crlf || 'Quantity on Hand for product "' || product_des ||'" has reached critical low level. Please order more.');
utl_smtp.quit(c);

EXCEPTION
WHEN UTL_SMTP.INVALID_OPERATION THEN
dbms_output.put_line('Invalid Operation in Mail attempt.');
WHEN UTL_SMTP.TRANSIENT_ERROR THEN
dbms_output.put_line('Temporary issue with email - try again later');
WHEN UTL_SMTP.PERMANENT_ERROR THEN
dbms_output.put_line('Permanent Error Encountered. Mail attempt failed.'||sqlerrm);
END;

/

CREATE OR REPLACE PROCEDURE SEND_MAIL_E(product INTEGER, product_des VARCHAR2, WMan_Email VARCHAR2)
IS
c utl_smtp.connection;
msg_from varchar2(50) := 'vhilford@cs.uh.edu';
msg_to varchar2(50) := WMan_Email;
msg_subject varchar2(50) := '[EMERGENCY-NO STOCK]Inventory Order';
mailhost varchar2(30) := 'smtp.cs.uh.edu';

BEGIN

c:= utl_smtp.open_connection(mailhost,25);
utl_smtp.helo(c, mailhost);
utl_smtp.mail(c,msg_from);
utl_smtp.rcpt(c,msg_to);

utl_smtp.data(c,'From: ' || msg_from || utl_tcp.crlf ||
'To: ' || msg_to || utl_tcp.crlf ||
'Subject: ' || msg_subject ||
utl_tcp.crlf || 'Quantity on Hand for product "' || product_des ||'" has reached ZERO. Please order more.');
utl_smtp.quit(c);

EXCEPTION
WHEN UTL_SMTP.INVALID_OPERATION THEN
dbms_output.put_line('Invalid Operation in Mail attempt.');
WHEN UTL_SMTP.TRANSIENT_ERROR THEN
dbms_output.put_line('Temporary issue with email - try again later');
WHEN UTL_SMTP.PERMANENT_ERROR THEN
dbms_output.put_line('Permanent Error Encountered. Mail attempt failed.'||sqlerrm);
END;

/

CREATE OR REPLACE TRIGGER REORDERITEM
AFTER UPDATE ON INVENTORY
FOR EACH ROW
DECLARE
	WM_Email VARCHAR2(30);
	Item_Description VARCHAR2(255);
	Item_Number NUMBER;
BEGIN
	IF :new.INV_QOH <= 3 THEN
		Item_Number := :old.ITEM_ID;
		SELECT Email_ INTO WM_Email FROM EMPLOYEE WHERE ROLE = 'WM';
		SELECT ITEM_DESC INTO Item_Description From ITEM WHERE ITEM_ID = Item_Number;
		dbms_output.put_line('Inv_Qoh' || :new.INV_QOH || ' WM_Email = ' || WM_Email);
		dbms_output.put_line('Inventory_ID: ' || :old.INV_ID);
			BEGIN
 				Send_Mail(:old.Inv_ID, Item_Description, WM_Email);
 			END;	
	END IF;
END;
/

CREATE OR REPLACE TRIGGER OUTOFSTOCK
AFTER UPDATE ON INVENTORY
FOR EACH ROW
DECLARE 
	WM_Email VARCHAR2(30);
	Item_Description VARCHAR2(255);
	Item_Number NUMBER;
BEGIN
	IF :new.INV_QOH = 0 THEN
		Item_Number := :old.ITEM_ID;
		SELECT Email_ INTO WM_Email FROM EMPLOYEE WHERE ROLE = 'WM';
		SELECT ITEM_DESC INTO Item_Description From ITEM WHERE ITEM_ID = Item_Number;
		dbms_output.put_line('Inv_Qoh' || :new.INV_QOH || ' WM_Email = ' || WM_Email);
		dbms_output.put_line('Inventory_ID: ' || :old.INV_ID);
			BEGIN
 				Send_Mail_E(:old.Inv_ID, Item_Description, WM_Email);
 			END;	
	END IF;
END;
/

exec CustomerReport;
exec ShipmentsNotReceivedReport;


