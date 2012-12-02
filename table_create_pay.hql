-- Create table with cost per second of Fire, just Firemen, and all Reno government
drop table totalFirePays;
CREATE TABLE totalFirePays
       (paytype INT, paydesc String,totalPay float)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;

INSERT OVERWRITE TABLE totalFirePays
SELECT totalpays.paytype, totalpays.paydesc, totalpays.totalPay
FROM (
  select 1 as paytype, 'TotalFirePay' as paydesc, sum(totalsalarybenefits) / 31536000 as totalPay from firepay
  UNION ALL
  select 1 as paytype, 'TotalFiremanPay' as paydesc, sum(totalsalarybenefits) / 31536000 as totalPay from firepay where positioncode between 7300 and 7399
  UNION ALL
  select 1 as paytype, 'TotalRenoPay' as paydesc, sum(TOTALSALARYBENEFITS) / 31536000 as totalPay from renopay
) totalpays;

-- Create table with cost per second of Police, just Policemen, and all Reno government
drop table totalPolicePays;
CREATE TABLE totalPolicePays
       (paytype INT, paydesc String,totalPay float)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;

INSERT OVERWRITE TABLE totalPolicePays
SELECT totalpays.paytype, totalpays.paydesc, totalpays.totalPay
FROM (
  select 1 as paytype, 'TotalPolicePay' as paydesc, sum(totalsalarybenefits) / 31536000 as totalPay from policepay
  UNION ALL
  select 1 as paytype, 'TotalPolicemanPay' as paydesc, sum(totalsalarybenefits) / 31536000 as totalPay from policepay where positioncode between 7500 and 7599
  UNION ALL
  select 1 as paytype, 'TotalRenoPay' as paydesc, sum(TOTALSALARYBENEFITS) / 31536000 as totalPay from renopay
) totalpays;
