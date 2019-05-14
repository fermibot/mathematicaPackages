SELECT strftime('%Y-%m-%d %H', dateTimeID) || ':00:00' AS Hour,
       avg(bpm)

FROM heartRate
GROUP BY Hour