-- Average fire pay
select avg(TOTALSALARYBENEFITS) from firepay;

-- Average fireman pay
select avg(TOTALSALARYBENEFITS) from firepay where positioncode between 7300 and 7399;

-- Average police pay
select avg(TOTALSALARYBENEFITS) from policepay;

-- Average policeman pay
select avg(TOTALSALARYBENEFITS) from policepay where positioncode between 7500 and 7599;

-- Cost per second for fire
select * from totalFirePays;

-- Cost per second for police
select * from totalPolicePays;

-- Average time for fire calls
select avg(secondsoncall) from firecallscost;

-- Average time for police calls
select avg(secondsoncall) from policecallscost;

-- Average cost for Fire calls
select avg(totalCost) from firecallscost where paydesc = 'TotalFirePay';

-- Average cost for Firemen calls
select avg(totalCost) from firecallscost where paydesc = 'TotalFiremanPay';

-- Average cost for Reno Governemnt for fire calls
select avg(totalCost) from firecallscost where paydesc = 'TotalRenoPay';

-- Average cost for Police calls
select avg(totalCost) from policecallscost where paydesc = 'TotalPolicePay';

-- Average cost for Policeman calls
select avg(totalCost) from policecallscost where paydesc = 'TotalPolicemanPay';

-- Average cost for Reno Governemnt for police calls
select avg(totalCost) from policecallscost where paydesc = 'TotalRenoPay';

-- Average costs for fire calls broken down by station
select HOME_DAREA, avg(totalCost) from firecallscost where paydesc = 'TotalFirePay' group by HOME_DAREA;

-- Costliest fire call
select * from firecallscost order by totalCost DESC limit 1;

-- Costliest police call
select * from policecallscost order by totalCost DESC limit 1;

