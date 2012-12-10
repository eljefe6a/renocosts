-- Create merged table with costs per call for fire, firemen, and Reno
drop table firecallscost;
CREATE TABLE firecallscost
       (PAYTYPE int, ALARM_LEVEL string,CALL_TYPE string,JURISDICTION string,STATION string,RECEIVED_DATE string,RECEIVED_TIME string,DISPATCH_1ST_TIME string,ONSCENE_1ST_TIME string,FIRE_CONTROL_TIME string,CLOSE_TIME string,SECONDSONCALL INT,paydesc String,totalCost float)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;

INSERT OVERWRITE TABLE firecallscost
SELECT PAYTYPE, ALARM_LEVEL,CALL_TYPE,JURISDICTION,STATION,RECEIVED_DATE,RECEIVED_TIME,DISPATCH_1ST_TIME,ONSCENE_1ST_TIME,FIRE_CONTROL_TIME,CLOSE_TIME,SECONDSONCALL,paydesc,totalCost
FROM (
  select *, firecalls.SECONDSONCALL * totalFirePays.totalPay as totalCost from firecalls join totalFirePays on firecalls.paytype = totalFirePays.paytype
) allfirecallscost;

-- Create merged table with costs per call for police, policemen, and Reno
drop table policecallscost;
CREATE TABLE policecallscost
       (PAYTYPE int, PRIORITY string,CALL_TYPE string,JURISDICTION string,HOME_DAREA string,RECEIVED_DATE string,RECEIVED_TIME string,DISPATCH_TIME string,ONSCENE_TIME string,CLEAR_TIME string,DISPOSITION string,SECONDSONCALL INT,paydesc String,totalCost float)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;

INSERT OVERWRITE TABLE policecallscost
SELECT PAYTYPE, PRIORITY,CALL_TYPE,JURISDICTION,HOME_DAREA,RECEIVED_DATE,RECEIVED_TIME,DISPATCH_TIME,ONSCENE_TIME,CLEAR_TIME,DISPOSITION,SECONDSONCALL,paydesc,totalCost
FROM (
  select *, policecalls.SECONDSONCALL * totalPolicePays.totalPay as totalCost from policecalls join totalPolicePays on policecalls.paytype = totalPolicePays.paytype
) allpolicecallscost;
