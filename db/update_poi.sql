--
-- Post data update request : update POI table
--

-- Read opening state according to tags
CREATE OR REPLACE FUNCTION get_state(tags HSTORE) RETURNS VARCHAR AS $$
BEGIN
	IF tags->'wheelchair' IN ('yes', 'no', 'limited') THEN
		RETURN tags->'wheelchair';
	ELSIF
		tags->'obstacle:wheelchair' = 'yes'
		OR tags->'smoothness' IN ('bad', 'very_bad', 'horrible', 'very_horrible', 'impassable')
		OR tags->'kerb' = 'raised'
	THEN
		RETURN 'no';
	ELSE
		RETURN 'unknown';
	END IF;
END;
$$ LANGUAGE plpgsql;

-- Is a POI having any contact information
CREATE OR REPLACE FUNCTION has_contact_tag(tags HSTORE) RETURNS BOOLEAN AS $$
BEGIN
	RETURN tags ?| ARRAY[
		'phone', 'contact:phone', 'email', 'contact:email',
		'facebook', 'contact:facebook', 'website', 'contact:website', 'brand:website',
		'mobile', 'contact:mobile',
		'fax', 'contact:fax'
	];
END;
$$ LANGUAGE plpgsql;

-- Clean-up sub_country values
CREATE OR REPLACE FUNCTION clean_sub_country(val VARCHAR) RETURNS VARCHAR AS $$
BEGIN
	RETURN NULLIF(val, '<nil>');
END;
$$ LANGUAGE plpgsql;

-- Merge localized names
CREATE OR REPLACE FUNCTION merge_names(VARIADIC names VARCHAR[]) RETURNS VARCHAR AS $$
BEGIN
	RETURN array_to_string(array_remove(names, NULL), ' - ');
END;
$$ LANGUAGE plpgsql;

-- Append custom tags
CREATE OR REPLACE FUNCTION complete_tags(tags JSONB) RETURNS JSONB AS $$
DECLARE
	new_tags JSONB;
BEGIN
	new_tags := tags;

	IF tags->>'barrier' = 'kerb' AND tags->>'kerb' = 'raised' THEN
		new_tags = jsonb_set(new_tags, '{obstacle}', '"kerb"');
	ELSIF tags->>'obstacle:wheelchair' = 'yes' AND tags->>'amenity' = 'parking' AND tags->>'informal' = 'yes' THEN
		new_tags = jsonb_set(new_tags, '{obstacle}', '"informal_parking"');
	ELSIF tags->>'obstacle:wheelchair' = 'yes' AND tags->>'construction' = 'yes' THEN
		new_tags = jsonb_set(new_tags, '{obstacle}', '"roadworks"');
	ELSIF
		tags->>'obstacle:wheelchair' = 'yes' AND (
			tags->>'power' = 'pole'
			OR tags->>'highway' IN ('street_lamp', 'traffic_signals')
			OR tags->>'barrier' IN ('cycle_barrier', 'bollard')
			OR tags->>'traffic_sign' IS NOT NULL
			OR tags->>'tourism' = 'information'
		)
	THEN
		new_tags = jsonb_set(new_tags, '{obstacle}', '"pole"');
	ELSIF tags->>'obstacle:wheelchair' = 'yes' AND tags->>'natural' = 'tree' THEN
		new_tags = jsonb_set(new_tags, '{obstacle}', '"tree"');
	ELSIF tags->>'obstacle:wheelchair' = 'yes' AND tags->>'barrier' = 'block' THEN
		new_tags = jsonb_set(new_tags, '{obstacle}', '"block"');
	ELSIF tags->>'highway' IS NOT NULL AND (
		tags->>'smoothness' IN ('bad', 'very_bad', 'horrible', 'very_horrible', 'impassable')
		OR tags->>'surface' IN ('metal', 'wood', 'compacted', 'fine_gravel', 'unhewn_cobblestone', 'sand', 'ground')
	) THEN
		new_tags = jsonb_set(new_tags, '{obstacle}', '"surface"');
	END IF;

	RETURN new_tags;
END;
$$ LANGUAGE plpgsql;

-- Deprecated function to get normalized category label
DROP INDEX IF EXISTS idx_imposm_osm_point_search;
DROP INDEX IF EXISTS idx_imposm_osm_polygon_search;
DROP FUNCTION IF EXISTS normcat(amenity VARCHAR, shop VARCHAR, craft VARCHAR, office VARCHAR, tobacco VARCHAR);
DROP INDEX IF EXISTS idx_imposm_osm_point_search_v2;
DROP INDEX IF EXISTS idx_imposm_osm_polygon_search_v2;


-- Next poi_osm table
CREATE TABLE IF NOT EXISTS poi_osm_next(
	fid VARCHAR PRIMARY KEY,
	geom GEOMETRY(Point, 3857),
	name VARCHAR,
	cat1 VARCHAR DEFAULT 'other',
	cat2 VARCHAR,
	cat3 VARCHAR,
	brand VARCHAR,
	brand_wikidata VARCHAR,
	brand_hours VARCHAR,
	brand_infos VARCHAR,
	status VARCHAR DEFAULT 'unknown',
	status_order INTEGER,
	source_status VARCHAR DEFAULT 'osm',
	status_service VARCHAR,
	delivery VARCHAR,
	takeaway VARCHAR,
	drive_through VARCHAR,
	tags JSONB
);

TRUNCATE TABLE poi_osm_next;


-- Only add POI with appropriate tagging
WITH
selection
AS
(SELECT
	concat('n', osm_id),
	way,
	merge_names(COALESCE(tags->'name:fr', name), tags->'name:ty'),
	get_category1(tags) AS cat1,
	get_category2(tags) AS cat2,
	get_category3(tags) AS cat3,
	COALESCE(tags->'brand', tags->'operator'),
	COALESCE(tags->'brand:wikidata', tags->'operator:wikidata', tags->'wikidata'),
	COALESCE(tags->'description:covid19', tags->'note:covid19'),
	get_state(tags),
	status_order_value(get_state(tags)),
	COALESCE(tags->'service:wheelchair', 'unknown'),
	tags->'delivery',
	tags->'takeaway',
	tags->'drive_through',
	hstore_to_jsonb(tags) AS tags
FROM osm_imposm_osm_point
WHERE
	-- The line below is automatically edited using categories.json
	-- Do not edit directly, run "yarn run categories" instead
	("amenity" IN ('atm', 'bank', 'bar', 'bench', 'bus_station', 'cafe', 'car_rental', 'childcare', 'cinema', 'clinic', 'college', 'doctors', 'drinking_water', 'fast_food', 'ferry_terminal', 'fuel', 'hospital', 'ice_cream', 'kindergarten', 'letter_box', 'library', 'marketplace', 'nightclub', 'parking', 'parking_space', 'pharmacy', 'police', 'post_box', 'post_office', 'pub', 'restaurant', 'school', 'shower', 'swimming_pool', 'taxi', 'theatre', 'toilets', 'townhall', 'university', 'vending_machine') OR "office" IN ('association', 'company', 'employment_agency', 'government', 'insurance') OR "shop" IN ('alcohol', 'appliance', 'art', 'bag', 'bakery', 'bathroom_furnishing', 'beauty', 'bed', 'beverages', 'books', 'boutique', 'butcher', 'camera', 'cannery', 'carpet', 'charity', 'cheese', 'chemist', 'chocolate', 'clothes', 'coffee', 'computer', 'confectionery', 'convenience', 'cosmetics', 'craft', 'curtain', 'dairy', 'deli', 'department_store', 'doityourself', 'electrical', 'electronics', 'fabric', 'farm', 'fashion', 'fireplace', 'fishing', 'frozen_food', 'furniture', 'gas', 'general', 'glaziery', 'greengrocer', 'haberdashery', 'hairdresser', 'hardware', 'health_food', 'hearing_aids', 'hifi', 'honey', 'houseware', 'hunting', 'insurance', 'interior_decoration', 'jewelry', 'kiosk', 'kitchen', 'lighting', 'massage', 'medical_supply', 'music', 'musical_instrument', 'newsagent', 'obile_phone', 'optician', 'outdoor', 'paint', 'pasta', 'pastry', 'perfumery', 'photo', 'pottery', 'printer_ink', 'seafood', 'second_hand', 'sewing', 'shoes', 'spices', 'sports', 'stationery', 'supermarket', 'tailor', 'tattoo', 'tea', 'tiles', 'variety_store', 'video', 'video_games', 'watches', 'wholesale', 'wine', 'winery', 'wool') OR "tourism" IN ('artwork', 'camp_site', 'guest_house', 'hostel', 'hotel', 'information', 'museum', 'theme_park', 'viewpoint') OR "club" != '' OR "leisure" IN ('beach_resort', 'park', 'sports_centre', 'swimming_pool') OR "name" IN ('EDT', 'Electricité de Tahiti', 'Électricité de Tahiti') OR "craft" != '' OR "school:FR" IN ('collège', 'lycée', 'maternelle', 'primaire', 'élémentaire') OR "healthcare" IN ('audiologist', 'centre', 'clinic', 'dentist', 'doctor', 'hospital', 'midwife', 'nurse', 'occupational_therapist', 'physiotherapist', 'podiatrist', 'psychotherapist', 'rehabilitation', 'speech_therapist') OR "wheelchair" IN ('designated', 'yes') OR "highway" != '' OR "public_transport" IN ('platform', 'stop_position') OR "natural" IN ('beach', 'tree') OR "aeroway" IN ('aerodrome') OR "waterway" IN ('waterfall') OR "historic" != '') --CATEGORIES
UNION ALL
SELECT
	CASE WHEN osm_id < 0 THEN concat('r', -osm_id) ELSE concat('w', osm_id) END,
	ST_Centroid(way),
	merge_names(COALESCE(tags->'name:fr', name), tags->'name:ty'),
	get_category1(tags) AS cat1,
	get_category2(tags) AS cat2,
	get_category3(tags) AS cat3,
	COALESCE(tags->'brand', tags->'operator'),
	COALESCE(tags->'brand:wikidata', tags->'operator:wikidata', tags->'wikidata'),
	COALESCE(tags->'description:covid19', tags->'note:covid19'),
	get_state(tags),
	status_order_value(get_state(tags)),
	COALESCE(tags->'service:wheelchair', 'unknown'),
	tags->'delivery',
	tags->'takeaway',
	tags->'drive_through',
	hstore_to_jsonb(tags)
FROM osm_imposm_osm_polygon
WHERE
	-- The line below is automatically edited using categories.json
	-- Do not edit directly, run "yarn run categories" instead
	("amenity" IN ('atm', 'bank', 'bar', 'bench', 'bus_station', 'cafe', 'car_rental', 'childcare', 'cinema', 'clinic', 'college', 'doctors', 'drinking_water', 'fast_food', 'ferry_terminal', 'fuel', 'hospital', 'ice_cream', 'kindergarten', 'letter_box', 'library', 'marketplace', 'nightclub', 'parking', 'parking_space', 'pharmacy', 'police', 'post_box', 'post_office', 'pub', 'restaurant', 'school', 'shower', 'swimming_pool', 'taxi', 'theatre', 'toilets', 'townhall', 'university', 'vending_machine') OR "office" IN ('association', 'company', 'employment_agency', 'government', 'insurance') OR "shop" IN ('alcohol', 'appliance', 'art', 'bag', 'bakery', 'bathroom_furnishing', 'beauty', 'bed', 'beverages', 'books', 'boutique', 'butcher', 'camera', 'cannery', 'carpet', 'charity', 'cheese', 'chemist', 'chocolate', 'clothes', 'coffee', 'computer', 'confectionery', 'convenience', 'cosmetics', 'craft', 'curtain', 'dairy', 'deli', 'department_store', 'doityourself', 'electrical', 'electronics', 'fabric', 'farm', 'fashion', 'fireplace', 'fishing', 'frozen_food', 'furniture', 'gas', 'general', 'glaziery', 'greengrocer', 'haberdashery', 'hairdresser', 'hardware', 'health_food', 'hearing_aids', 'hifi', 'honey', 'houseware', 'hunting', 'insurance', 'interior_decoration', 'jewelry', 'kiosk', 'kitchen', 'lighting', 'massage', 'medical_supply', 'music', 'musical_instrument', 'newsagent', 'obile_phone', 'optician', 'outdoor', 'paint', 'pasta', 'pastry', 'perfumery', 'photo', 'pottery', 'printer_ink', 'seafood', 'second_hand', 'sewing', 'shoes', 'spices', 'sports', 'stationery', 'supermarket', 'tailor', 'tattoo', 'tea', 'tiles', 'variety_store', 'video', 'video_games', 'watches', 'wholesale', 'wine', 'winery', 'wool') OR "tourism" IN ('artwork', 'camp_site', 'guest_house', 'hostel', 'hotel', 'information', 'museum', 'theme_park', 'viewpoint') OR "club" != '' OR "leisure" IN ('beach_resort', 'park', 'sports_centre', 'swimming_pool') OR "name" IN ('EDT', 'Electricité de Tahiti', 'Électricité de Tahiti') OR "craft" != '' OR "school:FR" IN ('collège', 'lycée', 'maternelle', 'primaire', 'élémentaire') OR "healthcare" IN ('audiologist', 'centre', 'clinic', 'dentist', 'doctor', 'hospital', 'midwife', 'nurse', 'occupational_therapist', 'physiotherapist', 'podiatrist', 'psychotherapist', 'rehabilitation', 'speech_therapist') OR "wheelchair" IN ('designated', 'yes') OR "highway" != '' OR "public_transport" IN ('platform', 'stop_position') OR "natural" IN ('beach', 'tree') OR "aeroway" IN ('aerodrome') OR "waterway" IN ('waterfall') OR "historic" != '') --CATEGORIES
)
INSERT INTO poi_osm_next(fid, geom, name, cat1, cat2, cat3, brand, brand_wikidata, brand_infos, status, status_order, status_service, delivery, takeaway, drive_through, tags)
SELECT *
FROM selection
-- Remove edge cases needing advanced filtering like vending machines
WHERE cat1 IS NOT NULL AND NOT (tags ? 'access' AND tags->>'access' NOT IN ('yes', 'public', 'permissive'));


-- Join custom tags from poi_cro
UPDATE poi_osm_next
SET
	tags = poi_osm_next.tags || c.tags || CONCAT('{ "cro:date": "',EXTRACT(EPOCH FROM c.lastupdate)::int,'" }')::jsonb
-- 	hydroalcoholic_gel = c.tags->>'vending:hydroalcoholic_gel',
-- 	mask = c.tags->>'vending:mask'
FROM poi_cro c
WHERE poi_osm_next.fid = c.osmid;


-- Join custom POIs from poi_custom
UPDATE poi_osm_next
SET
	name = COALESCE(pc.name, poi_osm_next.name),
	cat1 = pc.category,
	cat2 = pc.subcategory,
	tags = CASE WHEN pc.tags IS NOT NULL THEN poi_osm_next.tags || pc.tags ELSE poi_osm_next.tags END
FROM poi_custom pc
WHERE
	pc.osm_id IS NOT NULL
	AND pc.osm_id = poi_osm_next.fid;

INSERT INTO poi_osm_next(fid, geom, name, cat1, cat2, status, status_order, source_status, tags)
WITH pc AS (
	SELECT *, ST_Transform(ST_SetSRID(ST_Point(lng, lat), 4326), 3857) AS geom
	FROM poi_custom
	WHERE osm_id IS NULL
)
SELECT
	pc.cro_id,
	pc.geom,
	pc.name,
	pc.category,
	pc.subcategory,
	'yes',
	status_order_value('yes'),
	'cro',
	tags
FROM pc
WHERE pc.osm_id IS NULL;

-- Update with custom tags
UPDATE poi_osm_next SET tags = complete_tags(tags);


-- Index creation and table switch
REINDEX TABLE poi_osm_next;
CREATE INDEX poi_osm_next_geom_idx ON poi_osm_next USING GIST(geom);
CREATE INDEX poi_osm_next_status_idx ON poi_osm_next(status);
CREATE INDEX poi_osm_next_status_service_idx ON poi_osm_next(status_service);
CREATE INDEX poi_osm_next_cat1_idx ON poi_osm_next(cat1);
CREATE INDEX poi_osm_next_cat2_idx ON poi_osm_next(cat2);
CREATE INDEX poi_osm_next_cat3_idx ON poi_osm_next(cat3);

CREATE SCHEMA IF NOT EXISTS previous;
DROP TABLE IF EXISTS previous.poi_osm CASCADE;
ALTER TABLE poi_osm SET SCHEMA previous;

--DROP TABLE IF EXISTS poi_osm CASCADE;
ALTER TABLE poi_osm_next RENAME TO poi_osm;
ALTER INDEX poi_osm_next_pkey RENAME TO poi_osm_pkey;
ALTER INDEX poi_osm_next_geom_idx RENAME TO poi_osm_geom_idx;
ALTER INDEX poi_osm_next_status_idx RENAME TO poi_osm_status_idx;
ALTER INDEX poi_osm_next_status_service_idx RENAME TO poi_osm_status_service_idx;
ALTER INDEX poi_osm_next_cat1_idx RENAME TO poi_osm_cat1_idx;
ALTER INDEX poi_osm_next_cat2_idx RENAME TO poi_osm_cat2_idx;
ALTER INDEX poi_osm_next_cat3_idx RENAME TO poi_osm_cat3_idx;

CREATE OR REPLACE VIEW poi_osm_light AS
SELECT fid, fid AS id, geom, name, cat1, cat2, cat3, status, status_service, takeaway, delivery, drive_through
FROM poi_osm;

CREATE OR REPLACE FUNCTION json_to_hstore(json)
	RETURNS hstore
	IMMUTABLE
	STRICT
	LANGUAGE sql
AS $func$
	SELECT hstore(array_agg(key), array_agg(value))
	FROM json_each_text($1)
$func$;

CREATE OR REPLACE VIEW poi_recent_notes AS
SELECT
	id AS fid,
	geom,
	tags->'name' AS name,
	CASE
		WHEN get_category1(tags) != '' THEN get_category1(tags)
		WHEN tags->'obstacle' IS NOT NULL THEN 'barrier'
		WHEN tags->'note' IS NOT NULL THEN 'note'
	END AS cat1,
	get_category2(tags) AS cat2,
	get_category3(tags) AS cat3,
	tags->'brand' AS brand,
	tags->'brand:wikidata' AS brand_wikidata,
	NULL AS brand_hours,
	NULL AS brand_infos,
	get_state(tags) AS status,
	status_order_value(get_state(tags)) AS status_order,
	'cro' AS source_status,
	COALESCE(tags->'service:wheelchair', 'unknown') AS status_service,
	tags->'delivery' AS delivery,
	tags->'takeaway' AS takeaway,
	tags->'drive_through' AS drive_through,
	tags::json,
	last_update
FROM (
	SELECT
		id,
		ST_Transform(geom, 3857)::Geometry(Point, 3857) AS geom,
		json_to_hstore((COALESCE(tags, '{}'::jsonb) || COALESCE(cro_tags, '{}'::jsonb))::json) AS tags,
		ts AS last_update
	FROM contributions
	WHERE NOT sent_to_osm AND osmid = 'new' AND ts >= (current_timestamp - '01:00:00'::time)
) a;

CREATE OR REPLACE VIEW poi_recent_notes_light AS
SELECT fid, fid AS id, geom, name, cat1, cat2, cat3, status, status_service, takeaway, delivery, drive_through
FROM poi_recent_notes;


-- Analysis requests
-- SELECT country, SUM((status != 'unknown')::int)::float / COUNT(*) * 100 AS pct_info_connue FROM poi_osm GROUP BY country;
-- SELECT country, SUM((status NOT IN ('unknown', 'partial'))::int)::float / COUNT(*) * 100 AS pct_info_connue FROM poi_osm GROUP BY country;

-- SELECT status, COUNT(*) FROM poi_osm GROUP BY status ORDER BY COUNT(*) DESC;
-- SELECT cat1, COUNT(*) FROM poi_osm GROUP BY cat1 ORDER BY COUNT(*) DESC;

-- SELECT country, brand, COUNT(*) FROM poi_osm WHERE status = 'unknown' GROUP BY country, brand HAVING COUNT(*) > 20 ORDER BY COUNT(*) DESC;
-- SELECT country, cat, COUNT(*) FROM poi_osm WHERE status = 'unknown' GROUP BY country, cat HAVING COUNT(*) > 20 ORDER BY COUNT(*) DESC;
