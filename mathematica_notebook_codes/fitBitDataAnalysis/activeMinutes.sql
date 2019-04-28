SELECT
	CAST(dateTimeID AS VARCHAR) dateTime,
	minutes,
	'Light' AS [ActivityType]
FROM lightlyActiveMinutes
UNION
SELECT
	CAST(dateTimeID AS VARCHAR),
	minutes,
	'Moderate'
FROM moderatelyActiveMinutes
UNION
SELECT
	CAST(dateTimeID AS VARCHAR),
	minutes,
	'Very'
FROM veryActiveMinutes
ORDER BY ActivityType
