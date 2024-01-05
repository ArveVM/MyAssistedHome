SELECT
  statistics_meta.statistic_id AS entity,
  ROUND(mean,2) AS mean,
  statistics.min,
  statistics.max,
  strftime( '%Y-%m-%d', datetime(statistics.start_ts, 'unixepoch')) as date1,
  strftime( '%Y-%m-%d', datetime(statistics.start_ts, 'unixepoch')) as date1,
  strftime( '%H:%M', datetime(statistics.start_ts, 'unixepoch')) as time1

FROM statistics JOIN statistics_meta
  ON statistics.metadata_id = statistics_meta.id
WHERE statistics.start_ts >= strftime( '%s', '2023-12-11' )
  AND entity = 'sensor.evahan_temperature'
--GROUP BY
--  date1