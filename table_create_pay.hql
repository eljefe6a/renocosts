drop table totalRenoPays;
CREATE TABLE totalRenoPays
       (paytype String,totalPay float)
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY ','
       STORED AS TEXTFILE;

INSERT OVERWRITE TABLE totalRenoPays
SELECT totalpays.paytype, totalpays.totalPay
FROM (
  select "TotalFirePay" as paytype, sum(totalsalarybenefits) / 31536000 as totalPay from firepay
  UNION ALL
  select "TotalFiremanPay" as paytype, sum(totalsalarybenefits) / 31536000 as totalPay from firepay where positioncode between 7300 and 7399
  UNION ALL
  select "TotalPolicePay" as paytype, sum(totalsalarybenefits) / 31536000 as totalPay from policepay
  UNION ALL
  select "TotalPolicemanPay" as paytype, sum(totalsalarybenefits) / 31536000 as totalPay from policepay where positioncode between 7500 and 7599
) totalpays;
