
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
	JOB_DESCRIPTION					VARCHAR(100)
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
	TICKET_ID						VARCHAR(50) NOT NULL PRIMARY KEY,
	TICKET_STATE					VARCHAR(500),
	EMPLOYEE_ID						INT,
	ROUTE_ID						INT NOT NULL,
	BUS_ID							INT NOT NULL,
	/*TICKET_DRIVER_EMPLOYEE_ID		INT NOT NULL,
	TICKET_EXTRA_DRIVER_EMPLOYEE_ID INT NOT NULL, 
	TICKET_ORIGIN_TIME				DATETIME,
	TICKET_ORIGIN_BUS_STATION_ID	INT NOT NULL,
	TICKET_DESTINATION_TIME			DATETIME,
	TICKET_DESTINATION_BUS_STATION_ID	INT NOT NULL,*/
	TICKET_PRICE					VARCHAR(100) NOT NULL, /* gia ve theo tung chang phan cach boi | */
	TICKET_TAX						VARCHAR(20),
	TICKET_SALE						VARCHAR(20),
	TICKET_FITMENT_PRICE			VARCHAR(20),
	TICKET_CURRENCY					VARCHAR(5) NOT NULL,
	TICKET_AVAILABLE				 INT,
	TICKET_COUNT					INT,
	TICKET_START_SELL_DATE			DATETIME,
	TICKET_END_SELL_DATE			DATETIME,
	FOREIGN KEY (BUS_ID) REFERENCES BUS(BUS_ID),
	FOREIGN KEY (ROUTE_ID) REFERENCES ROUTE(ROUTE_ID),
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
	/*REIGN KEY (TICKET_DRIVER_EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
	FOREIGN KEY (TICKET_EXTRA_DRIVER_EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
	FOREIGN KEY (TICKET_ORIGIN_BUS_STATION_ID) REFERENCES BUS_STATION(BUS_STATION_ID),
	FOREIGN KEY (TICKET_DESTINATION_BUS_STATION_ID) REFERENCES BUS_STATION(BUS_STATION_ID)
	*/
);

CREATE TABLE TICKET_DETAIL (
	TICKET_DETAIL_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	TICKET_ID VARCHAR(50),
	PROVINCE_ID INT,
	BUS_STATION_ID INT,
	DETAIL_DATE DATE,
	DETAIL_TIME TIME
);

CREATE TABLE EMPLOYEE_WORKING(
	EMPLOYEE_WORKING_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	TICKET_ID VARCHAR(50),
	EMPLOYEE_ID INT,
	START_RUN_DATE VARCHAR(20),
	END_RUN_DATE VARCHAR(20),
	FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
	FOREIGN KEY (TICKET_ID) REFERENCES TICKET(TICKET_ID)
);



CREATE TABLE ORDER_TICKET(
	ORDER_TICKET_ID					VARCHAR(50) NOT NULL PRIMARY KEY, /* Lay 6 chu dau cua session*/
	TICKET_ID						VARCHAR(50) NOT NULL,
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
	TICKET_ID					VARCHAR(50) NOT NULL,
	ORDER_TICKET_ID				VARCHAR(50),
	SEAT						VARCHAR(100),
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

/*tai xe*/
INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Anh','Nguyễn Hoàng','01-01-1988','nd@gmail.com','src://','Nhổn City - Hà Nội','Việt Nam','Nam','01651245245','','',1,2015,'184235451','',1);

INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Anh','Kinh Kong','02-08-1989','kk@gmail.com','src://','Nhổn City - Hà Nội','Việt Nam','Nam','01652325545','','',1,2015,'184235451','',1);

INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Anh','Nguyễn Viết Dũng','03-02-1987','vd@gmail.com','src://','Nhổn City - Hà Nội','Việt Nam','Nam','01652325572','','',1,2015,'184235451','',1);

INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Anh','Phan Văn Tài Em','04-08-1992','te@gmail.com','src://','Nhổn City - Hà Nội','Việt Nam','Nam','01652321797','','',1,2015,'184235451','',1);

INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Anh','Nguyễn Công Vinh','05-08-1993','cv@gmail.com','src://','Nhổn City - Hà Nội','Việt Nam','Nam','01652320935','','',1,2015,'184235451','',1);

INSERT INTO EMPLOYEE(EMPLOYEE_NAME_TITLE, EMPLOYEE_NAME, EMPLOYEE_BIRTHDAY, EMPLOYEE_EMAIL, EMPLOYEE_IMAGE, EMPLOYEE_ADDRESS, EMPLOYEE_NATIONALITY, EMPLOYEE_GENDER, EMPLOYEE_PHONE, EMPLOYEE_HOMEPHONE, EMPLOYEE_OFFICEPHONE, EMPLOYEE_JOB_ID, EMPLOYEE_APPLYYEAR, EMPLOYEE_IDENTITY_NUMBER, EMPLOYEE_NOTES, EMPLOYEE_STATE ) 
VALUES ('Anh','Trần Thái Hùng','06-04-1991','th@gmail.com','src://','Nhổn City - Hà Nội','Việt Nam','Nam','01652325245','','',1,2015,'184235451','',1);



/* INSERT DATA TO ACCOUNT*/
/* MD5: 123456 -> e10adc3949ba59abbe56e057f20f883e */
INSERT INTO ACCOUNT(EMPLOYEE_ID, ACCOUNT_NAME, ACCOUNT_PASSWORD, ACCOUNT_PERMIT) VALUES(1,'thanhld','e10adc3949ba59abbe56e057f20f883e',1);
INSERT INTO ACCOUNT(EMPLOYEE_ID, ACCOUNT_NAME, ACCOUNT_PASSWORD, ACCOUNT_PERMIT) VALUES(2,'minhdt','e10adc3949ba59abbe56e057f20`ticket``ticket_detail`f883e',2);
INSERT INTO ACCOUNT(EMPLOYEE_ID, ACCOUNT_NAME, ACCOUNT_PASSWORD, ACCOUNT_PERMIT) VALUES(3,'hoangnd','e10adc3949ba59abbe56e057f20f883e',3);

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
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (1, 'Bến Xe Hương Sơn',''); /*1*/
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (1, 'Bến Xe TP Hà Tĩnh','');/*2*/
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (2, 'Bến Xe Nước Ngầm','');/*3*/
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (2, 'Bến Xe Mỹ Đình','');/*4*/
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (3, 'Bến Xe Hà Nam 1','');/*5*/
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (3, 'Bến Xe Hà Nam 2','');/*6*/
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (4, 'Bến Xe Ninh Bình 1','');/*7*/
INSERT INTO BUS_STATION(PROVINCE_ID, BUS_STATION_NAME, BUS_STATION_NOTES) VALUES (4, 'Bến Xe Ninh Bình 2','');/*8*/




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
INSERT INTO TICKET(TICKET_ID,TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('ABCKA1','',2,1,1,'100-90-60-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

INSERT INTO TICKET(TICKET_ID,TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('ABCKA2','',2,1,2,'100-90-50-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');
INSERT INTO TICKET(TICKET_ID,TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('ABCKA3','',2,1,1,'100-100-50-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

INSERT INTO TICKET(TICKET_ID,TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('ABCKA4','',2,1,2,'90-110-50-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');


/*
INSERT INTO TICKET(TICKET_ID,TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('ABCKA5','',2,2,1,'60-110-90-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

INSERT INTO TICKET(TICKET_ID,TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('ABCKA6','',2,2,2,'60-100-100-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');
INSERT INTO TICKET(TICKET_ID,TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('ABCKA7','',2,2,1,'40-110-90-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

INSERT INTO TICKET(TICKET_ID,TICKET_STATE, EMPLOYEE_ID, ROUTE_ID, BUS_ID, TICKET_PRICE,TICKET_TAX, TICKET_SALE,TICKET_FITMENT_PRICE, TICKET_CURRENCY, TICKET_AVAILABLE, TICKET_COUNT, TICKET_START_SELL_DATE, TICKET_END_SELL_DATE)
VALUES('ABCKA8','',2,2,2,'50-110-100-','0','0','0','VND',1,40,'2016-02-20 06:00:00','2016-06-19 06:00:00');

*/





INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA1',1,1,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA1',4,8,'2016-06-22','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA1',3,5,'2016-06-23','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA1',2,3,'2016-06-24','14:00:00');

INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA2',1,1,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA2',4,7,'2016-06-22','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA2',3,5,'2016-06-23','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA2',2,4,'2016-06-24','14:00:00');

INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA3',1,2,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA3',4,8,'2016-06-22','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA3',3,6,'2016-06-23','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA3',2,4,'2016-06-24','14:00:00');

INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA4',1,1,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA4',4,7,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA4',3,5,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA4',2,3,'2016-06-21','14:00:00');

/*
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA5',2,1,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA5',3,8,'2016-06-22','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA5',4,5,'2016-06-23','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA5',1,3,'2016-06-24','14:00:00');

INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA6',2,1,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA6',3,7,'2016-06-22','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA6',4,5,'2016-06-23','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA6',1,4,'2016-06-24','14:00:00');

INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA7',2,2,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA7',3,8,'2016-06-22','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA7',4,6,'2016-06-23','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA7',1,4,'2016-06-24','14:00:00');

INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA8',2,1,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA8',3,7,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA8',4,5,'2016-06-21','14:00:00');
INSERT INTO TICKET_DETAIL(TICKET_ID,PROVINCE_ID,BUS_STATION_ID,DETAIL_DATE,DETAIL_TIME) VALUES ('ABCKA8',1,3,'2016-06-21','14:00:00');

*/
/*
INSERT INTO SEAT_ORDER(TICKET_ID, SEAT, ROUTES) VALUES(1,'/1_A/|/2_A/|','(1-2)(2-3)(3-4)');
INSERT INTO SEAT_ORDER(TICKET_ID, SEAT, ROUTES) VALUES(1,'/4_C/|/10_D/|','(1-2)');
INSERT INTO SEAT_ORDER(TICKET_ID, SEAT, ROUTES) VALUES(1,'/12_A/|/13_D/|','(2-3)(3-4)');
*/
USE Bus_Managerment

SELECT * FROM ticket t WHERE T.ROUTE_ID IN (SELECT rd1.ROUTE_ID FROM ROUTE_DETAIL rd1 WHERE rd1.PROVINCE_ID =3) 
AND T.ROUTE_ID IN (SELECT rd2.ROUTE_ID FROM ROUTE_DETAIL rd2 WHERE rd2.PROVINCE_ID =4)  AND (SELECT rd3.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd3 WHERE rd3.ROUTE_ID =t.ROUTE_ID AND rd3.PROVINCE_ID =3)>(SELECT rd4.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd4 WHERE  rd4.ROUTE_ID =t.ROUTE_ID AND rd4.PROVINCE_ID =4) AND DATE(t.TICKET_ORIGIN_TIME) ='2016-06-20' ;

SELECT * FROM ticket t WHERE T.ROUTE_ID IN 
(SELECT rd1.ROUTE_ID FROM ROUTE_DETAIL rd1 WHERE rd1.PROVINCE_ID =2) 
AND T.ROUTE_ID IN (SELECT rd2.ROUTE_ID FROM ROUTE_DETAIL rd2 WHERE rd2.PROVINCE_ID =1)  
AND (SELECT rd3.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd3 WHERE rd3.ROUTE_ID =t.ROUTE_ID 
AND rd3.PROVINCE_ID =2)>(SELECT rd4.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd4 WHERE  rd4.ROUTE_ID =t.ROUTE_ID AND rd4.PROVINCE_ID =1) 
AND (SELECT DETAIL_DATE FROM TICKET_DETAIL td WHERE t.TICKET_ID=td.TICKET_ID AND td.PROVINCE_ID=1)= '2016-06-21';

SELECT td.DETAIL_TIME FROM TICKET_DETAIL td WHERE td.ROUTE_ID = 1 AND td.PROVINCE_ID=3)= '2016-06-21'

SELECT * FROM SEAT_ORDER WHERE TICKET_ID = 9 AND ROUTES LIKE '%(1-2)%'
SELECT * FROM SEAT_ORDER s  WHERE s.TICKET_ID =5 AND  (ROUTES LIKE '%(1-2)%'  OR ROUTES LIKE '%(2-3)%'  OR ROUTES LIKE '%(3-4)%' )

SELECT * FROM ticket t  WHERE T.ROUTE_ID IN 
(SELECT rd1.ROUTE_ID FROM ROUTE_DETAIL rd1 WHERE rd1.PROVINCE_ID =2)  
AND T.ROUTE_ID IN (SELECT rd2.ROUTE_ID FROM ROUTE_DETAIL rd2 WHERE rd2.PROVINCE_ID =1)  
AND (SELECT rd3.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd3  WHERE rd3.ROUTE_ID =t.ROUTE_ID 
AND rd3.PROVINCE_ID =2)>(SELECT rd4.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd4 WHERE  rd4.ROUTE_ID =t.ROUTE_ID AND rd4.PROVINCE_ID =1) 
AND (SELECT DETAIL_DATE FROM TICKET_DETAIL td WHERE t.TICKET_ID=td.TICKET_ID AND td.PROVINCE_ID= 1 )= '21-06-2016'


SELECT * FROM EMPLOYEE WHERE EMPLOYEE_JOB_ID=1
/* lay ngay khoi hanh dau tien cua chuyen di*/

SELECT * FROM ticket_detail WHERE ticket_id='ABCKA1' AND province_id=(SELECT province_id FROM route_detail WHERE route_id=1 AND numbercial_order=1)


SELECT * FROM ACCOUNT WHERE ACCOUNT_NAME='thanhld24' AND ACCOUNT_PASSWORD='e10adc3949ba59abbe56e057f20f883e'