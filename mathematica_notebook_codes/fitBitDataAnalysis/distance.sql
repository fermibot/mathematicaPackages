WITH DistancePerDay AS (SELECT strftime('%Y-%m-%d', dateTimeID) || ' 00:00:00' AS Day,
                               SUM(distance)                                      TotalDistance
                        FROM distance
                        GROUP BY Day)

SELECT Day, TotalDistance
FROM DistancePerDay