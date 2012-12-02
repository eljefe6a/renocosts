-- Create merged table with costs per call for fire, firemen, and Reno
drop table firecallscost;
CREATE TABLE firecallscost
       (PAYTYPE int, PRIORITY string,CALL_TYPE string,JURISDICTION string,HOME_DAREA string,RECEIVED_DATE string,RECEIVED_TIME string,DISPATCH_TIME string,ONSCENE_TIME string,CLEAR_TIME string,DISPOSITION string,SECONDSONCALL INT,paydesc String,totalCost float)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;

INSERT OVERWRITE TABLE firecallscost
SELECT PAYTYPE, PRIORITY,CALL_TYPE,JURISDICTION,HOME_DAREA,RECEIVED_DATE,RECEIVED_TIME,DISPATCH_TIME,ONSCENE_TIME,CLEAR_TIME,DISPOSITION,SECONDSONCALL,paydesc,totalCost
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
