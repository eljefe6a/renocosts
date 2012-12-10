Takes open data from Reno's city government and combines the data to form a new dataset with new insights.  The data comes from http://dashboard.reno.gov/.  The project combines Reno's open payroll data with police and fire call data.  It calculates the cost per call based on the city's payroll data. 

This project uses Java for cleansing the data sources and Hive (HQL) to run queries on the resulting data.

Run table_create_1_paytables.hql

Run table_create_2_costpersecond.hql

Run table_create_3_fireandpolicecalls.hql

Run table_create_4_merged_fire_and_police.hql


Run the sample_queries.hql to see some usages of the data
