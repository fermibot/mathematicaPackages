SELECT *, 'Light' AS [ActivityType]
FROM lightlyActiveMinutes
UNION
SELECT *, 'Moderate'
FROM moderatelyActiveMinutes
UNION
SELECT *, 'Very'
FROM veryActiveMinutes
ORDER BY ActivityType
