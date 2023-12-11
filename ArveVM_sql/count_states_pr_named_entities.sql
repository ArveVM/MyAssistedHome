-- ArveVM; Show all entities sorted by count of states for a named entity (content whtihn the '%  %' statement)
-- thanks to KennethM for original idea and ThomasH for the first select/group/sort-statement, the name-filter I actually managed myself!  


SELECT
  states_meta.entity_id,
  count(*) as cnt
FROM states JOIN states_meta
  ON states.metadata_id = states_meta.metadata_id
  WHERE states_meta.entity_id LIKE '%evaplug%'
GROUP BY
  states_meta.entity_id
ORDER by
  count(*) DESC;