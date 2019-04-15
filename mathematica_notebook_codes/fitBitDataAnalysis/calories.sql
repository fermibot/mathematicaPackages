SELECT
	substr(datetimeID, 0, 9) || ' 00:00:00',
	avg(calories)
FROM calories
GROUP BY substr(datetimeID, 0, 9)
