SELECT
	substr(datetimeID, 0, 9) || ' 00:00:00',
	sum(calories)
FROM calories
GROUP BY substr(datetimeID, 0, 9)
