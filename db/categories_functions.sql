--
-- AUTOMATICALLY GENERATED SCRIPT
-- DO NOT EDIT DIRECTLY, EDIT INSTEAD "/categories.json"
-- THEN RUN "yarn run categories" TO UPDATE
--

-- Function for getting normalized category (cat1) from OSM tags
CREATE OR REPLACE FUNCTION get_category1(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
BEGIN
	IF (tags->'amenity' IN ('townhall', 'police')) OR (tags->'office' = 'government') THEN
		RETURN 'administration';
	ELSIF (tags->'amenity' IN ('bank', 'atm')) OR (tags->'office' = 'insurance') OR (tags->'shop' = 'insurance') THEN
		RETURN 'financial';
	ELSIF tags->'amenity' IN ('post_office', 'letter_box', 'post_box') THEN
		RETURN 'post_service';
	ELSIF tags->'amenity' IN ('restaurant', 'fast_food', 'bar', 'pub', 'cafe', 'ice_cream', 'nightclub') THEN
		RETURN 'outside';
	ELSIF (tags->'office' = 'association' AND tags->'association:for' = 'disabled') OR (tags->'amenity' IN ('cinema', 'theatre', 'library')) OR (tags->'tourism' IN ('museum', 'theme_park')) OR (tags->'club' IN ('scout', 'social', 'freemasonry', 'music', 'automobile', 'culture', 'veterans', 'sailing', 'youth', 'shooting', 'charity', 'fishing', 'motorcycle', 'game', 'ethnic', 'history', 'tourism', 'computer', 'board_games', 'dog', 'religion', 'linux', 'student', 'art', 'nature')) THEN
		RETURN 'leisure';
	ELSIF (tags->'leisure' = 'sports_centre' AND tags->'sport' = 'swimming') OR (tags->'leisure' = 'swimming_pool' AND tags->'access' IN ('yes', 'public')) OR (tags->'club' = 'sport' AND tags->'sport:for' = 'disabled') OR (tags->'amenity' = 'swimming_pool') THEN
		RETURN 'sport';
	ELSIF (tags->'office' = 'company' AND tags->'name' IN ('Electricité de Tahiti', 'EDT', 'Électricité de Tahiti')) OR (tags->'office' = 'company' AND tags->'short_name' = 'EDT') OR (tags->'amenity' = 'vending_machine' AND tags->'vending' = 'condoms') OR (tags->'shop' IN ('frozen_food', 'supermarket', 'butcher', 'cheese', 'convenience', 'general', 'seafood', 'greengrocer', 'deli', 'spices', 'honey', 'pasta', 'cannery', 'tea', 'coffee', 'health_food', 'dairy', 'confectionery', 'chocolate', 'farm', 'bakery', 'pastry', 'alcohol', 'beverages', 'wine', 'winery', 'boutique', 'clothes', 'fashion', 'shoes', 'bag', 'jewelry', 'tailor', 'watches', 'fishing', 'hunting', 'sports', 'outdoor', 'beauty', 'cosmetics', 'hairdresser', 'massage', 'perfumery', 'chemist', 'tatoo', 'fabric', 'sewing', 'haberdashery', 'wool', 'art', 'music', 'musical_instrument', 'photo', 'craft', 'camera', 'video', 'video_games', 'stationery', 'printer_ink', 'books', 'kiosk', 'newsagent', 'medical_supply', 'optician', 'hearing_aids', 'variety_store', 'department_store', 'wholesale', 'second_hand', 'charity', 'bathroom_furnishing', 'carpet', 'curtain', 'furniture', 'kitchen', 'houseware', 'interior_decoration', 'pottery', 'lighting', 'bed', 'doityourself', 'electrical', 'fireplace', 'glaziery', 'hardware', 'paint', 'tiles', 'mobile_phone', 'computer', 'electronics', 'appliance', 'hifi')) OR (tags->'amenity' = 'marketplace') OR (tags->'craft' IN ('sewing', 'optician', 'electronics_repair')) THEN
		RETURN 'shop';
	ELSIF (tags->'amenity' = 'school' AND tags->'school:FR' IN ('élémentaire', 'maternelle', 'primaire')) OR (tags->'amenity' = 'school' AND tags->'school:FR' = 'collège') OR (tags->'amenity' = 'school' AND tags->'school:FR' = 'lycée') OR (tags->'amenity' IN ('childcare', 'kindergarten', 'university', 'college')) THEN
		RETURN 'education';
	ELSIF (tags->'healthcare' IN ('centre', 'rehabilitation', 'audiologist', 'dentist', 'midwife', 'nurse', 'podiatrist', 'psychotherapist', 'speech_therapist', 'clinic', 'hospital', 'doctor', 'occupational_therapist', 'physiotherapist')) OR (tags->'amenity' IN ('doctors', 'clinic', 'hospital', 'pharmacy')) THEN
		RETURN 'health';
	ELSIF (tags->'amenity' = 'parking_space' AND tags->'parking_space' = 'disabled') OR (tags->'amenity' = 'parking_space' AND tags->'wheelchair' IN ('yes', 'designated')) OR (tags->'amenity' IN ('parking', 'parking_space') AND tags->'capacity:disabled' != '') OR (tags->'public_transport' IN ('stop_position', 'platform') AND tags->'bus' = 'yes') OR (tags->'amenity' IN ('fuel', 'car_rental', 'taxi', 'bus_station', 'ferry_terminal')) OR (tags->'shop' = 'gas') OR (tags->'highway' IN ('bus_stop', 'elevator')) OR (tags->'aeroway' = 'aerodrome') OR (tags->'room' = 'elevator') OR (tags->'building:part' = 'elevator') OR (tags->'buildingpart:verticalpassage' = 'elevator') OR (tags->'building' = 'elevator') OR (tags->'indoor' = 'elevator') THEN
		RETURN 'mobility';
	ELSIF (tags->'leisure' IN ('beach_resort', 'park')) OR (tags->'natural' = 'beach') OR (tags->'amenity' IN ('drinking_water', 'toilets')) OR (tags->'tourism' IN ('viewpoint', 'artwork')) OR (tags->'waterway' = 'waterfall') THEN
		RETURN 'tourism';
	ELSIF tags->'tourism' IN ('guest_house', 'hotel', 'hostel') THEN
		RETURN 'housing';
	ELSIF tags->'opening_hours:covid19' != '' THEN
		RETURN 'other';
	ELSE
		RETURN NULL;
	END IF;
END;
$$ LANGUAGE plpgsql IMMUTABLE;


-- Function for getting normalized subcategory (cat2) from OSM tags
CREATE OR REPLACE FUNCTION get_category2(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
BEGIN
	IF tags->'amenity' = 'townhall' THEN
		RETURN 'townhall';
	ELSIF tags->'office' = 'government' THEN
		RETURN 'government';
	ELSIF tags->'amenity' = 'police' THEN
		RETURN 'police';
	ELSIF tags->'amenity' = 'bank' THEN
		RETURN 'bank';
	ELSIF tags->'amenity' = 'atm' THEN
		RETURN 'atm';
	ELSIF (tags->'office' = 'insurance') OR (tags->'shop' = 'insurance') THEN
		RETURN 'insurance';
	ELSIF tags->'amenity' = 'post_office' THEN
		RETURN 'post_office';
	ELSIF tags->'amenity' = 'letter_box' THEN
		RETURN 'letter_box';
	ELSIF tags->'amenity' = 'post_box' THEN
		RETURN 'post_box';
	ELSIF tags->'amenity' IN ('restaurant', 'fast_food') THEN
		RETURN 'restaurant';
	ELSIF tags->'amenity' IN ('bar', 'pub') THEN
		RETURN 'bar';
	ELSIF tags->'amenity' IN ('cafe', 'ice_cream') THEN
		RETURN 'cafe';
	ELSIF tags->'amenity' = 'nightclub' THEN
		RETURN 'nightclub';
	ELSIF tags->'amenity' = 'cinema' THEN
		RETURN 'cinema';
	ELSIF tags->'amenity' = 'theatre' THEN
		RETURN 'theatre';
	ELSIF tags->'tourism' = 'museum' THEN
		RETURN 'museum';
	ELSIF tags->'office' = 'association' AND tags->'association:for' = 'disabled' THEN
		RETURN 'association';
	ELSIF tags->'club' IN ('scout', 'social', 'freemasonry', 'music', 'automobile', 'culture', 'veterans', 'sailing', 'youth', 'shooting', 'charity', 'fishing', 'motorcycle', 'game', 'ethnic', 'history', 'tourism', 'computer', 'board_games', 'dog', 'religion', 'linux', 'student', 'art', 'nature') THEN
		RETURN 'leisure_club';
	ELSIF tags->'amenity' = 'library' THEN
		RETURN 'library';
	ELSIF tags->'tourism' = 'theme_park' THEN
		RETURN 'theme_park';
	ELSIF (tags->'leisure' = 'sports_centre' AND tags->'sport' = 'swimming') OR (tags->'leisure' = 'swimming_pool' AND tags->'access' IN ('yes', 'public')) OR (tags->'amenity' = 'swimming_pool') THEN
		RETURN 'swimming_pool';
	ELSIF tags->'club' = 'sport' AND tags->'sport:for' = 'disabled' THEN
		RETURN 'club';
	ELSIF tags->'shop' IN ('frozen_food', 'supermarket', 'butcher', 'cheese', 'convenience', 'general', 'seafood', 'greengrocer', 'deli', 'spices', 'honey', 'pasta', 'cannery', 'tea', 'coffee', 'health_food', 'dairy', 'confectionery', 'chocolate', 'farm', 'bakery', 'pastry', 'alcohol', 'beverages', 'wine', 'winery') THEN
		RETURN 'food';
	ELSIF tags->'amenity' = 'marketplace' THEN
		RETURN 'marketplace';
	ELSIF tags->'shop' IN ('boutique', 'clothes', 'fashion', 'shoes', 'bag', 'jewelry', 'tailor', 'watches') THEN
		RETURN 'clothes';
	ELSIF tags->'shop' IN ('fishing', 'hunting', 'sports', 'outdoor') THEN
		RETURN 'sports';
	ELSIF tags->'shop' IN ('beauty', 'cosmetics', 'hairdresser', 'massage', 'perfumery', 'chemist', 'tatoo') THEN
		RETURN 'beauty';
	ELSIF (tags->'office' = 'company' AND tags->'name' IN ('Electricité de Tahiti', 'EDT', 'Électricité de Tahiti')) OR (tags->'office' = 'company' AND tags->'short_name' = 'EDT') THEN
		RETURN 'edt';
	ELSIF (tags->'shop' IN ('fabric', 'sewing', 'haberdashery', 'wool', 'art', 'music', 'musical_instrument', 'photo', 'craft', 'camera', 'video', 'video_games')) OR (tags->'craft' = 'sewing') THEN
		RETURN 'art';
	ELSIF tags->'shop' IN ('stationery', 'printer_ink', 'books', 'kiosk', 'newsagent') THEN
		RETURN 'stationery';
	ELSIF tags->'shop' = 'medical_supply' THEN
		RETURN 'medical_supply';
	ELSIF (tags->'shop' = 'optician') OR (tags->'craft' = 'optician') THEN
		RETURN 'optician';
	ELSIF tags->'shop' = 'hearing_aids' THEN
		RETURN 'hearing_aids';
	ELSIF tags->'shop' IN ('variety_store', 'department_store', 'wholesale', 'second_hand', 'charity') THEN
		RETURN 'variety_store';
	ELSIF tags->'shop' IN ('bathroom_furnishing', 'carpet', 'curtain', 'furniture', 'kitchen', 'houseware', 'interior_decoration', 'pottery', 'lighting', 'bed', 'doityourself', 'electrical', 'fireplace', 'glaziery', 'hardware', 'paint', 'tiles') THEN
		RETURN 'home';
	ELSIF (tags->'shop' IN ('mobile_phone', 'computer', 'electronics', 'appliance', 'hifi')) OR (tags->'craft' = 'electronics_repair') THEN
		RETURN 'electronics';
	ELSIF tags->'amenity' = 'vending_machine' AND tags->'vending' = 'condoms' THEN
		RETURN 'condoms';
	ELSIF tags->'amenity' = 'childcare' THEN
		RETURN 'childcare';
	ELSIF tags->'amenity' = 'kindergarten' THEN
		RETURN 'kindergarten';
	ELSIF tags->'amenity' = 'school' AND tags->'school:FR' IN ('élémentaire', 'maternelle', 'primaire') THEN
		RETURN 'elementary';
	ELSIF tags->'amenity' = 'school' AND tags->'school:FR' = 'collège' THEN
		RETURN 'college';
	ELSIF tags->'amenity' = 'school' AND tags->'school:FR' = 'lycée' THEN
		RETURN 'lycee';
	ELSIF tags->'amenity' = 'university' THEN
		RETURN 'university';
	ELSIF tags->'amenity' = 'college' THEN
		RETURN 'college_sup';
	ELSIF (tags->'healthcare' IN ('centre', 'rehabilitation', 'audiologist', 'dentist', 'midwife', 'nurse', 'podiatrist', 'psychotherapist', 'speech_therapist')) OR (tags->'amenity' = 'doctors') THEN
		RETURN 'centre';
	ELSIF (tags->'healthcare' = 'clinic') OR (tags->'amenity' = 'clinic') THEN
		RETURN 'clinic';
	ELSIF (tags->'healthcare' = 'hospital') OR (tags->'amenity' = 'hospital') THEN
		RETURN 'hospital';
	ELSIF tags->'amenity' = 'pharmacy' THEN
		RETURN 'pharmacy';
	ELSIF tags->'healthcare' = 'doctor' THEN
		RETURN 'doctor';
	ELSIF tags->'healthcare' = 'occupational_therapist' THEN
		RETURN 'occupational_therapist';
	ELSIF tags->'healthcare' = 'physiotherapist' THEN
		RETURN 'physiotherapist';
	ELSIF (tags->'amenity' = 'parking_space' AND tags->'parking_space' = 'disabled') OR (tags->'amenity' = 'parking_space' AND tags->'wheelchair' IN ('yes', 'designated')) OR (tags->'amenity' IN ('parking', 'parking_space') AND tags->'capacity:disabled' != '') THEN
		RETURN 'parking_pmr';
	ELSIF (tags->'amenity' = 'fuel') OR (tags->'shop' = 'gas') THEN
		RETURN 'fuel';
	ELSIF tags->'amenity' = 'car_rental' THEN
		RETURN 'car_rental';
	ELSIF tags->'amenity' = 'taxi' THEN
		RETURN 'taxi';
	ELSIF (tags->'highway' = 'bus_stop') OR (tags->'amenity' = 'bus_station') OR (tags->'public_transport' IN ('stop_position', 'platform') AND tags->'bus' = 'yes') THEN
		RETURN 'bus_stop';
	ELSIF tags->'amenity' = 'ferry_terminal' THEN
		RETURN 'ferry';
	ELSIF tags->'aeroway' = 'aerodrome' THEN
		RETURN 'airport';
	ELSIF (tags->'highway' = 'elevator') OR (tags->'room' = 'elevator') OR (tags->'building:part' = 'elevator') OR (tags->'buildingpart:verticalpassage' = 'elevator') OR (tags->'building' = 'elevator') OR (tags->'indoor' = 'elevator') THEN
		RETURN 'elevator';
	ELSIF (tags->'leisure' = 'beach_resort') OR (tags->'natural' = 'beach') THEN
		RETURN 'beach_resort';
	ELSIF tags->'leisure' = 'park' THEN
		RETURN 'park';
	ELSIF tags->'amenity' = 'drinking_water' THEN
		RETURN 'drinking_water';
	ELSIF tags->'amenity' = 'toilets' THEN
		RETURN 'toilets';
	ELSIF tags->'tourism' = 'viewpoint' THEN
		RETURN 'viewpoint';
	ELSIF tags->'tourism' = 'artwork' THEN
		RETURN 'artwork';
	ELSIF tags->'waterway' = 'waterfall' THEN
		RETURN 'waterfall';
	ELSIF tags->'tourism' = 'guest_house' THEN
		RETURN 'guest_house';
	ELSIF tags->'tourism' = 'hotel' THEN
		RETURN 'hotel';
	ELSIF tags->'tourism' = 'hostel' THEN
		RETURN 'hostel';
	ELSE
		RETURN 'other';
	END IF;
END;
$$ LANGUAGE plpgsql IMMUTABLE;


-- Function for getting normalized subfilter (cat3) from OSM tags
CREATE OR REPLACE FUNCTION get_category3(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
BEGIN
	tags := tags::hstore || CONCAT('cat2=>', get_category2(tags, area))::hstore;
	IF (tags->'name' = 'Caisse de Prévoyance Sociale' AND tags->'cat2' = 'government') OR (tags->'name' = 'CPS' AND tags->'cat2' = 'government') OR (tags->'short_name' = 'CPS' AND tags->'cat2' = 'government') THEN
		RETURN 'cps';
	ELSIF (tags->'name' = 'Service des Affaires Sociales' AND tags->'cat2' = 'government') OR (tags->'name' = 'Direction des Solidarités, de la Famille et de l''Egalité' AND tags->'cat2' = 'government') OR (tags->'name' = 'DFSE' AND tags->'cat2' = 'government') OR (tags->'short_name' = 'DFSE' AND tags->'cat2' = 'government') THEN
		RETURN 'dsfe';
	ELSIF (tags->'name' = 'Commission Technique d''Orientation et de Reclassement Professionnel' AND tags->'cat2' = 'government') OR (tags->'name' = 'COTOREP' AND tags->'cat2' = 'government') OR (tags->'short_name' = 'COTOREP' AND tags->'cat2' = 'government') THEN
		RETURN 'cotorep';
	ELSIF (tags->'name' = 'Service de l''emploi, de la formation et de l''insertion professionnelles' AND tags->'cat2' = 'government') OR (tags->'name' = 'SEFI' AND tags->'cat2' = 'government') OR (tags->'short_name' = 'SEFI' AND tags->'cat2' = 'government') THEN
		RETURN 'sefi';
	ELSE
		RETURN 'other';
	END IF;
END;
$$ LANGUAGE plpgsql IMMUTABLE;
