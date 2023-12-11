-- ArveVM; Show all entities sorted by count of states for each entity_id
-- thanks to KennethM for original idea and ThomasH for the actual select/group/sort-statement 

SELECT
  states_meta.entity_id,
  count(*) as cnt
FROM states JOIN states_meta
  ON states.metadata_id = states_meta.metadata_id
GROUP BY
  states_meta.entity_id
ORDER by
  count(*) DESC;
