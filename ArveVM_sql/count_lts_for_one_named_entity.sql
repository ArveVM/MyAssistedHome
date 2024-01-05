SELECT
  statistics_meta.statistic_id AS entity,
  strftime( '%Y-%m-%d', datetime(statistics.start_ts, 'unixepoch')) as date1,
--  strftime( '%H:%M', datetime(states.last_changed_ts, 'unixepoch')) as time1
  count(*) as cnt
FROM statistics JOIN statistics_meta
  ON statistics.metadata_id = statistics_meta.id
WHERE statistics.start_ts >= strftime( '%s', '2023-11-20' )
  AND entity = 'sensor.evahan_temperature'
GROUP BY
  date1