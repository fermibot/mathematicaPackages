SELECT strftime('%Y-%W', dateTimeID)                YearWeek,
       sum(steps) AS                                TotalSteps,
       max(date(dateTimeID, 'weekday 0', '-7 day')) WeekStart,
       max(date(dateTimeID, 'weekday 0', '-1 day')) WeekEnd
FROM steps
GROUP BY YearWeek
ORDER BY YearWeek