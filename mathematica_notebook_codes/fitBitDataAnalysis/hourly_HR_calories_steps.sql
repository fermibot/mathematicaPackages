WITH HeartRateByHour AS (SELECT strftime('%Y-%m-%d %H:00:00',
                                         dateTimeID) AS Hour,
                                avg(bpm)                AvgHeartRate
                         FROM heartRate
                         GROUP BY Hour),

     CaloriesByHour AS (SELECT strftime('%Y-%m-%d %H:00:00',
                                        dateTimeID) AS Hour,
                               sum(calories)           TotalCalories
                        FROM calories
                        GROUP BY Hour),

     StepsByHour AS (SELECT strftime('%Y-%m-%d %H:00:00', dateTimeID)
                                       AS Hour,
                            sum(steps) AS TotalSteps
                     FROM steps
                     GROUP BY hour)
SELECT AvgHeartRate
     , TotalCalories
     , TotalSteps
FROM HeartRateByHour
       LEFT OUTER JOIN CaloriesByHour ON CaloriesByHour.Hour = HeartRateByHour.Hour
       LEFT OUTER JOIN StepsByHour ON StepsByHour.hour = HeartRateByHour.Hour
WHERE TotalCalories IS NOT NULL
ORDER BY StepsByHour.Hour DESC