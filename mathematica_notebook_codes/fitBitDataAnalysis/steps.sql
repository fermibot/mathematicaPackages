SELECT
	substr(datetimeID, 0, 9) || ' 00:00:00',
	sum(steps)
FROM steps
GROUP BY substr(datetimeID, 0, 9)