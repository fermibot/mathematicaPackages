SELECT strftime('%Y-%W', dateTimeID) AS [WeekYear]
     , dateTimeID
FROM steps
GROUP BY strftime('%Y-%W', dateTimeID)
ORDER BY WeekYear
