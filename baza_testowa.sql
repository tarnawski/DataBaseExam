-- Create new datasources

CREATE TABLE SIEDZIBY (
        ID_SIEDZIBY             DECIMAL(3),
        REGION          VARCHAR(20));

CREATE TABLE WYDZIALY (
        ID_WYDZIALU           DECIMAL(2),
        NAZWA                    VARCHAR(14),
        ID_SIEDZIBY             DECIMAL(3));

CREATE TABLE ETATY (
        ID_ETATU                  DECIMAL(3),
        ETAT                VARCHAR(30));

CREATE TABLE PRACOWNICY (
        ID_PRACOWNIKA             DECIMAL(4),
        NAZWISKO               VARCHAR(15),
        IMIE              VARCHAR(15),
        DRUGIE_IMIE          VARCHAR(1),
        ID_ETATU                  DECIMAL(3),
        ID_SZEFA              DECIMAL(4),
        DATA_ZATRUDNIENIA               DATE,
        PENSJA                  DECIMAL(7,2),
        PROWIZJA              DECIMAL(7,2),
        ID_WYDZIALU           DECIMAL(2));

CREATE TABLE POZIOMY_PENSJI (
        ID_POZIOMU                DECIMAL(3),
        DOLNA_GRANICA             DECIMAL(7,2),
        GORNA_GRANICA             DECIMAL(7,2));

CREATE TABLE WYROBY (
        ID_PRODUKTU              DECIMAL (6),
        OPIS             VARCHAR (30));
 
CREATE TABLE CENY (
        ID_PRODUKTU              DECIMAL (6),
        CENA_CENNIKOWA              DECIMAL (8,2),
        CENA_MINIMALNA               DECIMAL (8,2),
        DATA_OBWIAZYWANIA              DATE,
        DATA_WYCOFANIA                DATE);

CREATE TABLE KLIENCI (
        ID_KLIENTA             DECIMAL (6),
        NAZWA                    VARCHAR (45),
        ADRES                 VARCHAR (40),
        MIASTO                    VARCHAR (30),
        STAN                   VARCHAR (2),
        KOD_POCZTOWY                VARCHAR (9),
        NR_KIERUNKOWY               DECIMAL (3),
        TELEFON            DECIMAL (7),
        ID_PRACOWNIKA          DECIMAL (4),
        LIMIT_KREDYTOWY            DECIMAL (9,2),
        KOMENTARZ                TEXT);

CREATE TABLE ZAMOWIENIA  (
        ID_ZAMOWIENIA                DECIMAL (4),
        DATA_ZAMOWIENIA              DATE,
        ID_KLIENTA             DECIMAL (6),
        DATA_WYSYLKI               DATE,
        WARTOSC                   DECIMAL (8,2));

CREATE TABLE WIERSZE_ZAMOWIEN  (
        ID_ZAMOWIENIA                DECIMAL (4),
        ID_WIERSZA_ZAM                 DECIMAL (4),
        ID_PRODUKTU              DECIMAL (6),
        CENA            DECIMAL (8,2),
        ILOSC                DECIMAL (8),
        WARTOSC                   DECIMAL (8,2));

-- Insert Data

INSERT INTO SIEDZIBY VALUES (122, 'NEW YORK');
INSERT INTO SIEDZIBY VALUES (124, 'DALLAS');
INSERT INTO SIEDZIBY VALUES (123, 'CHICAGO');
INSERT INTO SIEDZIBY VALUES (167, 'BOSTON');

INSERT INTO WYDZIALY VALUES (10,'ACCOUNTING','122');
INSERT INTO WYDZIALY VALUES (20,'RESEARCH','124');
INSERT INTO WYDZIALY VALUES (30,'SALES','123');
INSERT INTO WYDZIALY VALUES (40,'OPERATIONS','167');

INSERT INTO WYDZIALY VALUES
  ( 12 , 'RESEARCH', '122');

INSERT INTO WYDZIALY VALUES
  ( 13 , 'SALES', '122');

INSERT INTO WYDZIALY VALUES
  ( 14 , 'OPERATIONS', '122');

INSERT INTO WYDZIALY VALUES
  ( 23 , 'SALES', '124');

INSERT INTO WYDZIALY VALUES
  ( 24 , 'OPERATIONS', '124');

INSERT INTO WYDZIALY VALUES
  ( 34 , 'OPERATIONS', '123');

INSERT INTO WYDZIALY VALUES
  ( 43 , 'SALES', '167');

INSERT INTO ETATY VALUES (667, 'CLERK');
INSERT INTO ETATY VALUES (668, 'STAFF');
INSERT INTO ETATY VALUES (669, 'ANALYST');
INSERT INTO ETATY VALUES (670, 'SALESPERSON');
INSERT INTO ETATY VALUES (671, 'MANAGER');
INSERT INTO ETATY VALUES (672, 'PRESIDENT');

INSERT INTO POZIOMY_PENSJI VALUES (1,700,1200);
INSERT INTO POZIOMY_PENSJI VALUES (2,1201,1400);
INSERT INTO POZIOMY_PENSJI VALUES (3,1401,2000);
INSERT INTO POZIOMY_PENSJI VALUES (4,2001,3000);
INSERT INTO POZIOMY_PENSJI VALUES (5,3001,9999);

INSERT INTO PRACOWNICY VALUES
    (7369,'SMITH','JOHN','Q',667,7902,NOW(),800,NULL,20);
INSERT INTO PRACOWNICY VALUES
    (7499,'ALLEN','KEVIN','J',670,7698,NOW(),1600,300,30);
INSERT INTO PRACOWNICY VALUES
    (7505,'DOYLE','JEAN','K',671,7839,NOW(),2850,NULL,13);
INSERT INTO PRACOWNICY VALUES
    (7506,'DENNIS','LYNN','S',671,7839,NOW(),2750,NULL,23);
INSERT INTO PRACOWNICY VALUES
    (7507,'BAKER','LESLIE','D',671,7839,NOW(),2200,NULL,14);
INSERT INTO PRACOWNICY VALUES
    (7521,'WARD','CYNTHIA','D',670,7698,NOW(),1250,500,30);
INSERT INTO PRACOWNICY VALUES
    (7555,'PETERS','DANIEL','T',670,7505,NOW(),1250,300,13);
INSERT INTO PRACOWNICY VALUES
    (7557,'SHAW','KAREN','P',670,7505,NOW(),1250,1200,13);
INSERT INTO PRACOWNICY VALUES
    (7560,'DUNCAN','SARAH','S',670,7506,NOW(),1250,NULL,23);
INSERT INTO PRACOWNICY VALUES
    (7564,'LANGE','GREGORY','J',670,7506,NOW(),1250,300,23);
INSERT INTO PRACOWNICY VALUES
    (7566,'JONES','TERRY','M',671,7839,NOW(),2975,NULL,20);
INSERT INTO PRACOWNICY VALUES
    (7569,'ALBERTS','CHRIS','L',671,7839,NOW(),3000,NULL,12);
INSERT INTO PRACOWNICY VALUES
    (7600,'PORTER','RAYMOND','Y',670,7505,NOW(),1250,900,13);
INSERT INTO PRACOWNICY VALUES
    (7609,'LEWIS','RICHARD','M',668,7507,NOW(),1800,NULL,24);
INSERT INTO PRACOWNICY VALUES
    (7654,'MARTIN','KENNETH','J',670,7698,NOW(),1250,1400,30);
INSERT INTO PRACOWNICY VALUES
    (7676,'SOMMERS','DENISE','D',668,7507,NOW(),1850,NULL,34);
INSERT INTO PRACOWNICY VALUES
    (7698,'BLAKE','MARION','S',671,7839,NOW(),2850,NULL,30);
INSERT INTO PRACOWNICY VALUES
    (7782,'CLARK','CAROL','F',671,7839,NOW(),2450,NULL,10);
INSERT INTO PRACOWNICY VALUES
    (7788,'SCOTT','DONALD','T',669,7566,NOW(),3000,NULL,20);
INSERT INTO PRACOWNICY VALUES
    (7789,'WEST','LIVIA','N',670,7506,NOW(),1500,1000,23);
INSERT INTO PRACOWNICY VALUES
    (7799,'FISHER','MATTHEW','G',669,7569,NOW(),3000,NULL,12);
INSERT INTO PRACOWNICY VALUES
    (7820,'ROSS','PAUL','S',670,7505,NOW(),1300,800,43);
INSERT INTO PRACOWNICY VALUES
    (7839,'KING','FRANCIS','A',672,NULL,NOW(),5000,NULL,10);
INSERT INTO PRACOWNICY VALUES
    (7844,'TURNER','MARY','A',670,7698,NOW(),1500,0,30);
INSERT INTO PRACOWNICY VALUES
    (7876,'ADAMS','DIANE','G',667,7788,NOW(),1100,NULL,20);
INSERT INTO PRACOWNICY VALUES
    (7900,'JAMES','FRED','S',667,7698,NOW(),950,NULL,30);
INSERT INTO PRACOWNICY VALUES
    (7902,'FORD','JENNIFER','D',669,7566,NOW(),3000,NULL,20);
INSERT INTO PRACOWNICY VALUES
    (7916,'ROBERTS','GRACE','M',669,7569,NOW(),2875,NULL,12);
INSERT INTO PRACOWNICY VALUES
    (7919,'DOUGLAS','MICHAEL','A',667,7799,NOW(),800,NULL,12);
INSERT INTO PRACOWNICY VALUES
    (7934,'MILLER','BARBARA','M',667,7782,NOW(),1300,NULL,10);
INSERT INTO PRACOWNICY VALUES
    (7950,'JENSEN','ALICE','B',667,7505,NOW(),750,NULL,13);
INSERT INTO PRACOWNICY VALUES
    (7954,'MURRAY','JAMES','T',667,7506,NOW(),750,NULL,23);

INSERT INTO CENY VALUES
   (100871,4.8,3.2,NOW(),NULL);
INSERT INTO CENY VALUES
   (100890,58,46.4,NOW(),NULL);
INSERT INTO CENY VALUES
   (100890,54,40.5,NOW(),NULL);
INSERT INTO CENY VALUES
   (100860,35,28,NOW(),NULL);
INSERT INTO CENY VALUES
   (100860,32,25.6,NOW(),NULL);
INSERT INTO CENY VALUES
   (100860,30,24,NOW(),NULL);
INSERT INTO CENY VALUES
   (100861,45,36,NOW(),NULL);
INSERT INTO CENY VALUES
   (100861,42,33.6,NOW(),NULL);
INSERT INTO CENY VALUES
   (100861,39,31.2,NOW(),NULL);
INSERT INTO CENY VALUES
   (100870,2.8,2.4,NOW(),NULL);
INSERT INTO CENY VALUES
   (100870,2.4,1.9,NOW(),NULL);
INSERT INTO CENY VALUES
   (100871,5.6,4.8,NOW(),NULL);
INSERT INTO CENY VALUES
   (101860,24,18,NOW(),NULL);
INSERT INTO CENY VALUES
   (101863,12.5,9.4,NOW(),NULL);
INSERT INTO CENY VALUES
   (102130,3.4,2.8,NOW(),NULL);
INSERT INTO CENY VALUES
   (200376,2.4,1.75,NOW(),NULL);
INSERT INTO CENY VALUES
   (200380,4,3.2,NOW(),NULL);
INSERT INTO CENY VALUES
   (103120,23.2,18.6,NOW(),NULL);
INSERT INTO CENY VALUES
   (103120,24,19.2,NOW(),NULL);
INSERT INTO CENY VALUES
   (103120,25,20,NOW(),NULL);
INSERT INTO CENY VALUES
   (103121,27.8,22.3,NOW(),NULL);
INSERT INTO CENY VALUES
   (103121,28.8,23,NOW(),NULL);
INSERT INTO CENY VALUES
   (103121,30,24,NOW(),NULL);
INSERT INTO CENY VALUES
   (103130,4,3.5,NOW(),NULL);
INSERT INTO CENY VALUES
   (103130,4.2,3.6,NOW(),NULL);
INSERT INTO CENY VALUES
   (103131,4.2,3.6,NOW(),NULL);
INSERT INTO CENY VALUES
   (103131,4.5,3.9,NOW(),NULL);
INSERT INTO CENY VALUES
   (103140,20,15,NOW(),NULL);
INSERT INTO CENY VALUES
   (103141,20,15,NOW(),NULL);
INSERT INTO CENY VALUES
   (102132,3.4,2.8,NOW(),NULL);
INSERT INTO CENY VALUES
   (104350,40,32,NOW(),NULL);
INSERT INTO CENY VALUES
   (104350,42,33.6,NOW(),NULL);
INSERT INTO CENY VALUES
   (104350,44,35.3,NOW(),NULL);
INSERT INTO CENY VALUES
   (104351,23.6,18.9,NOW(),NULL);
INSERT INTO CENY VALUES
   (104351,24.8,19.8,NOW(),NULL);
INSERT INTO CENY VALUES
   (104351,26,20.8,NOW(),NULL);
INSERT INTO CENY VALUES
   (104352,50,35,NOW(),NULL);
INSERT INTO CENY VALUES
   (104352,54,37.8,NOW(),NULL);
INSERT INTO CENY VALUES
   (104352,58.3,40.8,NOW(),NULL);
INSERT INTO CENY VALUES
   (104360,36,29.5,NOW(),NULL);
INSERT INTO CENY VALUES
   (104360,39,32,NOW(),NULL);
INSERT INTO CENY VALUES
   (104361,47,33,NOW(),NULL);
INSERT INTO CENY VALUES
   (104361,50,35,NOW(),NULL);
INSERT INTO CENY VALUES
   (104362,5,4,NOW(),NULL);
INSERT INTO CENY VALUES
   (102134,3.4,2.8,NOW(),NULL);
INSERT INTO CENY VALUES
   (105123,36.3,29,NOW(),NULL);
INSERT INTO CENY VALUES
   (105123,37.7,32,NOW(),NULL);
INSERT INTO CENY VALUES
   (105123,40,34,NOW(),NULL);
INSERT INTO CENY VALUES
   (105124,10,7.6,NOW(),NULL);
INSERT INTO CENY VALUES
   (105124,12,9,NOW(),NULL);
INSERT INTO CENY VALUES
   (105124,15,10,NOW(),NULL);
INSERT INTO CENY VALUES
   (105125,2,1.7,NOW(),NULL);
INSERT INTO CENY VALUES
   (105125,3,2.6,NOW(),NULL);
INSERT INTO CENY VALUES
   (105126,5,4.3,NOW(),NULL);
INSERT INTO CENY VALUES
   (105126,6,5,NOW(),NULL);
INSERT INTO CENY VALUES
   (105127,6,5,NOW(),NULL);
INSERT INTO CENY VALUES
   (105128,10,8,NOW(),NULL);
INSERT INTO CENY VALUES
   (102136,3.4,2.8,NOW(),NULL);

INSERT INTO WYROBY VALUES ('100860', 'ACE TENNIS RACKET I');
INSERT INTO WYROBY VALUES ('100861', 'ACE TENNIS RACKET II');
INSERT INTO WYROBY VALUES ('100870', 'ACE TENNIS BALLS-3 PACK');
INSERT INTO WYROBY VALUES ('100871', 'ACE TENNIS BALLS-6 PACK');
INSERT INTO WYROBY VALUES ('100890', 'ACE TENNIS NET');
INSERT INTO WYROBY VALUES ('101860', 'SP TENNIS RACKET');
INSERT INTO WYROBY VALUES ('101863', 'SP JUNIOR RACKET');
INSERT INTO WYROBY VALUES ('102130', 'RH: "GUIDE TO TENNIS"');
INSERT INTO WYROBY VALUES ('200376', 'SB ENERGY BAR-6 PACK');
INSERT INTO WYROBY VALUES ('200380', 'SB VITA SNACK-6 PACK');
INSERT INTO WYROBY VALUES ( 103120 , 'WIFF SOFTBALL BAT I');
INSERT INTO WYROBY VALUES ( 103121 , 'WIFF SOFTBALL BAT II');
INSERT INTO WYROBY VALUES ( 103130 , 'WIFF SOFTBALL, SMALL');
INSERT INTO WYROBY VALUES ( 103131 , 'WIFF SOFTBALL, LARGE');
INSERT INTO WYROBY VALUES ( 103140 , 'WIFF SOFTBALL MITT (LH)');
INSERT INTO WYROBY VALUES ( 103141 , 'WIFF SOFTBALL MITT (RH)');
INSERT INTO WYROBY VALUES ( 102132 , 'RH: "GUIDE TO SOFTBALL"');
INSERT INTO WYROBY VALUES ( 104350 , 'DUNK BASKETBALL INDOOR');
INSERT INTO WYROBY VALUES ( 104351 , 'DUNK BASKETBALL OUTDOOR');
INSERT INTO WYROBY VALUES ( 104352 , 'DUNK BASKETBALL PROFESSIONAL');
INSERT INTO WYROBY VALUES ( 104360 , 'DUNK HOOP');
INSERT INTO WYROBY VALUES ( 104361 , 'DUNK HOOP W/FIBERGLASS BOARD');
INSERT INTO WYROBY VALUES ( 104362 , 'DUNK NETS - RAINBOW');
INSERT INTO WYROBY VALUES ( 102134 , 'RH: "GUIDE TO BASKETBALL"');
INSERT INTO WYROBY VALUES ( 105123 , 'YELLOW JERSEY BICYCLE HELMET');
INSERT INTO WYROBY VALUES ( 105124 , 'YELLOW JERSEY BICYCLE GLOVES');
INSERT INTO WYROBY VALUES ( 105125 , 'YELLOW JERSEY WATER BOTTLE');
INSERT INTO WYROBY VALUES ( 105126 , 'YELLOW JERSEY BOTTLE CAGE');
INSERT INTO WYROBY VALUES ( 105127 , 'YELLOW JERSEY FRAME PUMP');
INSERT INTO WYROBY VALUES ( 105128 , 'YELLOW JERSEY SADDLE PACK');
INSERT INTO WYROBY VALUES ( 102136 , 'RH: "GUIDE TO CYCLING"');

INSERT INTO ZAMOWIENIA VALUES
   (610,NOW(),101,NOW(),101.4);
INSERT INTO ZAMOWIENIA VALUES
   (611,NOW(),102,NOW(),45);
INSERT INTO ZAMOWIENIA VALUES
   (612,NOW(),104,NOW(),5860);
INSERT INTO ZAMOWIENIA VALUES
   (601,NOW(),106,NOW(),60.8);
INSERT INTO ZAMOWIENIA VALUES
   (602,NOW(),102,NOW(),56);
INSERT INTO ZAMOWIENIA VALUES
   (600,NOW(),103,NOW(),42);
INSERT INTO ZAMOWIENIA VALUES
   (604,NOW(),106,NOW(),642);
INSERT INTO ZAMOWIENIA VALUES
   (605,NOW(),106,NOW(),8374);
INSERT INTO ZAMOWIENIA VALUES
   (606,NOW(),100,NOW(),3.4);
INSERT INTO ZAMOWIENIA VALUES
   (609,NOW(),100,NOW(),102.5);
INSERT INTO ZAMOWIENIA VALUES
   (607,NOW(),104,NOW(),5.6);
INSERT INTO ZAMOWIENIA VALUES
   (608,NOW(),104,NOW(),35.2);
INSERT INTO ZAMOWIENIA VALUES
   (603,NOW(),102,NOW(),224);
INSERT INTO ZAMOWIENIA VALUES
   (620,NOW(),100,NOW(),4450);
INSERT INTO ZAMOWIENIA VALUES
   (613,NOW(),108,NOW(),6400);
INSERT INTO ZAMOWIENIA VALUES
   (614,NOW(),102,NOW(),23940);
INSERT INTO ZAMOWIENIA VALUES
   (616,NOW(),103,NOW(),764);
INSERT INTO ZAMOWIENIA VALUES
   (619,NOW(),104,NOW(),1260);
INSERT INTO ZAMOWIENIA VALUES
   (617,NOW(),105,NOW(),46370);
INSERT INTO ZAMOWIENIA VALUES
   (615,NOW(),107,NOW(),710);
INSERT INTO ZAMOWIENIA VALUES
   (618,NOW(),102,NOW(),3083);
INSERT INTO ZAMOWIENIA VALUES
   (621,NOW(),100,NOW(),730);
INSERT INTO ZAMOWIENIA VALUES
   (509,NOW(),226,NOW(),1174);
INSERT INTO ZAMOWIENIA VALUES
   (523,NOW(),226,NOW(),1165);
INSERT INTO ZAMOWIENIA VALUES
   (549,NOW(),226,NOW(),1620);
INSERT INTO ZAMOWIENIA VALUES
   (507,NOW(),228,NOW(),886);
INSERT INTO ZAMOWIENIA VALUES
   (516,NOW(),228,NOW(),1815);
INSERT INTO ZAMOWIENIA VALUES
   (553,NOW(),228,NOW(),4400);
INSERT INTO ZAMOWIENIA VALUES
   (526,NOW(),221,NOW(),7700);
INSERT INTO ZAMOWIENIA VALUES
   (543,NOW(),221,NOW(),8400);
INSERT INTO ZAMOWIENIA VALUES
   (555,NOW(),221,NOW(),8540);
INSERT INTO ZAMOWIENIA VALUES
   (559,NOW(),222,NOW(),387.2);
INSERT INTO ZAMOWIENIA VALUES
   (528,NOW(),224,NOW(),3770);
INSERT INTO ZAMOWIENIA VALUES
   (531,NOW(),224,NOW(),1400);
INSERT INTO ZAMOWIENIA VALUES
   (558,NOW(),224,NOW(),1700);
INSERT INTO ZAMOWIENIA VALUES
   (525,NOW(),225,NOW(),377);

INSERT INTO WIERSZE_ZAMOWIEN VALUES (600,1,100861,42,1,42);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (610,3,100890,58,1,58);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (611,1,100861,45,1,45);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (612,1,100860,30,100,3000);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (601,1,200376,2.4,12,28.8);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (601,2,100860,32,1,32);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (602,1,100870,2.8,20,56);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (604,1,100890,58,3,174);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (604,2,100861,42,2,84);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (604,3,100860,32,12,384);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (603,1,100860,32,7,224);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (610,1,100860,35,1,35);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (610,2,100870,2.8,3,8.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (613,4,200376,2.2,200,440);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (614,1,100860,35,444,15540);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (614,2,100870,2.8,1000,2800);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (612,2,100861,40.5,20,810);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (612,3,101863,10,150,1500);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (620,1,100860,35,10,350);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (620,2,200376,2.4,1000,2400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (620,3,102130,3.4,500,1700);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (613,1,100871,5.6,100,560);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (613,2,101860,24,200,4800);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (613,3,200380,4,150,600);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (619,3,102130,3.4,100,340);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,1,100860,35,50,1750);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,2,100861,45,100,4500);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (614,3,100871,5.6,1000,5600);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (616,1,100861,45,10,450);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (616,2,100870,2.8,50,140);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (616,3,100890,58,2,116);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (616,4,102130,3.4,10,34);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (616,5,200376,2.4,10,24);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (619,1,200380,4,100,400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (619,2,200376,2.4,100,240);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (615,1,100861,45,4,180);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (607,1,100871,5.6,1,5.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (615,2,100870,2.8,100,280);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,3,100870,2.8,500,1400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,4,100871,5.6,500,2800);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,5,100890,58,500,29000);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,6,101860,24,100,2400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,7,101863,12.5,200,2500);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,8,102130,3.4,100,340);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,9,200376,2.4,200,480);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (617,10,200380,4,300,1200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (609,2,100870,2.5,5,12.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (609,3,100890,50,1,50);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (618,1,100860,35,23,805);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (618,2,100861,45,50,2250);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (618,3,100870,2.8,10,28);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (621,1,100861,45,10,450);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (621,2,100870,2.8,100,280);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (615,3,100871,5,50,250);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (608,1,101860,24,1,24);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (608,2,100871,5.6,2,11.2);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (609,1,100861,40,1,40);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (606,1,102130,3.4,1,3.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (605,1,100861,45,100,4500);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (605,2,100870,2.8,500,1400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (605,3,100890,58,5,290);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (605,4,101860,24,50,1200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (605,5,101863,9.5,100,950);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (605,6,102130,3.4,10,34);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (612,4,100871,5.5,100,550);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (619,4,100871,5.6,50,280);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (509,1,105123,35,30,1050);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (509,2,105124,9,10,90);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (509,3,102136,3.4,10,34);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (523,1,102136,3.4,10,34);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (523,2,105123,37.7,30,1131);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (549,1,105123,38,5,190);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (549,2,105127,6,30,180);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (549,3,105125,3,200,600);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (549,4,105124,13,50,650);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (507,1,105123,35.3,20,706);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (507,2,105124,9,20,180);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (516,1,105124,9,60,540);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (516,2,102136,3.2,250,800);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (516,3,105125,1.9,250,475);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (553,1,105127,6,500,3000);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (553,2,200376,1.75,800,1400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (526,1,105123,32,100,3200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (526,2,105124,9,500,4500);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (543,1,105123,34,100,3400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (543,2,105124,10,500,5000);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (555,1,105123,34,100,3400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (555,2,105124,10,500,5000);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (555,3,102136,2.8,50,140);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (559,1,105123,40,5,200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (559,2,105124,15,5,75);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (559,3,105127,6,5,30);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (559,4,102136,3.4,3,10.2);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (559,5,200376,2.4,30,72);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (528,1,105123,37.7,100,3770);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (531,1,105124,11,100,1100);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (531,2,102136,3,100,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (558,1,105124,14,100,1400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (558,2,102136,3,100,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (525,1,105123,37.7,10,377);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (552,1,105123,40,10,400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (552,2,105124,15,10,150);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (552,3,102136,3.4,1,3.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (552,4,200376,2.4,1,2.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (556,1,102136,3.4,25,85);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (560,1,200376,2.4,30,72);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (565,1,105123,37,100,3700);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (565,2,105124,12,100,1200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (574,1,104350,41.8,25,1045);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (574,2,200380,3.2,200,640);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (576,1,104350,44,10,440);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (576,2,104351,26,10,260);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (576,3,104362,4.25,170,722.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (576,4,200376,2.16,90,194.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (576,5,200380,3.4,130,442);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (503,1,104350,38,30,1140);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (503,2,104351,23.6,10,236);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (503,3,104352,50,10,500);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (518,1,104350,38,25,950);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (518,2,104351,23.6,20,472);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (518,3,104360,36,20,720);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (518,4,104362,4.25,170,722.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (518,5,102134,3.4,20,68);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (517,1,104352,50,15,750);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (517,2,102134,3.4,10,34);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (544,1,104350,44,15,660);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (544,2,104351,26,15,390);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (544,3,104352,58.3,10,583);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (544,4,104361,50,10,500);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (544,5,104362,4.5,50,225);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (524,1,104350,42,10,420);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (524,2,104351,23.56,35,824.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (524,3,104362,4.25,150,637.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (524,4,102134,3.23,30,96.9);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (502,1,104352,50,10,500);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (539,1,104351,26,20,520);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (539,2,104360,39,20,780);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (511,1,104351,23.6,15,354);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (511,2,104362,4.5,50,225);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (511,3,102134,3.4,20,68);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (512,1,104360,36,10,360);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (512,2,102134,3.4,20,68);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (562,1,104351,24.7,25,617.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (562,2,104352,58.3,15,874.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (562,3,104362,4.25,130,552.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (529,1,104350,39.89,30,1196.7);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (529,2,102134,3.4,20,68);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (563,1,104352,58.3,10,583);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (563,2,200376,2.04,150,306);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (568,1,104351,24.7,30,741);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (568,2,200376,2.04,110,224.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (568,3,200380,3.6,70,252);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (504,1,104350,40,10,400);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (504,2,104351,22.42,35,784.7);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (504,3,104352,50,5,250);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (538,1,104351,24.7,30,741);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (535,1,104352,54,15,810);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (578,1,104350,41.8,40,1672);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (578,2,200376,2.04,190,387.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (578,3,200380,3.6,60,216);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (534,1,104350,42,10,420);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (536,1,104350,39.89,40,1595.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (536,2,104352,54,10,540);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (572,1,104351,24.7,25,617.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (572,2,104352,58.3,10,583);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (514,1,104350,38,30,1140);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (521,1,104350,40,20,800);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (521,2,102134,3.23,30,96.9);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (551,1,104350,44,10,440);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (551,2,104361,50,5,250);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (551,3,102134,3.4,20,68);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (551,4,200376,1.92,200,384);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (513,1,104350,40,15,600);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (513,2,104351,23.6,20,472);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (513,3,104362,4.25,100,425);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (508,1,104360,36,20,720);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (508,2,104362,4.5,80,360);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (515,1,104350,40,20,800);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (515,2,104351,22.42,25,560.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (515,3,102134,3.4,20,68);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (542,1,104350,41.8,25,1045);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (542,2,104360,39,20,780);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (542,3,104361,50,11,550);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (542,4,102134,3.4,10,34);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (573,1,103120,22.5,50,1125);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (573,2,103131,4.04,50,202);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (573,3,103141,20,15,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (566,1,103120,23.75,40,950);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (566,2,103121,27,50,1350);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (566,3,103130,3.77,60,226.2);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (566,4,103131,3.9,170,663);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (566,5,103141,20,10,200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (520,1,103130,4,10,40);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (520,2,103131,3.77,80,301.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (519,1,103130,3.5,110,385);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (519,2,103140,19,30,570);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (575,1,103140,19,30,570);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (575,2,200380,3.8,30,114);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (547,1,103130,3.77,80,301.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (547,2,103131,4.04,70,282.8);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (547,3,103140,20,15,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (547,4,103141,20,5,100);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (540,1,103130,3.98,40,159.2);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (540,2,103131,3.9,180,702);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (567,1,103140,20,10,200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (570,1,103131,4.04,90,363.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (570,2,103140,20,15,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (571,1,103131,4.04,70,282.8);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (571,2,103140,19,25,475);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (571,3,102132,3.4,15,51);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (571,4,200376,2.16,80,172.8);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (571,5,200380,3.8,30,114);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (541,1,103140,20,10,200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (541,2,103141,20,10,200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (532,1,103120,21.59,60,1295.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (527,1,103120,21.59,60,1295.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (527,2,103121,27.35,40,1094);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (527,3,103140,19,35,665);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (501,1,103130,3.6,60,216);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (564,1,103130,3.77,80,301.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (564,2,103131,3.9,120,468);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (564,3,102132,3.23,40,129.2);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (537,1,103130,3.6,160,576);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (537,2,102132,3.23,30,96.9);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (522,1,103120,21.59,80,1727.2);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (522,2,103121,28.8,10,288);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (522,3,103131,4.04,90,363.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (522,4,103141,20,10,200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (554,1,103131,4.04,70,282.8);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (569,1,103120,22.5,50,1125);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (569,2,103130,3.6,180,648);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (569,3,103141,20,15,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (550,1,103120,22.5,60,1350);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (550,2,103140,19,45,855);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (550,3,103141,20,5,100);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (550,4,102132,3.4,15,51);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (548,1,103140,19,30,570);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (548,2,102132,3.23,30,96.9);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (505,1,103130,3.5,100,350);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (505,2,103140,20,15,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (577,1,103121,30,20,600);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (577,2,103131,3.9,150,585);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (577,3,102132,3.23,25,80.75);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (533,1,103121,27.35,30,820.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (533,2,103130,3.77,80,301.6);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (561,1,103120,22.5,80,1800);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (561,2,103130,3.77,70,263.9);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (561,3,103141,20,15,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (561,4,200376,2.16,90,194.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (506,1,103120,20.88,80,1670.4);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (506,2,103130,3.5,180,630);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (506,3,103141,20,15,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (530,1,103121,25.91,50,1295.5);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (530,2,103130,3.6,200,720);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (530,3,103140,19,40,760);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (530,4,103141,20,10,200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (530,5,102132,3.4,15,51);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (545,1,103140,19,25,475);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (557,1,103120,23.75,40,950);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (557,2,103121,30,10,300);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (557,3,103140,19,35,665);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (557,4,200376,2.16,80,172.8);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (557,5,200380,3.4,110,374);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (546,1,103120,22.5,50,1125);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (546,2,103121,30,20,600);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (546,3,103130,3.6,120,432);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (546,4,103131,3.9,140,546);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (546,5,103140,19,40,760);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (546,6,103141,20,10,200);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (510,1,103120,20.88,60,1252.8);
INSERT INTO WIERSZE_ZAMOWIEN VALUES (510,2,103131,4.19,20,83.8);

INSERT INTO KLIENCI
  (KOD_POCZTOWY, STAN, ID_PRACOWNIKA, TELEFON, 
  NAZWA, 
  ID_KLIENTA, LIMIT_KREDYTOWY, MIASTO, NR_KIERUNKOWY, ADRES, 
  KOMENTARZ)
  VALUES ('96711', 'CA', '7844', '5986609', 
  'JOCKSPORTS',
  '100', '5000', 'BELMONT', '415', '345 VIEWRIDGE', 
  'Very friendly people to work with -- WYNIKI_SPRZEDAZY rep likes to be called Mike.');
 
INSERT INTO KLIENCI
  (KOD_POCZTOWY, STAN, ID_PRACOWNIKA, TELEFON, 
  NAZWA, 
  ID_KLIENTA, LIMIT_KREDYTOWY, MIASTO, NR_KIERUNKOWY, ADRES, 
  KOMENTARZ)
  VALUES ('94061', 'CA', '7521', '3681223',
  'TKB SPORT SHOP',
  '101', '10000', 'REDWOOD MIASTO', '415', '490 BOLI RD.', 
  'Rep called 5/8 about change in order - contact shipping.');
                                                              
INSERT INTO KLIENCI
  (KOD_POCZTOWY, STAN, ID_PRACOWNIKA, TELEFON, 
  NAZWA, 
  ID_KLIENTA, LIMIT_KREDYTOWY, MIASTO, NR_KIERUNKOWY, ADRES, 
  KOMENTARZ)
  VALUES ('95133', 'CA', '7654', '6443341', 
  'VOLLYRITE',
  '102', '7000', 'BURLINGAME', '415', '9722 HAMILTON', 
  'Company doing heavy promotion beginning 10/89. Prepare for large orders during winter.');
 
INSERT INTO KLIENCI
  (KOD_POCZTOWY, STAN, ID_PRACOWNIKA, TELEFON, 
  NAZWA, 
  ID_KLIENTA, LIMIT_KREDYTOWY, MIASTO, NR_KIERUNKOWY, ADRES, 
  KOMENTARZ)
  VALUES ('97544', 'CA', '7521', '6779312',
  'JUST TENNIS',
  '103', '3000', 'BURLINGAME', '415', 'HILLVIEW MALL', 
  'Contact rep about new line of tennis rackets.');
                                                             
INSERT INTO KLIENCI
  (KOD_POCZTOWY, STAN, ID_PRACOWNIKA, TELEFON, 
  NAZWA, 
  ID_KLIENTA, LIMIT_KREDYTOWY, MIASTO, NR_KIERUNKOWY, ADRES, 
  KOMENTARZ)
  VALUES ('93301', 'CA', '7499', '9962323',
  'EVERY MOUNTAIN',
  '104', '10000', 'CUPERTINO', '408', '574 SURRY RD.', 
  'KLIENCI with high market share (23%) due to aggressive advertising.');
                                                      
INSERT INTO KLIENCI
  (KOD_POCZTOWY, STAN, ID_PRACOWNIKA, TELEFON, 
  NAZWA, 
  ID_KLIENTA, LIMIT_KREDYTOWY, MIASTO, NR_KIERUNKOWY, ADRES, 
  KOMENTARZ)
  VALUES ('91003', 'CA', '7844', '3769966',
  'K + T SPORTS',
  '105', '5000', 'SANTA CLARA', '408', '3476 EL PASEO', 
  'Tends to order large amounts of merchandise at once. Accounting is considering raising their credit limit. Usually pays on time.');
                                                      
INSERT INTO KLIENCI
  (KOD_POCZTOWY, STAN, ID_PRACOWNIKA, TELEFON, 
  NAZWA, 
  ID_KLIENTA, LIMIT_KREDYTOWY, MIASTO, NR_KIERUNKOWY, ADRES, 
  KOMENTARZ)
  VALUES ('94301', 'CA', '7521', '3649777',
  'SHAPE UP',
  '106', '6000', 'PALO ALTO', '415', '908 SEQUOIA', 
  'Support intensive. Orders small amounts (< 800) of merchandise at a time.');
 
INSERT INTO KLIENCI
  (KOD_POCZTOWY, STAN, ID_PRACOWNIKA, TELEFON, 
  NAZWA, 
  ID_KLIENTA, LIMIT_KREDYTOWY, MIASTO, NR_KIERUNKOWY, ADRES, 
  KOMENTARZ)
  VALUES ('93301', 'CA', '7499', '9674398',
  'WOMENS SPORTS',
  '107', '10000', 'SUNNYVALE', '408', 'VALCO VILLAGE', 
  'First sporting goods store geared exclusively towards women. Unusual promotional style and very willing to take chances towards new WYROBYs!');
            
INSERT INTO KLIENCI
  (KOD_POCZTOWY, STAN, ID_PRACOWNIKA, TELEFON, 
  NAZWA, 
  ID_KLIENTA, LIMIT_KREDYTOWY, MIASTO, NR_KIERUNKOWY, ADRES, 
  KOMENTARZ)
  VALUES ('55649', 'MN', '7844', '5669123',
  'NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER',
  '108', '8000', 'HIBBING', '612', '98 LONE PINE WAY', '');

INSERT INTO KLIENCI VALUES
  ( 201 , 'STADIUM SPORTS', '47 IRVING PL.',
  'NEW YORK', 'NY', '10003',
  '212', '5555335',  7557 ,  10000 ,
  'Large general-purpose sports store with an affluent KLIENCI base.');

INSERT INTO KLIENCI VALUES
  ( 202 , 'HOOPS', '2345 ADAMS AVE.',
  'LEICESTER', 'MA', '01524',
  '508', '5557542',  7820 ,  5000 ,
  'Specializes in basketball equipment.');

INSERT INTO KLIENCI VALUES
  ( 203 , 'REBOUND SPORTS', '2 E. 14TH ST.',
  'NEW YORK', 'NY', '10009',
  '212', '5555989',  7557 ,  10000 ,
  'Follow up on the promotion proposal.');

INSERT INTO KLIENCI VALUES
  ( 204 , 'THE POWER FORWARD', '1 KNOTS LANDING',
  'DALLAS', 'TX', '75248',
  '214', '5550505',  7560 ,  12000 ,
  'Large floorspace.  Prefers maintaining large amounts of inventory on hand.');

INSERT INTO KLIENCI VALUES
  ( 205 , 'POINT GUARD', '20 THURSTON ST.',
  'YONKERS', 'NY', '10956',
  '914', '5554766',  7557 ,  3000 ,
  'Tremendous potential for an exclusive agreement.');

INSERT INTO KLIENCI VALUES
  ( 206 , 'THE COLISEUM', '5678 WILBUR PL.',
  'SCARSDALE', 'NY', '10583',
  '914', '5550217',  7557 ,  6000 ,
  'Contact rep. about new WYROBY lines.');

INSERT INTO KLIENCI VALUES
  ( 207 , 'FAST BREAK', '1000 HERBERT LN.',
  'CONCORD', 'MA', '01742',
  '508', '5551298',  7820 ,  7000 ,
  'KLIENCI requires written CENY quotes before making purchase requisitions.');

INSERT INTO KLIENCI VALUES
  ( 208 , 'AL AND BOB''S SPORTS', '260 YORKTOWN CT.',
  'AUSTIN', 'TX', '78731',
  '512', '5557631',  7560 ,  4000 ,
  'Very personal purchasing agents -- Sharon and Scott.');

INSERT INTO KLIENCI VALUES
  ( 211 , 'AT BAT', '234 BEACHEM ST.',
  'BROOKLINE', 'MA', '02146',
  '617', '5557385',  7820 ,  8000 ,
  'Have an open purchase order for $3000.  Ship immediately on request.');

INSERT INTO KLIENCI VALUES
  ( 212 , 'ALL SPORT', '1000 38TH ST.',
  'BROOKLYN', 'NY', '11210',
  '718', '5551739',  7600 ,  6000 ,
  'Pursue a contract -- possible candidate for volume purchasing agreements.');

INSERT INTO KLIENCI VALUES
  ( 213 , 'GOOD SPORT', '400 46TH ST.',
  'SUNNYSIDE', 'NY', '11104',
  '718', '5553771',  7600 ,  5000 ,
  'May be moving to a larger SIEDZIBY.');

INSERT INTO KLIENCI VALUES
  ( 214 , 'AL''S PRO SHOP', '45 SPRUCE ST.',
  'SPRING', 'TX', '77388',
  '713', '5555172',  7564 ,  8000 ,
  'Target market is serious athletes.');

INSERT INTO KLIENCI VALUES
  ( 215 , 'BOB''S FAMILY SPORTS', '400 E. 23RD',
  'HOUSTON', 'TX', '77026',
  '713', '5558015',  7654 ,  8000 ,
  'Target market is casual and weekend athletes.  Offers a large selection.');

INSERT INTO KLIENCI VALUES
  ( 216 , 'THE ALL AMERICAN', '547 PRENTICE RD.',
  'CHELSEA', 'MA', '02150',
  '617', '5553047',  7820 ,  5000 ,
  'KLIENCI prefers to be called between 10 and 12.');

INSERT INTO KLIENCI VALUES
  ( 217 , 'HIT, THROW, AND RUN', '333 WOOD COURT',
  'GRAPEVINE', 'TX', '76051',
  '817', '5552352',  7564 ,  6000 ,
  'General purpose sports store.');

INSERT INTO KLIENCI VALUES
  ( 218 , 'THE OUTFIELD', '346 GARDEN BLVD.',
  'FLUSHING', 'NY', '11355',
  '718', '5552131',  7820 ,  4000 ,
  'Store does not open until 11am and does not have an answering service.');

INSERT INTO KLIENCI VALUES
  ( 221 , 'WHEELS AND DEALS', '2 MEMORIAL DRIVE',
  'HOUSTON', 'TX', '77007',
  '713', '5554139',  7789 ,  10000 ,
  'Discount bicycle and sporting good store.');

INSERT INTO KLIENCI VALUES
  ( 222 , 'JUST BIKES', '4000 PARKRIDGE BLVD.',
  'DALLAS', 'TX', '75205',
  '214', '5558735',  7789 ,  4000 ,
  'Exclusive bicycle dealer.');

INSERT INTO KLIENCI VALUES
  ( 223 , 'VELO SPORTS', '23 WHITE ST.',
  'MALDEN', 'MA', '02148',
  '617', '5554983',  7820 ,  5000 ,
  'Clerk answers all phone lines.  Ask for Mike.');

INSERT INTO KLIENCI VALUES
  ( 224 , 'JOE''S BIKE SHOP', '4500 FOX COURT',
  'GRAND PRARIE', 'TX', '75051',
  '214', '5559834',  7789 ,  6000 ,
  'Call Joe to make sure last shipment was complete.');

INSERT INTO KLIENCI VALUES
  ( 225 , 'BOB''S SWIM, CYCLE, AND RUN', '300 HORSECREEK CIRCLE',
  'IRVING', 'TX', '75039',
  '214', '5558388',  7789 ,  7000 ,
  'Store catering to triathletes.');

INSERT INTO KLIENCI VALUES
  ( 226 , 'CENTURY SHOP', '8 DAGMAR DR.',
  'HUNTINGTON', 'NY', '11743',
  '516', '5553006',  7555 ,  4000 ,
  'KLIENCI in the midst of a cost-cutting program.');

INSERT INTO KLIENCI VALUES
  ( 227 , 'THE TOUR', '2500 GARDNER RD.',
  'SOMERVILLE', 'MA', '02144',
  '617', '5556673',  7820 ,  5000 ,
  'KLIENCI referred to us by The All American.');

INSERT INTO KLIENCI VALUES
  ( 228 , 'FITNESS FIRST', '5000 85TH ST.',
  'JACKSON HEIGHTS', 'NY', '11372',
  '718', '5558710',  7555 ,  4000 ,
  'Recently acquired another sporting goods store.  Expect higher volume in the future.');
