/*This is an example sql script*/
/*Create a table of job search activities and dates.
Note that date format must be YYYY-MM-DD before data 
import from the csv file. */
CREATE TABLE jobsearch (
Activity varchar(255),
Activity_date date
);

-- Select all activities from between Jan 1st 2019 and March 31st 2019.
SELECT * FROM jobsearch
WHERE Activity_date Between '2019-01-01' AND '2019-03-31';

-- Select the date column in a different format.
CREATE TABLE dates(
Activity varchar(255),
mod_date date
);

-- Create a copy of the first table of dates into a new table.
INSERT INTO dates(Activity, mod_date)
SELECT Activity, Activity_date FROM jobsearch;

-- Select the day of the week (3 letter day) for each day.
SELECT DATE_FORMAT(mod_date,'%a') FROM dates;
SELECT DATE_FORMAT(mod_date, '%y/%M/%d') FROM dates;

-- Join two tables together
SELECT jobsearch.Activity, dates.mod_date
FROM jobsearch
INNER JOIN dates ON jobsearch.Activity = dates.Activity;

-- Create a column in dates table for random integers
ALTER TABLE dates
ADD COLUMN Random DECIMAL(5,2);

-- Fill the Random column with random decimal from 0 to 6. 
UPDATE dates
SET Random = RAND()*(6-0);


-- Create a column to return the cosine of the random numbers (radians).
ALTER TABLE dates
ADD COLUMN cosine DECIMAL(5,2);

UPDATE dates
SET cosine = COS(Random);



