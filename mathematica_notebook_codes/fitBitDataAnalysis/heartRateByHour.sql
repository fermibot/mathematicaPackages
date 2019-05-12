SELECT strftime('%Y-%m-%d %H', dateTimeID) || ':00:00' AS Hour,
       avg(bpm),
       avg(bpm) + avg(confidence),
       avg(bpm) - avg(confidence)

FROM heartRate
GROUP BY Hour