SELECT strftime('%Y-%m-%d', datetimeID), sum(calories)
FROM calories
GROUP BY strftime('%Y-%m-%d', datetimeID)