.mode csv
-- tables to be used for reference

/*Select julianday('now’);*/

DROP TABLE IF EXISTS data_downstream_reduced;
CREATE TABLE data_downstream_reduced AS
WITH RECURSIVE data_down(x,y) AS
(SELECT child_data_id, parent_data_id
FROM level20 WHERE parent_data_id = 1
UNION ALL
SELECT child_data_id, data_down.y
FROM data_down, level20
ON data_down.x = parent_data_id
WHERE data_down.x != data_down.y)
SELECT x AS descendent_data_id, y AS ancestor_data_id FROM data_down;

/*Select julianday('now');

DROP TABLE IF EXISTS data_downstream;
CREATE TABLE data_downstream AS
WITH RECURSIVE data_down(x,y) AS
(SELECT child_data_id, parent_data_id
FROM level20
UNION ALL
SELECT child_data_id, data_down.y
FROM data_down, level20
ON data_down.x = parent_data_id
WHERE data_down.x != data_down.y)
SELECT x AS descendent_data_id, y AS ancestor_data_id FROM data_down;

Select julianday('now');
*/