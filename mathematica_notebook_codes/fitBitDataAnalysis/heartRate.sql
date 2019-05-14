WITH AvgBPM AS (SELECT strftime('%Y-%m-%d', dateTimeID) || ' 00:00:00' AS Day
                     , avg(bpm)                                        AS AvgBPMDaily
                     , avg(bpm) + avg(confidence)                      AS AvgBPMDailyUpperConfidence
                     , avg(bpm) - avg(confidence)                      AS AvgBPMDailyLoweConfidence

                FROM heartRate
                GROUP BY Day)

SELECT Day, AvgBPMDaily, AvgBPMDailyUpperConfidence, AvgBPMDailyLoweConfidence
FROM AvgBPM