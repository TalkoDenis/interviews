-- Удаление таблиц
drop table pass_in_trip;
drop table trip;
drop table passenger;
drop table company;
drop table price;

-- Создание таблиц
CREATE TABLE Company (
	ID_comp int NOT NULL ,
	name char (10) NOT NULL 
)
;

CREATE TABLE Pass_in_trip (
	trip_no int NOT NULL ,
	date timestamp NOT NULL ,
	ID_psg int NOT NULL ,
	place char (10) NOT NULL 
)
;

CREATE TABLE Passenger (
	ID_psg int NOT NULL ,
	name char (20) NOT NULL 
)
;

CREATE TABLE Trip (
	trip_no int NOT NULL ,
	ID_comp int NOT NULL ,
	plane char (10) NOT NULL ,
	town_from char (25) NOT NULL ,
	town_to char (25) NOT NULL ,
	time_out timestamp NOT NULL ,
	time_in timestamp NOT NULL 
)
;

CREATE TABLE Price (
	trip_no int NOT NULL ,
	price int NOT NULL 
)
;

-- Загрузка данных в таблицы                                                                                                                                                                                                                                                          
-- Company
insert into Company values(1,'Don_avia  ');
insert into Company values(2,'Aeroflot  ');
insert into Company values(3,'Dale_avia ');
insert into Company values(4,'air_France');
insert into Company values(5,'British_AW');
                                                                                                                                                                                                                                                                 
-- Passenger
insert into Passenger values(1,'Bruce Willis        ');
insert into Passenger values(2,'George Clooney      ');
insert into Passenger values(3,'Kevin Costner       ');
insert into Passenger values(4,'Donald Sutherland   ');
insert into Passenger values(5,'Jennifer Lopez      ');
insert into Passenger values(6,'Ray Liotta          ');
insert into Passenger values(7,'Samuel L. Jackson   ');
insert into Passenger values(8,'Nikole Kidman       ');
insert into Passenger values(9,'Alan Rickman        ');
insert into Passenger values(10,'Kurt Russell        ');
insert into Passenger values(11,'Harrison Ford       ');
insert into Passenger values(12,'Russell Crowe       ');
insert into Passenger values(13,'Steve Martin        ');
insert into Passenger values(14,'Michael Caine       ');
insert into Passenger values(15,'Angelina Jolie      ');
insert into Passenger values(16,'Mel Gibson          ');
insert into Passenger values(17,'Michael Douglas     ');
insert into Passenger values(18,'John Travolta       ');
insert into Passenger values(19,'Sylvester Stallone  ');
insert into Passenger values(20,'Tommy Lee Jones     ');
insert into Passenger values(21,'Catherine Zeta-Jones');
insert into Passenger values(22,'Antonio Banderas    ');
insert into Passenger values(23,'Kim Basinger        ');
insert into Passenger values(24,'Sam Neill           ');
insert into Passenger values(25,'Gary Oldman         ');
insert into Passenger values(26,'Clint Eastwood      ');
insert into Passenger values(27,'Brad Pitt           ');
insert into Passenger values(28,'Johnny Depp         ');
insert into Passenger values(29,'Pierce Brosnan      ');
insert into Passenger values(30,'Sean Connery        ');
insert into Passenger values(31,'Bruce Willis        ');
insert into Passenger values(37,'Mullah Omar         ');
                                                                                                                                                                                                                                                                 
-- Trip
insert into Trip values(1100,4,'Boeing    ','Rostov                   ','Paris                    ','19000101 14:30:00.000','19000101 17:50:00.000');
insert into Trip values(1101,4,'Boeing    ','Paris                    ','Rostov                   ','19000101 08:12:00.000','19000101 11:45:00.000');
insert into Trip values(1123,3,'TU-154    ','Rostov                   ','Vladivostok              ','19000101 16:20:00.000','19000101 03:40:00.000');
insert into Trip values(1124,3,'TU-154    ','Vladivostok              ','Rostov                   ','19000101 09:00:00.000','19000101 19:50:00.000');
insert into Trip values(1145,2,'IL-86     ','Moscow                   ','Rostov                   ','19000101 09:35:00.000','19000101 11:23:00.000');
insert into Trip values(1146,2,'IL-86     ','Rostov                   ','Moscow                   ','19000101 17:55:00.000','19000101 20:01:00.000');
insert into Trip values(1181,1,'TU-134    ','Rostov                   ','Moscow                   ','19000101 06:12:00.000','19000101 08:01:00.000');
insert into Trip values(1182,1,'TU-134    ','Moscow                   ','Rostov                   ','19000101 12:35:00.000','19000101 14:30:00.000');
insert into Trip values(1187,1,'TU-134    ','Rostov                   ','Moscow                   ','19000101 15:42:00.000','19000101 17:39:00.000');
insert into Trip values(1188,1,'TU-134    ','Moscow                   ','Rostov                   ','19000101 22:50:00.000','19000101 00:48:00.000');
insert into Trip values(1195,1,'TU-154    ','Rostov                   ','Moscow                   ','19000101 23:30:00.000','19000101 01:11:00.000');
insert into Trip values(1196,1,'TU-154    ','Moscow                   ','Rostov                   ','19000101 04:00:00.000','19000101 05:45:00.000');
insert into Trip values(7771,5,'Boeing    ','London                   ','Singapore                ','19000101 01:00:00.000','19000101 11:00:00.000');
insert into Trip values(7772,5,'Boeing    ','Singapore                ','London                   ','19000101 12:00:00.000','19000101 02:00:00.000');
insert into Trip values(7773,5,'Boeing    ','London                   ','Singapore                ','19000101 03:00:00.000','19000101 13:00:00.000');
insert into Trip values(7774,5,'Boeing    ','Singapore                ','London                   ','19000101 14:00:00.000','19000101 06:00:00.000');
insert into Trip values(7775,5,'Boeing    ','London                   ','Singapore                ','19000101 09:00:00.000','19000101 20:00:00.000');
insert into Trip values(7776,5,'Boeing    ','Singapore                ','London                   ','19000101 18:00:00.000','19000101 08:00:00.000');
insert into Trip values(7777,5,'Boeing    ','London                   ','Singapore                ','19000101 18:00:00.000','19000101 06:00:00.000');
insert into Trip values(7778,5,'Boeing    ','Singapore                ','London                   ','19000101 22:00:00.000','19000101 12:00:00.000');
insert into Trip values(8881,5,'Boeing    ','London                   ','Paris                    ','19000101 03:00:00.000','19000101 04:00:00.000');
insert into Trip values(8882,5,'Boeing    ','Paris                    ','London                   ','19000101 22:00:00.000','19000101 23:00:00.000');
                                                                                                                                                                                                                                                           
-- Pass_in_trip
insert into Pass_in_trip values(1100,'20030429 00:00:00.000',1,'1a        ');
insert into Pass_in_trip values(1123,'20030405 00:00:00.000',3,'2a        ');
insert into Pass_in_trip values(1123,'20030408 00:00:00.000',1,'4c        ');
insert into Pass_in_trip values(1123,'20030408 00:00:00.000',6,'4b        ');
insert into Pass_in_trip values(1124,'20030402 00:00:00.000',2,'2d        ');
insert into Pass_in_trip values(1145,'20030405 00:00:00.000',3,'2c        ');
insert into Pass_in_trip values(1181,'20030401 00:00:00.000',1,'1a        ');
insert into Pass_in_trip values(1181,'20030401 00:00:00.000',6,'1b        ');
insert into Pass_in_trip values(1181,'20030401 00:00:00.000',8,'3c        ');
insert into Pass_in_trip values(1181,'20030413 00:00:00.000',5,'1b        ');
insert into Pass_in_trip values(1182,'20030413 00:00:00.000',5,'4b        ');
insert into Pass_in_trip values(1187,'20030414 00:00:00.000',8,'3a        ');
insert into Pass_in_trip values(1188,'20030401 00:00:00.000',8,'3a        ');
insert into Pass_in_trip values(1182,'20030413 00:00:00.000',9,'6d        ');
insert into Pass_in_trip values(1145,'20030425 00:00:00.000',5,'1d        ');
insert into Pass_in_trip values(1187,'20030414 00:00:00.000',10,'3d        ');
insert into Pass_in_trip values(8882,'20051106 00:00:00.000',37,'1a        ') ;
insert into Pass_in_trip values(7771,'20051107 00:00:00.000',37,'1c        ') ;
insert into Pass_in_trip values(7772,'20051107 00:00:00.000',37,'1a        ') ;
insert into Pass_in_trip values(8881,'20051108 00:00:00.000',37,'1d        ') ;
insert into Pass_in_trip values(7778,'20051105 00:00:00.000',10,'2a        ') ;
insert into Pass_in_trip values(7772,'20051129 00:00:00.000',10,'3a        ');
insert into Pass_in_trip values(7771,'20051104 00:00:00.000',11,'4a        ');
insert into Pass_in_trip values(7771,'20051107 00:00:00.000',11,'1b        ');
insert into Pass_in_trip values(7771,'20051109 00:00:00.000',11,'5a        ');
insert into Pass_in_trip values(7772,'20051107 00:00:00.000',12,'1d        ');
insert into Pass_in_trip values(7773,'20051107 00:00:00.000',13,'2d        ');
insert into Pass_in_trip values(7772,'20051129 00:00:00.000',13,'1b        ');
insert into Pass_in_trip values(8882,'20051113 00:00:00.000',14,'3d        ');
insert into Pass_in_trip values(7771,'20051114 00:00:00.000',14,'4d        ');
insert into Pass_in_trip values(7771,'20051116 00:00:00.000',14,'5d        ');
insert into Pass_in_trip values(7772,'20051129 00:00:00.000',14,'1c        ');

-- Price
insert into Price values(1100,1600);
insert into Price values(1101,2100);
insert into Price values(1123,1700);
insert into Price values(1124,2500);
insert into Price values(1145,2200);
insert into Price values(1146,3600);
insert into Price values(1181,2400);
insert into Price values(1182,3500);
insert into Price values(1187,2100);
insert into Price values(1188,1200);
insert into Price values(1195,3200);
insert into Price values(1196,2400);
insert into Price values(7771,3700);
insert into Price values(7772,2300);
insert into Price values(7773,2400);
insert into Price values(7774,1700);
insert into Price values(7775,3800);
insert into Price values(7776,3100);
insert into Price values(7777,3000);
insert into Price values(7778,2700);
insert into Price values(8881,3900);
insert into Price values(8882,2800);