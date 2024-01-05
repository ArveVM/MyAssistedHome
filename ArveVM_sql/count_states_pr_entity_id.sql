-- ArveVM; Show all entities sorted by count of states for each entity_id
-- thanks to KennethM for original idea and ThomasH for the actual select/group/sort-statement 


SELECT
  states_meta.entity_id AS entity,
  strftime( '%Y-%m-%d', datetime(states.last_updated_ts, 'unixepoch')) as date1,
  count(*) as cnt
FROM states JOIN states_meta
  ON states.metadata_id = states_meta.metadata_id
WHERE entity = 'sensor.evahan_voltage_phase_b'
GROUP BY
  states_meta.entity_id, date1
ORDER by
  date1 ASC;
