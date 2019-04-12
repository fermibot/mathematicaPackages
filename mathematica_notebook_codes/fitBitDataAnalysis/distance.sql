SELECT
	substr(datetimeID, 0, 9) || ' 00:00:00',
	sum(distance)
FROM distance
GROUP BY substr(datetimeID, 0, 9)