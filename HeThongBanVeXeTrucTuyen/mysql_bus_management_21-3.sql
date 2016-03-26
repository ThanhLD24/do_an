
-- Kiểm tra tồn tại của tên database
CREATE DATABASE IF NOT EXISTS Bus_Managerment;
USE Bus_Managerment;

/*
CREATE TABLE PASSENGER(
	PASSENGER_ID					INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
	PASSENGER_NAME_TITLE			VARCHAR(10),
	PASSENGER_NAME					VARCHAR(50) NOT NULL,
	PASSENGER_EMAIL					VARCHAR(50),
	PASSENGER_ADDRESS				VARCHAR(100),
	PASSENGER_GENDER				VARCHAR(5),
	PASSENGER_PHONE					VARCHAR(15) NOT NULL,
	PASSENGER_NOTES					VARCHAR(200),
	PASSENGER_SESSION_ID			VARCHAR(50)
);
*/
CREATE TABLE JOB(
		JOB_ID 						INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		JOB_NAME					VARCHAR(50),
		JOB_DESCRIPTION				VARCHAR(100)
);

CREATE TABLE EMPLOYEE(
	EMPLOYEE_ID						INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
	EMPLOYEE_NAME_TITLE				VARCHAR(10),
	EMPLOYEE_NAME					VARCHAR(50) NOT NULL,
	EMPLOYEE_BIRTHDAY				VARCHAR(20),
	EMPLOYEE_EMAIL					VARCHAR(50) NOT NULL,
	EMPLOYEE_IMAGE					VARCHAR(100),
	EMPLOYEE_ADDRESS				VARCHAR(100) NOT NULL,
	EMPLOYEE_NATIONALITY			VARCHAR(20),
	EMPLOYEE_GENDER					VARCHAR(5),
	EMPLOYEE_PHONE					VARCHAR(15),
	EMPLOYEE_HOMEPHONE				VARCHAR(15),
	EMPLOYEE_OFFICEPHONE			VARCHAR(15),
	EMPLOYEE_JOB_ID					INT,
	EMPLOYEE_APPLYYEAR				INT,
	EMPLOYEE_IDENTITY_NUMBER		VARCHAR(15),
	EMPLOYEE_NOTES					VARCHAR(200),
	EMPLOYEE_STATE          		 INT,
	FOREIGN KEY (EMPLOYEE_JOB_ID) REFERENCES JOB(JOB_ID)
);

CREATE TABLE ACCOUNT(
	ACCOUNT_ID 				INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	EMPLOYEE_ID				INT NOT NULL,
	ACCOUNT_NAME			VARCHAR(100),
	ACCOUNT_PASSWORD		VARCHAR(50) NOT NULL,
	ACCOUNT_PERMIT			INT,
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

CREATE TABLE CARRIER(
	CARRIER_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	CARRIER_NAME VARCHAR(20) NOT NULL,
	CARRIER_IMAGE VARCHAR(20),
	CARRIER_OTHER VARCHAR(100)
);

CREATE TABLE BUS(
	BUS_ID					INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
	BUS_NAME				VARCHAR(20) NOT NULL,
	BUS_TYPE				VARCHAR(50) NOT NULL, /*loai xe . giuong nam.ghe ngoi*/
	BUS_CAPACITY			INT NOT NULL,  /*so luong ghe*/
	BUS_MAP					VARCHAR(500), /* so do cho ngoi*/
	BUS_FEATURE				VARCHAR(500), /* tien nghi tren xe*/
	BUS_LICENSE_PLATE		VARCHAR(20),
	BUS_MANUFACTURER		VARCHAR(200),
	CARRIER_ID				INT,
	BUS_STATE				 INT,
	FOREIGN KEY (CARRIER_ID) REFERENCES CARRIER(CARRIER_ID)
);

CREATE TABLE PROVINCE(
	PROVINCE_ID			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	PROVINCE_NAME		VARCHAR(50) NOT NULL
);

CREATE TABLE BUS_STATION(
	BUS_STATION_ID		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	PROVINCE_ID		INT NOT NULL, 
	BUS_STATION_NAME 	VARCHAR(50),
	BUS_STATION_NOTES 	VARCHAR(100),
	FOREIGN KEY (PROVINCE_ID) REFERENCES PROVINCE(PROVINCE_ID)
);



CREATE TABLE ROUTE(
	ROUTE_ID 			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ROUTE_ORIGIN_ID		INT NOT NULL,
	ROUTE_DESTINATION_ID	INT NOT NULL,
	ROUTE_DESCRIPTION	VARCHAR(400) NOT NULL /*mota duong di cua tuyen*/
	, FOREIGN KEY (ROUTE_ORIGIN_ID) REFERENCES PROVINCE(PROVINCE_ID),
	FOREIGN KEY (ROUTE_DESTINATION_ID) REFERENCES PROVINCE(PROVINCE_ID)
);

CREATE TABLE ROUTE_DETAIL(
	ROUTE_DETAIL_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ROUTE_ID INT NOT NULL,
	PROVINCE_ID INT NOT NULL,
	NUMBERCIAL_ORDER INT,
	FOREIGN KEY (ROUTE_ID) REFERENCES ROUTE(ROUTE_ID),
	FOREIGN KEY (PROVINCE_ID) REFERENCES PROVINCE(PROVINCE_ID)

);



CREATE TABLE TICKET (
	TICKET_ID						INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	TICKET_STATE					VARCHAR(500),
	EMPLOYEE_ID						INT,
	ROUTE_ID						INT NOT NULL,
	BUS_ID							INT NOT NULL,
	TICKET_DRIVER_EMPLOYEE_ID		INT NOT NULL, /*tai xe id*/
	TICKET_EXTRA_DRIVER_EMPLOYEE_ID INT NOT NULL, /*phu xe id*/
	TICKET_ORIGIN_TIME				DATETIME NOT NULL,
	TICKET_ORIGIN_BUS_STATION_ID	INT NOT NULL,
	TICKET_DESTINATION_TIME			DATETIME NOT NULL,
	TICKET_DESTINATION_BUS_STATION_ID	INT NOT NULL,
	TICKET_PRICE					VARCHAR(100) NOT NULL, /* gia ve theo tung chang phan cach boi | */
	TICKET_TAX						VARCHAR(20),
	TICKET_SALE						VARCHAR(20),
	TICKET_FITMENT_PRICE			VARCHAR(20),
	TICKET_CURRENCY					VARCHAR(5) NOT NULL,
	TICKET_AVAILABLE				 INT,
	TICKET_COUNT					INT NOT NULL,
	TICKET_START_SELL_DATE			DATETIME,
	TICKET_END_SELL_DATE			DATETIME,
	FOREIGN KEY (BUS_ID) REFERENCES BUS(BUS_ID),
	FOREIGN KEY (ROUTE_ID) REFERENCES ROUTE(ROUTE_ID),
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
	FOREIGN KEY (TICKET_DRIVER_EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
	FOREIGN KEY (TICKET_EXTRA_DRIVER_EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
	FOREIGN KEY (TICKET_ORIGIN_BUS_STATION_ID) REFERENCES BUS_STATION(BUS_STATION_ID),
	FOREIGN KEY (TICKET_DESTINATION_BUS_STATION_ID) REFERENCES BUS_STATION(BUS_STATION_ID)
	
);

CREATE TABLE ORDER_TICKET(
	ORDER_TICKET_ID					VARCHAR(50) NOT NULL PRIMARY KEY, /* Lay 6 chu dau cua session*/
	TICKET_ID						INT NOT NULL,
	/*PASSENGER_ID					INT NOT NULL,*/
	/*thay passenger_id bang thong tin passenger*/
	PASSENGER_NAME_TITLE			VARCHAR(10),
	PASSENGER_NAME					VARCHAR(50) NOT NULL,
	PASSENGER_EMAIL					VARCHAR(50),
	PASSENGER_ADDRESS				VARCHAR(100),
	PASSENGER_GENDER				VARCHAR(5),
	PASSENGER_PHONE					VARCHAR(15) NOT NULL,
	/*end*/
	ORDER_TICKET_SEAT				VARCHAR(100) NOT NULL,
	/*ORDER_TICKET_LUGGAGE			VARCHAR(200),*/
	ORDER_TICKET_TOTAL_SEAT			INT NOT NULL,
	ORDER_TICKET_TOTAL_PRICE		VARCHAR(10) NOT NULL,
	ORDER_TICKET_TIME				VARCHAR(50),
	ORDER_TICKET_EXPIRED_TIME		VARCHAR(50),
	ORDER_TICKET_PAIDDATE			VARCHAR(20),
	ORDER_TICKET_STATUS				 INT,
	ORDER_TICKET_OTHER				VARCHAR(200),
	FOREIGN KEY (TICKET_ID) REFERENCES TICKET(TICKET_ID)
);


CREATE TABLE SEAT_ORDER(
	SEAT_ORDER_ID					INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	TICKET_ID					INT NOT NULL,
	ORDER_TICKET_ID				VARCHAR(50),
	SEAT						VARCHAR(50),
	ROUTES						VARCHAR(500),
	FOREIGN KEY (TICKET_ID) REFERENCES TICKET(TICKET_ID)
);

CREATE TABLE CANCEL_ORDER_TICKET(
	CANCEL_ORDER_TICKET_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ORDER_TICKET_ID					VARCHAR(50) NOT NULL,
	CANCEL_ORDER_TICKET_CANCEL_TIME		DATETIME,
	CANCEL_ORDER_TICKET_REFUND				VARCHAR(20), /* Tien hoan lai*/
	CANCEL_ORDER_TICKET_INTEREST			VARCHAR(20), /* Tien Lai (tong tien - tien hoan lai)*/
	CANCEL_ORDER_TICKET_STATUS				 INT,
	CANCEL_ORDER_TICKET_NOTES				VARCHAR(100),
	FOREIGN KEY (ORDER_TICKET_ID) REFERENCES ORDER_TICKET(ORDER_TICKET_ID)
);

CREATE TABLE FEEDBACK(
	FEEDBACK_ID					INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	FEEDBACK_TITLE				VARCHAR(100) NOT NULL,
	FEEDBACK_CONTENT			VARCHAR(500) NOT NULL,
	FEEDBACK_PERSON_NAME		VARCHAR(25) NOT NULL,
	FEEDBACK_PERSON_EMAIL		VARCHAR(25),
	FEEDBACK_PERSON_PHONE		VARCHAR(15) NOT NULL
);

CREATE TABLE NEWS(
	NEWS_ID				INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NEWS_TITLE			VARCHAR(100) NOT NULL,
	NEWS_BRIEF_CONTENT			VARCHAR(200),
	NEWS_CONTENT		VARCHAR(1000) NOT NULL,
	NEWS_POST_DATE		DATETIME,
	NEWS_AUTHOR_ID		INT NOT NULL,
	FOREIGN KEY (NEWS_AUTHOR_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);
/* INSERT DATA TO TABLE JOB */
INSERT INTO JOB(JOB_NAME, JOB_DESCRIPTION) VALUES ('Tài xế','Người lái xe chính');
INSERT INTO JOB(JOB_NAME, JOB_DESCRIPTION) VALUES ('Phụ xe','Người phụ lái trong mỗi chuyến đi');
INSERT INTO JOB(JOB_NAME, JOB_DESCRIPTION) VALUES ('Nhân viên bán vé','Người bán vé cho nhà xe');
INSERT INTO JOB(JOB_NAME, JOB_DESCRIPTION) VALUES ('Nhân viên quản lý','Người quản lý các hạng mục của nhà xe');
INSERT INTO JOB(JOB_NAME, JOB_DESCRIPTION) VALUES ('Nhân viên quản trị hệ thống','Người quản trị hệ thống');

/* INSERT DATA TO TABLE EMPLOYEE */
INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Ông','Lê Duy Thanh','02-04-1994','duythanh.h3t@gmail.com','src://','Kiều Mai-Từ Liêm-Hà Nội','Việt Nam','Nam','01659660338','','',5,2015,'184137986','',1);

INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Bà','Đặng Thị Minh','15-07-1994','dangminh218@gmail.com','src://','Quận Đống Đa - Hà Nội','Việt Nam','Nữ','01664084960','','',4,2015,'184137985','',1);

INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Anh','Nguyễn Duy Hoàng','06-08-1994','stnguyehoang@gmail.com','src://','Nhổn City - Hà Nội','Việt Nam','Nam','01652325245','','',1,2015,'184235451','',1);

INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Anh','Nguyễn Minh Chính','01-08-1994','chinhnguyen@gmail.com','src://','Nhổn City - Hà Nội','Việt Nam','Nam','01652325245','','',2,2015,'156585455','',1);

/*INSERT DATA TO TABLE CARRIER */
INSERT INTO CARRIER(CARRIER_NAME, CARRIER_IMAGE, CARRIER_OTHER) VALUES ('Duy Thanh','','');
INSERT INTO CARRIER(CARRIER_NAME, CARRIER_IMAGE, CARRIER_OTHER) VALUES ('Huy Hoàng','','');
INSERT INTO CARRIER(CARRIER_NAME, CARRIER_IMAGE, CARRIER_OTHER) VALUES ('Văn Minh','','');
INSERT INTO CARRIER(CARRIER_NAME, CARRIER_IMAGE, CARRIER_OTHER) VALUES ('Thái Học','','');



/* INSERT DATA TO TABLE BUS */
INSERT INTO BUS(BUS_NAME, BUS_TYPE, BUS_CAPACITY, BUS_MAP, BUS_FEATURE, BUS_LICENSE_PLATE, BUS_MANUFACTURER,CARRIER_ID,BUS_STATE) 
VALUES ('Xe Duy Thanh 1','Giường nằm 40 chỗ',40,'/f_f_f/|/f_f_f/|/f_f_f/|/f_f_f/|/f_f_f/|/fff_f/|/fff__/|','- Điều hòa<br>- Chăn<br>- Nước uống','38H1-012356','HuynDai',1,1);

INSERT INTO BUS(BUS_NAME, BUS_TYPE, BUS_CAPACITY, BUS_MAP, BUS_FEATURE, BUS_LICENSE_PLATE, BUS_MANUFACTURER,CARRIER_ID,BUS_STATE) 
VALUES ('Xe Duy Thanh 2','Giường nằm 42 chỗ',42,'/f_f_f/|/f_f_f/|/f_f_f/|/f_f_f/|/f_f_f/|/fff_f/|/fff__/|','- Điều hòa<br>- Chăn<br>- Wifi<br>- Nước uống','38H1-012357','HuynDai',1,1);



/* INSERT DATA TO TABLE PROVINCE */
INSERT INTO PROVINCE(PROVINCE_NAME) VALUES ('Hà Tĩnh');
INSERT INTO PROVINCE(PROVINCE_NAME) VALUES ('Hà Nội');
INSERT INTO PROVINCE(PROVINCE_NAME) VALUES ('Hà Nam');
INSERT INTO PROVINCE(PROVINCE_NAME) VALUES ('Ninh Bình');

/* INSERT DATA TO TABLE BUS_STATION */
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (2, 'Bến Xe Nước Ngầm','');
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (2, 'Bến Xe Mỹ Đình','');
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (1, 'Bến Xe Hương Sơn','');
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (1, 'Bến Xe TP Hà Tĩnh','');

/* INSERT DATA TO TABLE ROUTE */
INSERT INTO ROUTE(ROUTE_ORIGIN_ID, ROUTE_DESTINATION_ID, ROUTE_DESCRIPTION) VALUES (1,2, 'Hà Tĩnh - Hà Nội');
INSERT INTO ROUTE(ROUTE_ORIGIN_ID, ROUTE_DESTINATION_ID, ROUTE_DESCRIPTION) VALUES (2,1, 'Hà Nội - Hà Tĩnh');

/* INSERT DATA TO TABLE ROUTE_DETAIL*/
INSERT INTO ROUTE_DETAIL(ROUTE_ID, PROVINCE_ID, NUMBERCIAL_ORDER) VALUES (1,1,1);
INSERT INTO ROUTE_DETAIL(ROUTE_ID, PROVINCE_ID, NUMBERCIAL_ORDER) VALUES (1,4,2);
INSERT INTO ROUTE_DETAIL(ROUTE_ID, PROVINCE_ID, NUMBERCIAL_ORDER) VALUES (1,3,3);
INSERT INTO ROUTE_DETAIL(ROUTE_ID, PROVINCE_ID, NUMBERCIAL_ORDER) VALUES (1,2,4);
INSERT INTO ROUTE_DETAIL(ROUTE_ID, PROVINCE_ID, NUMBERCIAL_ORDER) VALUES (2,2,1);
INSERT INTO ROUTE_DETAIL(ROUTE_ID, PROVINCE_ID, NUMBERCIAL_ORDER) VALUES (2,3,2);
INSERT INTO ROUTE_DETAIL(ROUTE_ID, PROVINCE_ID, NUMBERCIAL_ORDER) VALUES (2,4,3);
INSERT INTO ROUTE_DETAIL(ROUTE_ID, PROVINCE_ID, NUMBERCIAL_ORDER) VALUES (2,1,4);

/* INSERT DATA TO TABLE TICKET */
INSERT INTO TICKET(TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_DRIVER_EMPLOYEE_ID, TICKET_EXTRA_DRIVER_EMPLOYEE_ID, TICKET_ORIGIN_TIME, TICKET_ORIGIN_BUS_STATION_ID, TICKET_DESTINATION_TIME, TICKET_DESTINATION_BUS_STATION_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('',2,1,1,3,4,'2016-06-20 07:00:00',3,'2016-06-21 14:00:00',1,'100-90-60-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

INSERT INTO TICKET(TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_DRIVER_EMPLOYEE_ID, TICKET_EXTRA_DRIVER_EMPLOYEE_ID, TICKET_ORIGIN_TIME, TICKET_ORIGIN_BUS_STATION_ID, TICKET_DESTINATION_TIME, TICKET_DESTINATION_BUS_STATION_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('',2,1,2,3,4,'2016-06-20 21:00:00',3,'2016-06-21 06:00:00',1,'100-90-50-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');
INSERT INTO TICKET(TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_DRIVER_EMPLOYEE_ID, TICKET_EXTRA_DRIVER_EMPLOYEE_ID, TICKET_ORIGIN_TIME, TICKET_ORIGIN_BUS_STATION_ID, TICKET_DESTINATION_TIME, TICKET_DESTINATION_BUS_STATION_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('',2,1,1,3,4,'2016-06-20 07:30:00',3,'2016-06-21 15:00:00',1,'100-100-50-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

INSERT INTO TICKET(TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_DRIVER_EMPLOYEE_ID, TICKET_EXTRA_DRIVER_EMPLOYEE_ID, TICKET_ORIGIN_TIME, TICKET_ORIGIN_BUS_STATION_ID, TICKET_DESTINATION_TIME, TICKET_DESTINATION_BUS_STATION_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('',2,1,2,3,4,'2016-06-20 22:00:00',3,'2016-06-21 07:00:00',1,'90-110-50-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');



INSERT INTO TICKET(TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_DRIVER_EMPLOYEE_ID, TICKET_EXTRA_DRIVER_EMPLOYEE_ID, TICKET_ORIGIN_TIME, TICKET_ORIGIN_BUS_STATION_ID, TICKET_DESTINATION_TIME, TICKET_DESTINATION_BUS_STATION_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('',2,2,1,3,4,'2016-06-20 07:00:00',3,'2016-06-21 14:00:00',1,'60-110-90-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

INSERT INTO TICKET(TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_DRIVER_EMPLOYEE_ID, TICKET_EXTRA_DRIVER_EMPLOYEE_ID, TICKET_ORIGIN_TIME, TICKET_ORIGIN_BUS_STATION_ID, TICKET_DESTINATION_TIME, TICKET_DESTINATION_BUS_STATION_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('',2,2,2,3,4,'2016-06-20 21:00:00',3,'2016-06-21 06:00:00',1,'60-100-100-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');
INSERT INTO TICKET(TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_DRIVER_EMPLOYEE_ID, TICKET_EXTRA_DRIVER_EMPLOYEE_ID, TICKET_ORIGIN_TIME, TICKET_ORIGIN_BUS_STATION_ID, TICKET_DESTINATION_TIME, TICKET_DESTINATION_BUS_STATION_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('',2,2,1,3,4,'2016-06-20 07:30:00',3,'2016-06-21 15:00:00',1,'40-110-90-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

INSERT INTO TICKET(TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_DRIVER_EMPLOYEE_ID, TICKET_EXTRA_DRIVER_EMPLOYEE_ID, TICKET_ORIGIN_TIME, TICKET_ORIGIN_BUS_STATION_ID, TICKET_DESTINATION_TIME, TICKET_DESTINATION_BUS_STATION_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('',2,2,2,3,4,'2016-06-20 22:00:00',3,'2016-06-21 07:00:00',1,'50-110-100-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

/*
INSERT INTO SEAT_ORDER(TICKET_ID, SEAT, ROUTES) VALUES(1,'/1_A/|/2_A/|','(1-2)(2-3)(3-4)');
INSERT INTO SEAT_ORDER(TICKET_ID, SEAT, ROUTES) VALUES(1,'/4_C/|/10_D/|','(1-2)');
INSERT INTO SEAT_ORDER(TICKET_ID, SEAT, ROUTES) VALUES(1,'/12_A/|/13_D/|','(2-3)(3-4)');
*/
USE Bus_Managerment

SELECT * FROM ticket t WHERE T.ROUTE_ID IN (SELECT rd1.ROUTE_ID FROM ROUTE_DETAIL rd1 WHERE rd1.PROVINCE_ID =3) 
AND T.ROUTE_ID IN (SELECT rd2.ROUTE_ID FROM ROUTE_DETAIL rd2 WHERE rd2.PROVINCE_ID =4)  AND (SELECT rd3.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd3 WHERE rd3.ROUTE_ID =t.ROUTE_ID AND rd3.PROVINCE_ID =3)>(SELECT rd4.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd4 WHERE  rd4.ROUTE_ID =t.ROUTE_ID AND rd4.PROVINCE_ID =4) AND DATE(t.TICKET_ORIGIN_TIME) ='2016-06-20' ;

SELECT * FROM SEAT_ORDER WHERE TICKET_ID = 9 AND ROUTES LIKE '%(1-2)%'
SELECT * FROM SEAT_ORDER s  WHERE s.TICKET_ID =5 AND  (ROUTES LIKE '%(1-2)%'  OR ROUTES LIKE '%(2-3)%'  OR ROUTES LIKE '%(3-4)%' )




