#checking null values (q1)
select * from test.`corona virus dataset` where province is null or country is null
 or latitude is null
or longitude is null or temp_date is null 
or deaths is null or confirmed is null 
or recovered is null;
#q2 there's no null values

#checking number of rows (q3)
select count(*) from test.`corona virus dataset`;

#start date and end date(q4)
select 
temp_date from test.`corona virus dataset`
order by
 temp_date desc limit 1;
 select 
temp_date from test.`corona virus dataset`
order by
temp_date limit 1;

# check number of months (q5)
select extract(month from temp_date) as numberofmonth
from test.`corona virus dataset`
group by extract(month from temp_date)
order by numberofmonth;

# check monthly average of confirmed,recovered and deaths(q6)
select extract(month from temp_date) as numberofmonth, 
avg(Confirmed) as avg_confirmed,
avg(deaths) as avg_deaths,
avg(recovered) as avg_recovered
from test.`corona virus dataset`
group by extract(month from temp_date)
order by numberofmonth;

# check most frequent value of confirmed,recovered and deaths each month(q7)
select extract(month from temp_date) as numberofmonth, 
max(Confirmed) as max_confirmed,
max(deaths) as max_deaths,
max(recovered) as max_recovered
from test.`corona virus dataset`
group by extract(month from temp_date)
order by numberofmonth;

# check minimum value of confirmed,recovered and deaths per year(q8)
select extract(year from temp_date) as year, 
min(Confirmed) as max_confirmed,
min(deaths) as max_deaths,
min(recovered) as max_recovered
from test.`corona virus dataset`
group by extract(year from temp_date)
order by year;

# check maximum value of confirmed,recovered and deaths per year(q9)
select extract(year from temp_date) as year, 
max(Confirmed) as max_confirmed,
max(deaths) as max_deaths,
max(recovered) as max_recovered
from test.`corona virus dataset`
group by extract(year from temp_date)
order by year;


# check most frequent value of confirmed,recovered and deaths each month(q10)
select extract(month from temp_date) as numberofmonth, 
count(Confirmed) as max_confirmed,
count(deaths) as max_deaths,
count(recovered) as max_recovered
from test.`corona virus dataset`
group by extract(month from temp_date)
order by numberofmonth;

#checking how corona virus spread with respect to confirmed cases(q11)
select 
count(confirmed) as totalcon,
avg(confirmed) as l,
 variance(confirmed) as varcon,
stddev(confirmed) as stcon,
 Confirmed
from 
test.`corona virus dataset`
GROUP by 
 confirmed;

#checking how corona virus spread with respect to deaths cases per month(q12)
select extract(month from temp_date) as numberofmonth,
count(deaths) as totalcon,
avg(deaths) as l,
variance(Deaths) as varcon, 
stddev(deaths) as stcon
from 
test.`corona virus dataset`
GROUP by extract(month from temp_date)
order by numberofmonth;

 #checking how corona virus spread with respect to recovered cases(q13)
 select count(confirmed) as totalcon,
 avg(confirmed) AS avgcon, 
 variance(confirmed) as varcon,
 stddev(confirmed) as stcon,
 recovered 
from 
test.`corona virus dataset`
GROUP by 
 recovered;
#checking COUNTRY having highest number of confirmed cases (q14)
SELECT Country FROM test.`corona virus dataset`
where confirmed = (select max(confirmed)
from test.`corona virus dataset`);
#checking COUNTRY having lowest number of deaths cases (q15)
SELECT distinct Country FROM test.`corona virus dataset`
where deaths = (select min(deaths)
from test.`corona virus dataset`);
#checking top 5 COUNTRIES having highest recovered cases (q16)
select country,
MAX(recovered) as l from test.`corona virus dataset`
group by country
order by l desc limit 5;

 
