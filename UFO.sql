#Data Cleaning: 
#For ease of query later on I will change the column names 
ALTER TABLE UFO.scrubbed 
RENAME COLUMN `duration (seconds)` TO seconds;


ALTER TABLE UFO.scrubbed 
RENAME COLUMN `duration (hours/min)` TO hours_mins;


ALTER TABLE UFO.scrubbed 
RENAME COLUMN `date posted` TO post_date;

#The comments column is highly varied and for my analysis it is not necessary.
ALTER TABLE UFO.scrubbed
DROP COLUMN comments;

#Checking the datatypes of the columns: 
DESCRIBE UFO.scrubbed;

#Need to split datetime into a year column. 
ALTER TABLE UFO.scrubbed add column year int;


SELECT	SUBSTRING(datetime, 7,4)
FROM UFO.scrubbed 
