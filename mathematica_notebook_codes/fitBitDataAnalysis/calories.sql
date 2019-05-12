WITH CaloriesByDay AS (SELECT
												 strftime('%Y-%m-%d', dateTimeID) || ' 00:00:00' AS Day,
												 SUM(calories)                                      TotalCalories
											 FROM calories
											 GROUP BY Day)

SELECT
	Day,
	TotalCalories
FROM CaloriesByDay