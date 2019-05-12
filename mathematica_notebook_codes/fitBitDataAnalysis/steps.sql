WITH CaloriesByDay AS (SELECT
												 strftime('%Y-%m-%d', dateTimeID) || ' 00:00:00' AS Day,
												 SUM(steps)                                         TotalSteps
											 FROM steps
											 GROUP BY Day)

SELECT
	Day,
	TotalSteps
FROM CaloriesByDay