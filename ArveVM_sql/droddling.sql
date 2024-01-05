
--  states.last_changed_ts,

SELECT
  states_meta.entity_id AS entity,
  strftime( '%Y-%m-%d', datetime(states.last_changed_ts, 'unixepoch')) as date1,
--  strftime( '%H:%M', datetime(states.last_changed_ts, 'unixepoch')) as time1,
  count(*) as countStates
FROM states JOIN states_meta
  ON states.metadata_id = states_meta.metadata_id
WHERE states.last_changed_ts >= strftime( '%s', '2023-12-11' )
  AND entity = 'sensor.evahan_last_seen'
GROUP BY
  date1