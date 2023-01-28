/*
Question 3. Count records

How many taxi trips were totally made on January 15?

Tip: started and finished on 2019-01-15.

Remember that lpep_pickup_datetime and lpep_dropoff_datetime columns are in the format timestamp (date and hour+min+sec) and not in date.
*/

SELECT COUNT(1)
FROM green_taxi_trips
WHERE lpep_pickup_datetime::date = '2019-01-15'
AND lpep_dropoff_datetime::date = '2019-01-15';

/*
Question 4. Largest trip for each day

Which was the day with the largest trip distance Use the pick up time for your calculations.
*/

SELECT lpep_pickup_datetime::date,
		MAX(trip_distance)
FROM green_taxi_trips
GROUP BY 1
ORDER BY 2 DESC;

/*
Question 5. The number of passengers

In 2019-01-01 how many trips had 2 and 3 passengers?
*/

SELECT passenger_count,
		COUNT(passenger_count)
FROM green_taxi_trips
WHERE lpep_pickup_datetime::date = '2019-01-01'
GROUP BY 1;

/*
Question 6. Largest tip

For the passengers picked up in the Astoria Zone which was the drop off zone that had the largest tip? We want the name of the zone, not the id.

Note: it's not a typo, it's tip , not trip
*/

SELECT t."DOLocationID",
		zdo."Zone",
		MAX(t.tip_amount)
FROM green_taxi_trips t
LEFT JOIN zones zpu ON t."PULocationID" = zpu."LocationID"
LEFT JOIN zones zdo ON t."DOLocationID" = zdo."LocationID"
WHERE zpu."Zone" = 'Astoria'
GROUP BY 1,2
ORDER BY 3 DESC;