--
-- AUTOMATICALLY GENERATED SCRIPT
-- DO NOT EDIT DIRECTLY, EDIT INSTEAD "/categories.json"
-- THEN RUN "yarn run categories" TO UPDATE
--

-- Function for getting normalized category (cat1) from OSM tags
CREATE OR REPLACE FUNCTION get_category1(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
DECLARE
	result VARCHAR;
BEGIN
	IF (tags->'amenity' IN ('townhall', 'police')) OR (tags->'office' IN ('government', 'employment_agency')) THEN
		result := 'administration';
	ELSIF (tags->'amenity' IN ('bank', 'atm')) OR (tags->'office' = 'insurance') OR (tags->'shop' = 'insurance') THEN
		result := 'financial';
	ELSIF tags->'amenity' IN ('post_office', 'letter_box', 'post_box') THEN
		result := 'post_service';
	ELSIF tags->'amenity' IN ('restaurant', 'fast_food', 'bar', 'pub', 'cafe', 'ice_cream', 'nightclub') THEN
		result := 'outside';
	ELSIF (tags->'amenity' IN ('cinema', 'theatre', 'library')) OR (tags->'tourism' IN ('museum', 'theme_park')) OR (tags->'office' = 'association') OR (tags->'club' != '') THEN
		result := 'leisure';
	ELSIF (tags->'leisure' = 'sports_centre' AND tags->'sport' = 'swimming') OR (tags->'leisure' = 'swimming_pool' AND tags->'access' IN ('yes', 'public')) OR (tags->'club' = 'sport' AND tags->'sport:for' = 'disabled') OR (tags->'amenity' = 'swimming_pool') THEN
		result := 'sport';
	ELSIF (tags->'office' = 'company' AND tags->'name' IN ('Electricité de Tahiti', 'EDT', 'Électricité de Tahiti')) OR (tags->'office' = 'company' AND tags->'short_name' = 'EDT') OR (tags->'amenity' = 'vending_machine' AND tags->'vending' = 'condoms') OR (tags->'shop' IN ('frozen_food', 'supermarket', 'butcher', 'cheese', 'convenience', 'general', 'seafood', 'greengrocer', 'deli', 'spices', 'honey', 'pasta', 'cannery', 'tea', 'coffee', 'health_food', 'dairy', 'confectionery', 'chocolate', 'farm', 'bakery', 'pastry', 'alcohol', 'beverages', 'wine', 'winery', 'boutique', 'clothes', 'fashion', 'shoes', 'bag', 'jewelry', 'tailor', 'watches', 'fishing', 'hunting', 'sports', 'outdoor', 'beauty', 'cosmetics', 'hairdresser', 'massage', 'perfumery', 'chemist', 'tattoo', 'fabric', 'sewing', 'haberdashery', 'wool', 'art', 'music', 'musical_instrument', 'photo', 'craft', 'camera', 'video', 'video_games', 'stationery', 'printer_ink', 'books', 'kiosk', 'newsagent', 'medical_supply', 'optician', 'hearing_aids', 'variety_store', 'department_store', 'wholesale', 'second_hand', 'charity', 'bathroom_furnishing', 'carpet', 'curtain', 'furniture', 'kitchen', 'houseware', 'interior_decoration', 'pottery', 'lighting', 'bed', 'doityourself', 'electrical', 'fireplace', 'glaziery', 'hardware', 'paint', 'tiles', 'obile_phone', 'computer', 'electronics', 'appliance', 'hifi')) OR (tags->'amenity' = 'marketplace') OR (tags->'craft' != '') THEN
		result := 'shop';
	ELSIF (tags->'amenity' = 'school' AND tags->'school:FR' IN ('élémentaire', 'maternelle', 'primaire')) OR (tags->'amenity' = 'school' AND tags->'school:FR' = 'collège') OR (tags->'amenity' = 'school' AND tags->'school:FR' = 'lycée') OR (tags->'amenity' IN ('childcare', 'kindergarten', 'university', 'college')) THEN
		result := 'education';
	ELSIF (tags->'healthcare' IN ('centre', 'rehabilitation', 'audiologist', 'dentist', 'midwife', 'nurse', 'podiatrist', 'psychotherapist', 'speech_therapist', 'clinic', 'hospital', 'doctor', 'occupational_therapist', 'physiotherapist')) OR (tags->'amenity' IN ('doctors', 'clinic', 'hospital', 'pharmacy')) THEN
		result := 'health';
	ELSIF (tags->'amenity' = 'parking_space' AND tags->'parking_space' = 'disabled') OR (tags->'amenity' = 'parking_space' AND tags->'wheelchair' IN ('yes', 'designated')) OR (tags->'amenity' = 'parking_space' AND tags->'capacity:disabled' != '') OR (tags->'public_transport' IN ('stop_position', 'platform') AND tags->'bus' = 'yes') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'amenity' = 'parking' AND tags->'informal' = 'yes') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'construction' = 'yes') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'power' = 'pole') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'highway' IN ('street_lamp', 'traffic_signals')) OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'barrier' IN ('bollard', 'cycle_barrier', 'block')) OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'traffic_sign' != '') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'tourism' = 'information') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'natural' = 'tree') OR (tags->'barrier' = 'kerb' AND tags->'kerb' = 'raised') OR (tags->'highway' != '' AND tags->'smoothness' IN ('bad', 'horrible')) OR (tags->'highway' != '' AND tags->'surface' IN ('metal', 'wood', 'compacted', 'fine_gravel', 'unhewn_cobblestone', 'sand', 'ground')) OR (tags->'amenity' IN ('parking', 'fuel', 'car_rental', 'taxi', 'bus_station', 'ferry_terminal')) OR (tags->'shop' = 'gas') OR (tags->'highway' IN ('bus_stop', 'elevator')) OR (tags->'aeroway' = 'aerodrome') OR (tags->'room' = 'elevator') OR (tags->'building:part' = 'elevator') OR (tags->'buildingpart:verticalpassage' = 'elevator') OR (tags->'building' = 'elevator') OR (tags->'indoor' = 'elevator') THEN
		result := 'mobility';
	ELSIF (tags->'amenity' = 'marketplace' AND tags->'tourism' = 'attraction') OR (tags->'tourism' != '' AND tags->'historic' != '') OR (tags->'tourism' IN ('guest_house', 'hotel', 'hostel', 'viewpoint', 'artwork')) OR (tags->'leisure' IN ('beach_resort', 'park')) OR (tags->'natural' = 'beach') OR (tags->'waterway' = 'waterfall') OR (tags->'amenity' IN ('drinking_water', 'toilets')) THEN
		result := 'tourism';
	ELSE
		result := NULL;
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql IMMUTABLE;


-- Function for getting normalized subcategory (cat2) from OSM tags
CREATE OR REPLACE FUNCTION get_category2(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
DECLARE
	result VARCHAR;
BEGIN
	IF tags->'amenity' = 'townhall' THEN
		result := 'townhall';
	ELSIF tags->'office' IN ('government', 'employment_agency') THEN
		result := 'government';
	ELSIF tags->'amenity' = 'police' THEN
		result := 'police';
	ELSIF tags->'amenity' = 'bank' THEN
		result := 'bank';
	ELSIF tags->'amenity' = 'atm' THEN
		result := 'atm';
	ELSIF (tags->'office' = 'insurance') OR (tags->'shop' = 'insurance') THEN
		result := 'insurance';
	ELSIF tags->'amenity' = 'post_office' THEN
		result := 'post_office';
	ELSIF tags->'amenity' = 'letter_box' THEN
		result := 'letter_box';
	ELSIF tags->'amenity' = 'post_box' THEN
		result := 'post_box';
	ELSIF tags->'amenity' IN ('restaurant', 'fast_food') THEN
		result := 'restaurant';
	ELSIF tags->'amenity' IN ('bar', 'pub') THEN
		result := 'bar';
	ELSIF tags->'amenity' IN ('cafe', 'ice_cream') THEN
		result := 'cafe';
	ELSIF tags->'amenity' = 'nightclub' THEN
		result := 'nightclub';
	ELSIF tags->'amenity' = 'cinema' THEN
		result := 'cinema';
	ELSIF tags->'amenity' = 'theatre' THEN
		result := 'theatre';
	ELSIF tags->'tourism' = 'museum' THEN
		result := 'museum';
	ELSIF tags->'office' = 'association' THEN
		result := 'association';
	ELSIF tags->'club' != '' THEN
		result := 'leisure_club';
	ELSIF tags->'amenity' = 'library' THEN
		result := 'library';
	ELSIF tags->'tourism' = 'theme_park' THEN
		result := 'theme_park';
	ELSIF (tags->'leisure' = 'sports_centre' AND tags->'sport' = 'swimming') OR (tags->'leisure' = 'swimming_pool' AND tags->'access' IN ('yes', 'public')) OR (tags->'amenity' = 'swimming_pool') THEN
		result := 'swimming_pool';
	ELSIF tags->'club' = 'sport' AND tags->'sport:for' = 'disabled' THEN
		result := 'club';
	ELSIF tags->'shop' IN ('frozen_food', 'supermarket', 'butcher', 'cheese', 'convenience', 'general', 'seafood', 'greengrocer', 'deli', 'spices', 'honey', 'pasta', 'cannery', 'tea', 'coffee', 'health_food', 'dairy', 'confectionery', 'chocolate', 'farm', 'bakery', 'pastry', 'alcohol', 'beverages', 'wine', 'winery') THEN
		result := 'food';
	ELSIF tags->'amenity' = 'marketplace' THEN
		result := 'marketplace';
	ELSIF tags->'shop' IN ('boutique', 'clothes', 'fashion', 'shoes', 'bag', 'jewelry', 'tailor', 'watches') THEN
		result := 'clothes';
	ELSIF tags->'shop' IN ('fishing', 'hunting', 'sports', 'outdoor') THEN
		result := 'sports';
	ELSIF tags->'shop' IN ('beauty', 'cosmetics', 'hairdresser', 'massage', 'perfumery', 'chemist', 'tattoo') THEN
		result := 'beauty';
	ELSIF (tags->'office' = 'company' AND tags->'name' IN ('Electricité de Tahiti', 'EDT', 'Électricité de Tahiti')) OR (tags->'office' = 'company' AND tags->'short_name' = 'EDT') THEN
		result := 'edt';
	ELSIF (tags->'shop' IN ('fabric', 'sewing', 'haberdashery', 'wool', 'art', 'music', 'musical_instrument', 'photo', 'craft', 'camera', 'video', 'video_games')) OR (tags->'craft' = 'sewing') THEN
		result := 'art';
	ELSIF tags->'craft' != '' THEN
		result := 'craft';
	ELSIF tags->'shop' IN ('stationery', 'printer_ink', 'books', 'kiosk', 'newsagent') THEN
		result := 'office_supply';
	ELSIF tags->'shop' = 'medical_supply' THEN
		result := 'medical_supply';
	ELSIF (tags->'shop' = 'optician') OR (tags->'craft' = 'optician') THEN
		result := 'optician';
	ELSIF tags->'shop' = 'hearing_aids' THEN
		result := 'hearing_aids';
	ELSIF (tags->'shop' IN ('variety_store', 'department_store', 'wholesale', 'second_hand', 'charity', 'bathroom_furnishing', 'carpet', 'curtain', 'furniture', 'kitchen', 'houseware', 'interior_decoration', 'pottery', 'lighting', 'bed', 'doityourself', 'electrical', 'fireplace', 'glaziery', 'hardware', 'paint', 'tiles', 'obile_phone', 'computer', 'electronics', 'appliance', 'hifi')) OR (tags->'craft' = 'electronics_repair') OR (tags->'amenity' = 'vending_machine' AND tags->'vending' = 'condoms') THEN
		result := 'shop_others';
	ELSIF tags->'amenity' = 'childcare' THEN
		result := 'childcare';
	ELSIF tags->'amenity' = 'kindergarten' THEN
		result := 'kindergarten';
	ELSIF tags->'amenity' = 'school' AND tags->'school:FR' IN ('élémentaire', 'maternelle', 'primaire') THEN
		result := 'elementary';
	ELSIF tags->'amenity' = 'school' AND tags->'school:FR' = 'collège' THEN
		result := 'college';
	ELSIF tags->'amenity' = 'school' AND tags->'school:FR' = 'lycée' THEN
		result := 'lycee';
	ELSIF tags->'amenity' = 'university' THEN
		result := 'university';
	ELSIF tags->'amenity' = 'college' THEN
		result := 'college_sup';
	ELSIF (tags->'healthcare' IN ('centre', 'rehabilitation', 'audiologist', 'dentist', 'midwife', 'nurse', 'podiatrist', 'psychotherapist', 'speech_therapist')) OR (tags->'amenity' = 'doctors') THEN
		result := 'centre';
	ELSIF (tags->'healthcare' = 'clinic') OR (tags->'amenity' = 'clinic') THEN
		result := 'clinic';
	ELSIF (tags->'healthcare' = 'hospital') OR (tags->'amenity' = 'hospital') THEN
		result := 'hospital';
	ELSIF tags->'amenity' = 'pharmacy' THEN
		result := 'pharmacy';
	ELSIF tags->'healthcare' = 'doctor' THEN
		result := 'doctor';
	ELSIF tags->'healthcare' = 'occupational_therapist' THEN
		result := 'occupational_therapist';
	ELSIF tags->'healthcare' = 'physiotherapist' THEN
		result := 'physiotherapist';
	ELSIF (tags->'amenity' = 'parking_space' AND tags->'parking_space' = 'disabled') OR (tags->'amenity' = 'parking_space' AND tags->'wheelchair' IN ('yes', 'designated')) OR (tags->'amenity' = 'parking_space' AND tags->'capacity:disabled' != '') THEN
		result := 'parking_pmr';
	ELSIF tags->'amenity' = 'parking' THEN
		result := 'parking';
	ELSIF (tags->'amenity' = 'fuel') OR (tags->'shop' = 'gas') THEN
		result := 'fuel';
	ELSIF tags->'amenity' = 'car_rental' THEN
		result := 'car_rental';
	ELSIF tags->'amenity' = 'taxi' THEN
		result := 'taxi';
	ELSIF (tags->'highway' = 'bus_stop') OR (tags->'amenity' = 'bus_station') OR (tags->'public_transport' IN ('stop_position', 'platform') AND tags->'bus' = 'yes') THEN
		result := 'bus_stop';
	ELSIF tags->'amenity' = 'ferry_terminal' THEN
		result := 'ferry';
	ELSIF tags->'aeroway' = 'aerodrome' THEN
		result := 'airport';
	ELSIF (tags->'highway' = 'elevator') OR (tags->'room' = 'elevator') OR (tags->'building:part' = 'elevator') OR (tags->'buildingpart:verticalpassage' = 'elevator') OR (tags->'building' = 'elevator') OR (tags->'indoor' = 'elevator') THEN
		result := 'elevator';
	ELSIF (tags->'obstacle:wheelchair' = 'yes' AND tags->'amenity' = 'parking' AND tags->'informal' = 'yes') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'construction' = 'yes') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'power' = 'pole') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'highway' IN ('street_lamp', 'traffic_signals')) OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'barrier' IN ('bollard', 'cycle_barrier', 'block')) OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'traffic_sign' != '') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'tourism' = 'information') OR (tags->'obstacle:wheelchair' = 'yes' AND tags->'natural' = 'tree') OR (tags->'barrier' = 'kerb' AND tags->'kerb' = 'raised') OR (tags->'highway' != '' AND tags->'smoothness' IN ('bad', 'horrible')) OR (tags->'highway' != '' AND tags->'surface' IN ('metal', 'wood', 'compacted', 'fine_gravel', 'unhewn_cobblestone', 'sand', 'ground')) THEN
		result := 'barrier';
	ELSIF tags->'tourism' IN ('guest_house', 'hotel', 'hostel') THEN
		result := 'housing';
	ELSIF (tags->'leisure' IN ('beach_resort', 'park')) OR (tags->'natural' = 'beach') OR (tags->'tourism' IN ('viewpoint', 'artwork')) OR (tags->'waterway' = 'waterfall') OR (tags->'tourism' != '' AND tags->'historic' != '') THEN
		result := 'tourism_outside';
	ELSIF tags->'amenity' = 'drinking_water' THEN
		result := 'drinking_water';
	ELSIF tags->'amenity' = 'toilets' THEN
		result := 'toilets';
	ELSE
		result := 'other';
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql IMMUTABLE;


-- Function for getting normalized subfilter (cat3) from OSM tags
CREATE OR REPLACE FUNCTION get_category3(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
DECLARE
	result VARCHAR;
BEGIN
	tags := tags::hstore || CONCAT('cat2=>', get_category2(tags, area))::hstore;
	IF (tags->'name' = 'Caisse de Prévoyance Sociale' AND tags->'cat2' = 'government') OR (tags->'name' = 'CPS' AND tags->'cat2' = 'government') OR (tags->'short_name' = 'CPS' AND tags->'cat2' = 'government') THEN
		result := 'cps';
	ELSIF (tags->'name' = 'Service des Affaires Sociales' AND tags->'cat2' = 'government') OR (tags->'name' = 'Direction des Solidarités, de la Famille et de l''Egalité' AND tags->'cat2' = 'government') OR (tags->'name' = 'DFSE' AND tags->'cat2' = 'government') OR (tags->'short_name' = 'DFSE' AND tags->'cat2' = 'government') THEN
		result := 'dsfe';
	ELSIF (tags->'name' = 'Commission Technique d''Orientation et de Reclassement Professionnel' AND tags->'cat2' = 'government') OR (tags->'name' = 'COTOREP' AND tags->'cat2' = 'government') OR (tags->'short_name' = 'COTOREP' AND tags->'cat2' = 'government') THEN
		result := 'cotorep';
	ELSIF (tags->'name' = 'Service de l''emploi, de la formation et de l''insertion professionnelles' AND tags->'cat2' = 'government') OR (tags->'name' = 'SEFI' AND tags->'cat2' = 'government') OR (tags->'short_name' = 'SEFI' AND tags->'cat2' = 'government') THEN
		result := 'sefi';
	ELSIF (tags->'name' IN ('OPT', 'Office des Postes et Télécommunication') AND tags->'cat2' = 'bank') OR (tags->'operator' IN ('OPT', 'Office des Postes et Télécommunication') AND tags->'cat2' = 'bank') OR (tags->'short_name' = 'OPT' AND tags->'cat2' = 'bank') THEN
		result := 'opt';
	ELSIF (tags->'name' = 'Banque Socredo' AND tags->'cat2' = 'bank') OR (tags->'operator' = 'Banque Socredo' AND tags->'cat2' = 'bank') THEN
		result := 'socredo';
	ELSIF (tags->'name' = 'Banque de Polynésie' AND tags->'cat2' = 'bank') OR (tags->'operator' = 'Banque de Polynésie' AND tags->'cat2' = 'bank') THEN
		result := 'banquepolynesie';
	ELSIF tags->'shop' IN ('stationery', 'printer_ink') AND tags->'cat2' = 'office_supply' THEN
		result := 'stationery';
	ELSIF tags->'shop' IN ('kiosk', 'newsagent') AND tags->'cat2' = 'office_supply' THEN
		result := 'newsagent';
	ELSIF tags->'shop' = 'books' AND tags->'cat2' = 'office_supply' THEN
		result := 'books';
	ELSIF tags->'shop' IN ('bathroom_furnishing', 'carpet', 'curtain', 'furniture', 'kitchen', 'houseware', 'interior_decoration', 'pottery', 'lighting', 'bed', 'doityourself', 'electrical', 'fireplace', 'glaziery', 'hardware', 'paint', 'tiles') AND tags->'cat2' = 'shop_others' THEN
		result := 'home';
	ELSIF (tags->'shop' IN ('mobile_phone', 'computer', 'electronics', 'appliance', 'hifi') AND tags->'cat2' = 'shop_others') OR (tags->'craft' = 'electronics_repair' AND tags->'cat2' = 'shop_others') THEN
		result := 'electronics';
	ELSIF tags->'amenity' = 'vending_machine' AND tags->'vending' = 'condoms' AND tags->'cat2' = 'shop_others' THEN
		result := 'condoms';
	ELSIF tags->'shop' IN ('variety_store', 'department_store', 'wholesale', 'second_hand', 'charity') AND tags->'cat2' = 'shop_others' THEN
		result := 'variety_store';
	ELSIF tags->'tourism' = 'guest_house' AND tags->'cat2' = 'housing' THEN
		result := 'guest_house';
	ELSIF tags->'tourism' = 'hotel' AND tags->'cat2' = 'housing' THEN
		result := 'hotel';
	ELSIF tags->'tourism' = 'hostel' AND tags->'cat2' = 'housing' THEN
		result := 'hostel';
	ELSIF (tags->'leisure' = 'beach_resort' AND tags->'cat2' = 'tourism_outside') OR (tags->'natural' = 'beach' AND tags->'cat2' = 'tourism_outside') THEN
		result := 'beach_resort';
	ELSIF tags->'leisure' = 'park' AND tags->'cat2' = 'tourism_outside' THEN
		result := 'park';
	ELSIF tags->'tourism' = 'viewpoint' AND tags->'cat2' = 'tourism_outside' THEN
		result := 'viewpoint';
	ELSIF tags->'waterway' = 'waterfall' AND tags->'cat2' = 'tourism_outside' THEN
		result := 'waterfall';
	ELSIF tags->'tourism' = 'artwork' AND tags->'cat2' = 'tourism_outside' THEN
		result := 'artwork';
	ELSIF tags->'tourism' != '' AND tags->'historic' != '' AND tags->'cat2' = 'tourism_outside' THEN
		result := 'historic';
	ELSE
		result := 'other';
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql IMMUTABLE;
