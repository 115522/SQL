WITH subquery AS (
SELECT DriverId, SPEED,driverbehavior.time,
LAG (SPEED,1) OVER (ORDER BY time ) AS prev_speed,
FROM driverbehavior
ORDER BY time ASC
  )
SELECT DriverId, SUM(if(SPEED - prev_speed > 9.87926, 1, 0)) AS harsh_acc,
FROM subquery
GROUP BY DriverId
