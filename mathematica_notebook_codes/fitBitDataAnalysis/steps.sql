SELECT substr(datetimeID, 0, 11) || ' 00:00:00',
       sum(steps)
FROM steps
GROUP BY substr(datetimeID, 0, 11)