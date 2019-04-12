SELECT substr(datetimeID, 0, 9) || ' 00:00:00'
     , avg(bpm)
     , avg(bpm) + avg(confidence)
     , avg(bpm) - avg(confidence)
FROM heartRate
GROUP BY substr(datetimeID, 0, 9)