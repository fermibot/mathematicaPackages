
SELECT strftime('%Y-%W', dateTimeID) YearWeek,
       sum(calories) AS              TotalCalories
FROM calories
GROUP BY YearWeek
ORDER BY YearWeek