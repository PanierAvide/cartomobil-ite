--
-- Post data update request : update POI table
--

-- Read opening state according to tags
CREATE OR REPLACE FUNCTION get_state(tags HSTORE) RETURNS VARCHAR AS $$
BEGIN
	IF tags->'wheelchair' IN ('yes', 'no', 'limited') THEN
		RETURN tags->'wheelchair';
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
	cat VARCHAR,
	normalized_cat VARCHAR DEFAULT 'other',
	brand VARCHAR,
	brand_wikidata VARCHAR,
	brand_hours VARCHAR,
	brand_infos VARCHAR,
	status VARCHAR DEFAULT 'unknown',
	status_order INTEGER,
	source_status VARCHAR DEFAULT 'osm',
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
	name,
	get_subcategory(tags),
	get_category(tags) AS normalized_cat,
	COALESCE(tags->'brand', tags->'operator'),
	COALESCE(tags->'brand:wikidata', tags->'operator:wikidata', tags->'wikidata'),
	COALESCE(tags->'description:covid19', tags->'note:covid19'),
	get_state(tags),
	status_order_value(get_state(tags)),
	tags->'delivery',
	tags->'takeaway',
	tags->'drive_through',
	hstore_to_jsonb(tags) AS tags
FROM osm_imposm_osm_point
WHERE
	-- The line below is automatically edited using categories.json
	-- Do not edit directly, run "yarn run categories" instead
	("amenity" IN ('atm', 'bank', 'bar', 'bus_station', 'cafe', 'car_rental', 'childcare', 'cinema', 'clinic', 'doctors', 'drinking_water', 'fast_food', 'ferry_terminal', 'hospital', 'ice_cream', 'kindergarten', 'library', 'marketplace', 'money_transfer', 'nightclub', 'parking', 'parking_space', 'pharmacy', 'police', 'post_box', 'post_office', 'pub', 'restaurant', 'school', 'swimming_pool', 'taxi', 'theatre', 'toilets', 'townhall', 'vending_machine') OR "office" IN ('association', 'company', 'diplomatic', 'government', 'insurance') OR "shop" IN ('alcohol', 'appliance', 'art', 'bag', 'bakery', 'bathroom_furnishing', 'beauty', 'bed', 'beverages', 'books', 'boutique', 'butcher', 'cannery', 'carpet', 'charity', 'cheese', 'chemist', 'chocolate', 'clothes', 'coffee', 'computer', 'confectionery', 'convenience', 'copyshop', 'cosmetics', 'curtain', 'dairy', 'deli', 'department_store', 'doityourself', 'electrical', 'electronics', 'fabric', 'farm', 'fashion', 'fireplace', 'fishing', 'florist', 'frozen_food', 'furniture', 'garden_centre', 'general', 'glaziery', 'greengrocer', 'haberdashery', 'hairdresser', 'hardware', 'health_food', 'hearing_aids', 'hifi', 'honey', 'houseware', 'hunting', 'insurance', 'interior_decoration', 'jewelry', 'kiosk', 'kitchen', 'lighting', 'massage', 'medical_supply', 'mobile_phone', 'music', 'musical_instrument', 'newsagent', 'optician', 'outdoor', 'paint', 'pasta', 'pastry', 'perfumery', 'pet', 'photo', 'pottery', 'printer_ink', 'seafood', 'second_hand', 'sewing', 'shoes', 'spices', 'sports', 'stationery', 'supermarket', 'tailor', 'tea', 'tiles', 'toys', 'variety_store', 'video', 'video_games', 'watches', 'wholesale', 'wine', 'winery', 'wool') OR "leisure" IN ('beach_resort', 'park', 'sports_centre', 'swimming_pool') OR "tourism" IN ('artwork', 'guest_house', 'hostel', 'hotel', 'museum', 'viewpoint') OR "craft" IN ('electronics_repair', 'optician', 'sewing') OR "name" IN ('EDT', 'Electricité de Tahiti', 'Électricité de Tahiti') OR "school:FR" IN ('collège', 'lycée', 'élémentaire') OR "healthcare" IN ('audiologist', 'centre', 'clinic', 'dentist', 'doctor', 'hospital', 'midwife', 'nurse', 'occupational_therapist', 'physiotherapist', 'podiatrist', 'psychotherapist', 'rehabilitation', 'speech_therapist') OR "highway" IN ('bus_stop') OR "public_transport" IN ('platform', 'stop_position') OR "aeroway" IN ('aerodrome') OR "wheelchair" IN ('designated', 'yes') OR "natural" IN ('beach')) --CATEGORIES
UNION ALL
SELECT
	CASE WHEN osm_id < 0 THEN concat('r', -osm_id) ELSE concat('w', osm_id) END,
	ST_Centroid(way),
	name,
	get_subcategory(tags),
	get_category(tags),
	COALESCE(tags->'brand', tags->'operator'),
	COALESCE(tags->'brand:wikidata', tags->'operator:wikidata', tags->'wikidata'),
	COALESCE(tags->'description:covid19', tags->'note:covid19'),
	get_state(tags),
	status_order_value(get_state(tags)),
	tags->'delivery',
	tags->'takeaway',
	tags->'drive_through',
	hstore_to_jsonb(tags)
FROM osm_imposm_osm_polygon
WHERE
	-- The line below is automatically edited using categories.json
	-- Do not edit directly, run "yarn run categories" instead
	("amenity" IN ('atm', 'bank', 'bar', 'bus_station', 'cafe', 'car_rental', 'childcare', 'cinema', 'clinic', 'doctors', 'drinking_water', 'fast_food', 'ferry_terminal', 'hospital', 'ice_cream', 'kindergarten', 'library', 'marketplace', 'money_transfer', 'nightclub', 'parking', 'parking_space', 'pharmacy', 'police', 'post_box', 'post_office', 'pub', 'restaurant', 'school', 'swimming_pool', 'taxi', 'theatre', 'toilets', 'townhall', 'vending_machine') OR "office" IN ('association', 'company', 'diplomatic', 'government', 'insurance') OR "shop" IN ('alcohol', 'appliance', 'art', 'bag', 'bakery', 'bathroom_furnishing', 'beauty', 'bed', 'beverages', 'books', 'boutique', 'butcher', 'cannery', 'carpet', 'charity', 'cheese', 'chemist', 'chocolate', 'clothes', 'coffee', 'computer', 'confectionery', 'convenience', 'copyshop', 'cosmetics', 'curtain', 'dairy', 'deli', 'department_store', 'doityourself', 'electrical', 'electronics', 'fabric', 'farm', 'fashion', 'fireplace', 'fishing', 'florist', 'frozen_food', 'furniture', 'garden_centre', 'general', 'glaziery', 'greengrocer', 'haberdashery', 'hairdresser', 'hardware', 'health_food', 'hearing_aids', 'hifi', 'honey', 'houseware', 'hunting', 'insurance', 'interior_decoration', 'jewelry', 'kiosk', 'kitchen', 'lighting', 'massage', 'medical_supply', 'mobile_phone', 'music', 'musical_instrument', 'newsagent', 'optician', 'outdoor', 'paint', 'pasta', 'pastry', 'perfumery', 'pet', 'photo', 'pottery', 'printer_ink', 'seafood', 'second_hand', 'sewing', 'shoes', 'spices', 'sports', 'stationery', 'supermarket', 'tailor', 'tea', 'tiles', 'toys', 'variety_store', 'video', 'video_games', 'watches', 'wholesale', 'wine', 'winery', 'wool') OR "leisure" IN ('beach_resort', 'park', 'sports_centre', 'swimming_pool') OR "tourism" IN ('artwork', 'guest_house', 'hostel', 'hotel', 'museum', 'viewpoint') OR "craft" IN ('electronics_repair', 'optician', 'sewing') OR "name" IN ('EDT', 'Electricité de Tahiti', 'Électricité de Tahiti') OR "school:FR" IN ('collège', 'lycée', 'élémentaire') OR "healthcare" IN ('audiologist', 'centre', 'clinic', 'dentist', 'doctor', 'hospital', 'midwife', 'nurse', 'occupational_therapist', 'physiotherapist', 'podiatrist', 'psychotherapist', 'rehabilitation', 'speech_therapist') OR "highway" IN ('bus_stop') OR "public_transport" IN ('platform', 'stop_position') OR "aeroway" IN ('aerodrome') OR "wheelchair" IN ('designated', 'yes') OR "natural" IN ('beach')) --CATEGORIES
)
INSERT INTO poi_osm_next(fid, geom, name, cat, normalized_cat, brand, brand_wikidata, brand_infos, status, status_order, delivery, takeaway, drive_through, tags)
SELECT *
FROM selection
-- Remove edge cases needing advanced filtering like vending machines
WHERE normalized_cat IS NOT NULL AND NOT (tags ? 'access' AND tags->>'access' NOT IN ('yes', 'public', 'permissive'));


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
	normalized_cat = pc.category,
	cat = pc.subcategory,
	tags = CASE WHEN pc.tags IS NOT NULL THEN poi_osm_next.tags || pc.tags ELSE poi_osm_next.tags END
FROM poi_custom pc
WHERE
	pc.osm_id IS NOT NULL
	AND pc.osm_id = poi_osm_next.fid;

INSERT INTO poi_osm_next(fid, geom, name, cat, normalized_cat, status, status_order, source_status, tags)
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


-- Index creation and table switch
REINDEX TABLE poi_osm_next;
CREATE INDEX poi_osm_next_geom_idx ON poi_osm_next USING GIST(geom);
CREATE INDEX poi_osm_next_status_idx ON poi_osm_next(status);

CREATE SCHEMA IF NOT EXISTS previous;
DROP TABLE IF EXISTS previous.poi_osm CASCADE;
ALTER TABLE poi_osm SET SCHEMA previous;

--DROP TABLE IF EXISTS poi_osm CASCADE;
ALTER TABLE poi_osm_next RENAME TO poi_osm;
ALTER INDEX poi_osm_next_pkey RENAME TO poi_osm_pkey;
ALTER INDEX poi_osm_next_geom_idx RENAME TO poi_osm_geom_idx;
ALTER INDEX poi_osm_next_status_idx RENAME TO poi_osm_status_idx;

CREATE OR REPLACE VIEW poi_osm_light AS
SELECT fid, fid AS id, geom, name, cat, normalized_cat, status, takeaway, delivery, drive_through
FROM poi_osm;


-- Analysis requests
-- SELECT country, SUM((status != 'unknown')::int)::float / COUNT(*) * 100 AS pct_info_connue FROM poi_osm GROUP BY country;
-- SELECT country, SUM((status NOT IN ('unknown', 'partial'))::int)::float / COUNT(*) * 100 AS pct_info_connue FROM poi_osm GROUP BY country;

-- SELECT status, COUNT(*) FROM poi_osm GROUP BY status ORDER BY COUNT(*) DESC;
-- SELECT normalized_cat, COUNT(*) FROM poi_osm GROUP BY normalized_cat ORDER BY COUNT(*) DESC;

-- SELECT country, brand, COUNT(*) FROM poi_osm WHERE status = 'unknown' GROUP BY country, brand HAVING COUNT(*) > 20 ORDER BY COUNT(*) DESC;
-- SELECT country, cat, COUNT(*) FROM poi_osm WHERE status = 'unknown' GROUP BY country, cat HAVING COUNT(*) > 20 ORDER BY COUNT(*) DESC;
