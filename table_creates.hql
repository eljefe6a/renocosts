drop table policecallsorig;
CREATE TABLE policecallsorig
       (PRIORITY string,CALL_TYPE string,JURISDICTION string,HOME_DAREA string,RECEIVED_DATE string,RECEIVED_TIME string,DISPATCH_TIME string,ONSCENE_TIME string,CLEAR_TIME string,DISPOSITION string,SECONDSONCALL INT)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;
LOAD DATA INPATH "police_january_clean.csv" INTO TABLE policecallsorig;

drop table firecallsorig;
CREATE TABLE firecallsorig
       (ALARM_LEVEL string,CALL_TYPE string,JURISDICTION string,STATION string,RECEIVED_DATE string,RECEIVED_TIME string,DISPATCH_1ST_TIME string,ONSCENE_1ST_TIME string,FIRE_CONTROL_TIME string,CLOSE_TIME string,SECONDSONCALL INT)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;
LOAD DATA INPATH "fire_january_clean.csv" INTO TABLE firecallsorig;

-- TODO: Change the Cleanse program to output the 1
drop table policecalls;
CREATE TABLE policecalls
       (PAYTYPE int, PRIORITY string,CALL_TYPE string,JURISDICTION string,HOME_DAREA string,RECEIVED_DATE string,RECEIVED_TIME string,DISPATCH_TIME string,ONSCENE_TIME string,CLEAR_TIME string,DISPOSITION string,SECONDSONCALL INT)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;

INSERT OVERWRITE TABLE policecalls
SELECT *
FROM (
  select 1 as paytype, * from policecallsorig
) totalpays;

drop table firecalls;
CREATE TABLE firecalls
       (PAYTYPE int, PRIORITY string,CALL_TYPE string,JURISDICTION string,HOME_DAREA string,RECEIVED_DATE string,RECEIVED_TIME string,DISPATCH_TIME string,ONSCENE_TIME string,CLEAR_TIME string,DISPOSITION string,SECONDSONCALL INT)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;

INSERT OVERWRITE TABLE firecalls
SELECT *
FROM (
  select 1 as paytype, * from firecallsorig
) totalpays;
