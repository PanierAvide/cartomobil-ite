--
-- AUTOMATICALLY GENERATED SCRIPT
-- DO NOT EDIT DIRECTLY, EDIT INSTEAD "/categories.json"
-- THEN RUN "yarn run categories" TO UPDATE
--

-- Function for getting normalized category from OSM tags
CREATE OR REPLACE FUNCTION get_category(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
BEGIN
	IF (tags->'amenity' IN ('townhall', 'police')) OR (tags->'office' = 'government') THEN
		RETURN 'administration';
	ELSIF (tags->'amenity' IN ('bank', 'atm')) OR (tags->'office' = 'insurance') OR (tags->'shop' = 'insurance') THEN
		RETURN 'financial';
	ELSIF tags->'amenity' IN ('post_office', 'letter_box', 'post_box') THEN
		RETURN 'post_service';
	ELSIF tags->'amenity' IN ('restaurant', 'fast_food', 'cafe', 'ice_cream', 'bar', 'pub', 'nightclub') THEN
		RETURN 'outside';
	ELSIF (tags->'office' = 'association' AND tags->'association:for' = 'disabled') OR (tags->'amenity' IN ('cinema', 'theatre', 'library')) OR (tags->'tourism' = 'museum') THEN
		RETURN 'leisure';
	ELSIF (tags->'leisure' = 'sports_centre' AND tags->'sport' = 'swimming') OR (tags->'leisure' = 'swimming_pool' AND tags->'access' IN ('yes', 'public')) OR (tags->'club' = 'sport' AND tags->'sport:for' = 'disabled') OR (tags->'amenity' = 'swimming_pool') THEN
		RETURN 'sport';
	ELSIF (tags->'office' = 'company' AND tags->'name' IN ('Electricité de Tahiti', 'EDT', 'Électricité de Tahiti')) OR (tags->'office' = 'company' AND tags->'short_name' = 'EDT') OR (tags->'amenity' = 'vending_machine' AND tags->'vending' = 'condoms') OR (tags->'shop' IN ('boutique', 'clothes', 'fashion', 'shoes', 'bag', 'jewelry', 'tailor', 'watches', 'frozen_food', 'supermarket', 'butcher', 'cheese', 'convenience', 'general', 'seafood', 'greengrocer', 'deli', 'spices', 'honey', 'pasta', 'cannery', 'tea', 'coffee', 'health_food', 'dairy', 'confectionery', 'chocolate', 'farm', 'bakery', 'pastry', 'alcohol', 'beverages', 'wine', 'winery', 'beauty', 'cosmetics', 'hairdresser', 'massage', 'perfumery', 'chemist', 'medical_supply', 'fabric', 'sewing', 'haberdashery', 'wool', 'art', 'music', 'musical_instrument', 'photo', 'toys', 'video', 'video_games', 'stationery', 'printer_ink', 'books', 'kiosk', 'newsagent', 'variety_store', 'department_store', 'wholesale', 'second_hand', 'charity', 'fishing', 'hunting', 'sports', 'outdoor', 'bathroom_furnishing', 'carpet', 'curtain', 'furniture', 'kitchen', 'houseware', 'interior_decoration', 'pottery', 'lighting', 'bed', 'doityourself', 'electrical', 'fireplace', 'glaziery', 'hardware', 'paint', 'tiles', 'mobile_phone', 'computer', 'electronics', 'appliance', 'hifi', 'optician', 'hearing_aids')) OR (tags->'amenity' = 'marketplace') OR (tags->'craft' IN ('sewing', 'electronics_repair', 'optician')) THEN
		RETURN 'shop';
	ELSIF (tags->'amenity' = 'school' AND tags->'school:FR' IN ('élémentaire', 'maternelle', 'primaire')) OR (tags->'amenity' = 'school' AND tags->'school:FR' = 'collège') OR (tags->'amenity' = 'school' AND tags->'school:FR' = 'lycée') OR (tags->'amenity' IN ('childcare', 'kindergarten')) THEN
		RETURN 'education';
	ELSIF (tags->'amenity' IN ('pharmacy', 'hospital', 'clinic', 'doctors')) OR (tags->'healthcare' IN ('hospital', 'clinic', 'centre', 'rehabilitation', 'audiologist', 'dentist', 'midwife', 'nurse', 'podiatrist', 'psychotherapist', 'speech_therapist', 'occupational_therapist', 'doctor', 'physiotherapist')) THEN
		RETURN 'health';
	ELSIF (tags->'public_transport' IN ('stop_position', 'platform') AND tags->'bus' = 'yes') OR (tags->'amenity' = 'parking_space' AND tags->'parking_space' = 'disabled') OR (tags->'amenity' = 'parking_space' AND tags->'wheelchair' IN ('yes', 'designated')) OR (tags->'amenity' IN ('parking', 'parking_space') AND tags->'capacity:disabled' != '') OR (tags->'highway' = 'bus_stop') OR (tags->'amenity' IN ('bus_station', 'ferry_terminal', 'taxi', 'fuel', 'car_rental')) OR (tags->'aeroway' = 'aerodrome') OR (tags->'shop' = 'gas') THEN
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


-- Function for getting normalized subcategory from OSM tags
CREATE OR REPLACE FUNCTION get_subcategory(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
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
	ELSIF tags->'amenity' IN ('cafe', 'ice_cream') THEN
		RETURN 'cafe';
	ELSIF tags->'amenity' IN ('bar', 'pub') THEN
		RETURN 'bar';
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
	ELSIF tags->'amenity' = 'library' THEN
		RETURN 'library';
	ELSIF (tags->'leisure' = 'sports_centre' AND tags->'sport' = 'swimming') OR (tags->'leisure' = 'swimming_pool' AND tags->'access' IN ('yes', 'public')) OR (tags->'amenity' = 'swimming_pool') THEN
		RETURN 'swimming_pool';
	ELSIF tags->'club' = 'sport' AND tags->'sport:for' = 'disabled' THEN
		RETURN 'club';
	ELSIF tags->'shop' IN ('boutique', 'clothes', 'fashion', 'shoes', 'bag', 'jewelry', 'tailor', 'watches') THEN
		RETURN 'clothes';
	ELSIF (tags->'shop' IN ('frozen_food', 'supermarket', 'butcher', 'cheese', 'convenience', 'general', 'seafood', 'greengrocer', 'deli', 'spices', 'honey', 'pasta', 'cannery', 'tea', 'coffee', 'health_food', 'dairy', 'confectionery', 'chocolate', 'farm', 'bakery', 'pastry', 'alcohol', 'beverages', 'wine', 'winery')) OR (tags->'amenity' = 'marketplace') THEN
		RETURN 'food';
	ELSIF tags->'shop' IN ('beauty', 'cosmetics', 'hairdresser', 'massage', 'perfumery', 'chemist') THEN
		RETURN 'beauty';
	ELSIF tags->'shop' = 'medical_supply' THEN
		RETURN 'medical_supply';
	ELSIF (tags->'shop' IN ('fabric', 'sewing', 'haberdashery', 'wool', 'art', 'music', 'musical_instrument', 'photo', 'toys', 'video', 'video_games')) OR (tags->'craft' = 'sewing') THEN
		RETURN 'art';
	ELSIF tags->'shop' IN ('stationery', 'printer_ink', 'books', 'kiosk', 'newsagent') THEN
		RETURN 'stationery';
	ELSIF tags->'shop' IN ('variety_store', 'department_store', 'wholesale', 'second_hand', 'charity') THEN
		RETURN 'variety_store';
	ELSIF tags->'shop' IN ('fishing', 'hunting', 'sports', 'outdoor') THEN
		RETURN 'sports';
	ELSIF tags->'shop' IN ('bathroom_furnishing', 'carpet', 'curtain', 'furniture', 'kitchen', 'houseware', 'interior_decoration', 'pottery', 'lighting', 'bed', 'doityourself', 'electrical', 'fireplace', 'glaziery', 'hardware', 'paint', 'tiles') THEN
		RETURN 'home';
	ELSIF (tags->'shop' IN ('mobile_phone', 'computer', 'electronics', 'appliance', 'hifi')) OR (tags->'craft' = 'electronics_repair') THEN
		RETURN 'electronics';
	ELSIF (tags->'office' = 'company' AND tags->'name' IN ('Electricité de Tahiti', 'EDT', 'Électricité de Tahiti')) OR (tags->'office' = 'company' AND tags->'short_name' = 'EDT') THEN
		RETURN 'edt';
	ELSIF (tags->'shop' = 'optician') OR (tags->'craft' = 'optician') THEN
		RETURN 'optician';
	ELSIF tags->'shop' = 'hearing_aids' THEN
		RETURN 'hearing_aids';
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
	ELSIF tags->'amenity' = 'pharmacy' THEN
		RETURN 'pharmacy';
	ELSIF (tags->'healthcare' = 'hospital') OR (tags->'amenity' = 'hospital') THEN
		RETURN 'hospital';
	ELSIF (tags->'healthcare' = 'clinic') OR (tags->'amenity' = 'clinic') THEN
		RETURN 'clinic';
	ELSIF (tags->'healthcare' IN ('centre', 'rehabilitation', 'audiologist', 'dentist', 'midwife', 'nurse', 'podiatrist', 'psychotherapist', 'speech_therapist')) OR (tags->'amenity' = 'doctors') THEN
		RETURN 'centre';
	ELSIF tags->'healthcare' = 'occupational_therapist' THEN
		RETURN 'occupational_therapist';
	ELSIF tags->'healthcare' = 'doctor' THEN
		RETURN 'doctor';
	ELSIF tags->'healthcare' = 'physiotherapist' THEN
		RETURN 'physiotherapist';
	ELSIF (tags->'highway' = 'bus_stop') OR (tags->'amenity' = 'bus_station') OR (tags->'public_transport' IN ('stop_position', 'platform') AND tags->'bus' = 'yes') THEN
		RETURN 'bus_stop';
	ELSIF tags->'amenity' = 'ferry_terminal' THEN
		RETURN 'ferry';
	ELSIF tags->'amenity' = 'taxi' THEN
		RETURN 'taxi';
	ELSIF tags->'aeroway' = 'aerodrome' THEN
		RETURN 'airport';
	ELSIF (tags->'amenity' = 'parking_space' AND tags->'parking_space' = 'disabled') OR (tags->'amenity' = 'parking_space' AND tags->'wheelchair' IN ('yes', 'designated')) OR (tags->'amenity' IN ('parking', 'parking_space') AND tags->'capacity:disabled' != '') THEN
		RETURN 'parking_pmr';
	ELSIF (tags->'amenity' = 'fuel') OR (tags->'shop' = 'gas') THEN
		RETURN 'fuel';
	ELSIF tags->'amenity' = 'car_rental' THEN
		RETURN 'car_rental';
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
