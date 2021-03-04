
-- AUTOMATICALLY GENERATED SCRIPT
-- DO NOT EDIT DIRECTLY, EDIT INSTEAD "/categories.json"
-- THEN RUN "yarn run categories" TO UPDATE

BEGIN;
SELECT plan(440);

SELECT is(get_category1('amenity=>townhall'::hstore, 'FR'), 'administration', 'get_category1 amenity=>townhall for FR should be administration');

SELECT is(get_category2('amenity=>townhall'::hstore, 'FR'), 'townhall', 'get_category2 amenity=>townhall for FR should be townhall');

SELECT is(get_category1('office=>government'::hstore, 'FR'), 'administration', 'get_category1 office=>government for FR should be administration');

SELECT is(get_category2('office=>government'::hstore, 'FR'), 'government', 'get_category2 office=>government for FR should be government');

SELECT is(get_category1('office=>employment_agency'::hstore, 'FR'), 'administration', 'get_category1 office=>employment_agency for FR should be administration');

SELECT is(get_category2('office=>employment_agency'::hstore, 'FR'), 'government', 'get_category2 office=>employment_agency for FR should be government');

SELECT is(get_category1('amenity=>police'::hstore, 'FR'), 'administration', 'get_category1 amenity=>police for FR should be administration');

SELECT is(get_category2('amenity=>police'::hstore, 'FR'), 'police', 'get_category2 amenity=>police for FR should be police');

SELECT is(get_category1('amenity=>bank'::hstore, 'FR'), 'financial', 'get_category1 amenity=>bank for FR should be financial');

SELECT is(get_category2('amenity=>bank'::hstore, 'FR'), 'bank', 'get_category2 amenity=>bank for FR should be bank');

SELECT is(get_category1('amenity=>atm'::hstore, 'FR'), 'financial', 'get_category1 amenity=>atm for FR should be financial');

SELECT is(get_category2('amenity=>atm'::hstore, 'FR'), 'atm', 'get_category2 amenity=>atm for FR should be atm');

SELECT is(get_category1('office=>insurance'::hstore, 'FR'), 'financial', 'get_category1 office=>insurance for FR should be financial');

SELECT is(get_category2('office=>insurance'::hstore, 'FR'), 'insurance', 'get_category2 office=>insurance for FR should be insurance');

SELECT is(get_category1('shop=>insurance'::hstore, 'FR'), 'financial', 'get_category1 shop=>insurance for FR should be financial');

SELECT is(get_category2('shop=>insurance'::hstore, 'FR'), 'insurance', 'get_category2 shop=>insurance for FR should be insurance');

SELECT is(get_category1('amenity=>post_office'::hstore, 'FR'), 'post_service', 'get_category1 amenity=>post_office for FR should be post_service');

SELECT is(get_category2('amenity=>post_office'::hstore, 'FR'), 'post_office', 'get_category2 amenity=>post_office for FR should be post_office');

SELECT is(get_category1('amenity=>letter_box'::hstore, 'FR'), 'post_service', 'get_category1 amenity=>letter_box for FR should be post_service');

SELECT is(get_category2('amenity=>letter_box'::hstore, 'FR'), 'letter_box', 'get_category2 amenity=>letter_box for FR should be letter_box');

SELECT is(get_category1('amenity=>post_box'::hstore, 'FR'), 'post_service', 'get_category1 amenity=>post_box for FR should be post_service');

SELECT is(get_category2('amenity=>post_box'::hstore, 'FR'), 'post_box', 'get_category2 amenity=>post_box for FR should be post_box');

SELECT is(get_category1('amenity=>restaurant'::hstore, 'FR'), 'outside', 'get_category1 amenity=>restaurant for FR should be outside');

SELECT is(get_category2('amenity=>restaurant'::hstore, 'FR'), 'restaurant', 'get_category2 amenity=>restaurant for FR should be restaurant');

SELECT is(get_category1('amenity=>fast_food'::hstore, 'FR'), 'outside', 'get_category1 amenity=>fast_food for FR should be outside');

SELECT is(get_category2('amenity=>fast_food'::hstore, 'FR'), 'restaurant', 'get_category2 amenity=>fast_food for FR should be restaurant');

SELECT is(get_category1('amenity=>bar'::hstore, 'FR'), 'outside', 'get_category1 amenity=>bar for FR should be outside');

SELECT is(get_category2('amenity=>bar'::hstore, 'FR'), 'bar', 'get_category2 amenity=>bar for FR should be bar');

SELECT is(get_category1('amenity=>pub'::hstore, 'FR'), 'outside', 'get_category1 amenity=>pub for FR should be outside');

SELECT is(get_category2('amenity=>pub'::hstore, 'FR'), 'bar', 'get_category2 amenity=>pub for FR should be bar');

SELECT is(get_category1('amenity=>cafe'::hstore, 'FR'), 'outside', 'get_category1 amenity=>cafe for FR should be outside');

SELECT is(get_category2('amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_category2 amenity=>cafe for FR should be cafe');

SELECT is(get_category1('amenity=>ice_cream'::hstore, 'FR'), 'outside', 'get_category1 amenity=>ice_cream for FR should be outside');

SELECT is(get_category2('amenity=>ice_cream'::hstore, 'FR'), 'cafe', 'get_category2 amenity=>ice_cream for FR should be cafe');

SELECT is(get_category1('amenity=>nightclub'::hstore, 'FR'), 'outside', 'get_category1 amenity=>nightclub for FR should be outside');

SELECT is(get_category2('amenity=>nightclub'::hstore, 'FR'), 'nightclub', 'get_category2 amenity=>nightclub for FR should be nightclub');

SELECT is(get_category1('amenity=>cinema'::hstore, 'FR'), 'leisure', 'get_category1 amenity=>cinema for FR should be leisure');

SELECT is(get_category2('amenity=>cinema'::hstore, 'FR'), 'cinema', 'get_category2 amenity=>cinema for FR should be cinema');

SELECT is(get_category1('amenity=>theatre'::hstore, 'FR'), 'leisure', 'get_category1 amenity=>theatre for FR should be leisure');

SELECT is(get_category2('amenity=>theatre'::hstore, 'FR'), 'theatre', 'get_category2 amenity=>theatre for FR should be theatre');

SELECT is(get_category1('tourism=>museum'::hstore, 'FR'), 'leisure', 'get_category1 tourism=>museum for FR should be leisure');

SELECT is(get_category2('tourism=>museum'::hstore, 'FR'), 'museum', 'get_category2 tourism=>museum for FR should be museum');

SELECT is(get_category1('office=>association'::hstore, 'FR'), 'leisure', 'get_category1 office=>association for FR should be leisure');

SELECT is(get_category2('office=>association'::hstore, 'FR'), 'association', 'get_category2 office=>association for FR should be association');

SELECT is(get_category1('club=>*'::hstore, 'FR'), 'leisure', 'get_category1 club=>* for FR should be leisure');

SELECT is(get_category2('club=>*'::hstore, 'FR'), 'leisure_club', 'get_category2 club=>* for FR should be leisure_club');

SELECT is(get_category1('amenity=>library'::hstore, 'FR'), 'leisure', 'get_category1 amenity=>library for FR should be leisure');

SELECT is(get_category2('amenity=>library'::hstore, 'FR'), 'library', 'get_category2 amenity=>library for FR should be library');

SELECT is(get_category1('tourism=>theme_park'::hstore, 'FR'), 'leisure', 'get_category1 tourism=>theme_park for FR should be leisure');

SELECT is(get_category2('tourism=>theme_park'::hstore, 'FR'), 'theme_park', 'get_category2 tourism=>theme_park for FR should be theme_park');

SELECT is(get_category1('amenity=>place_of_worship'::hstore, 'FR'), 'leisure', 'get_category1 amenity=>place_of_worship for FR should be leisure');

SELECT is(get_category2('amenity=>place_of_worship'::hstore, 'FR'), 'place_of_worship', 'get_category2 amenity=>place_of_worship for FR should be place_of_worship');

SELECT is(get_category1('leisure=>sports_centre, sport=>swimming'::hstore, 'FR'), 'sport', 'get_category1 leisure=>sports_centre, sport=>swimming for FR should be sport');

SELECT is(get_category2('leisure=>sports_centre, sport=>swimming'::hstore, 'FR'), 'swimming_pool', 'get_category2 leisure=>sports_centre, sport=>swimming for FR should be swimming_pool');

SELECT is(get_category1('leisure=>swimming_pool, access=>yes'::hstore, 'FR'), 'sport', 'get_category1 leisure=>swimming_pool, access=>yes for FR should be sport');

SELECT is(get_category2('leisure=>swimming_pool, access=>yes'::hstore, 'FR'), 'swimming_pool', 'get_category2 leisure=>swimming_pool, access=>yes for FR should be swimming_pool');

SELECT is(get_category1('leisure=>swimming_pool, access=>public'::hstore, 'FR'), 'sport', 'get_category1 leisure=>swimming_pool, access=>public for FR should be sport');

SELECT is(get_category2('leisure=>swimming_pool, access=>public'::hstore, 'FR'), 'swimming_pool', 'get_category2 leisure=>swimming_pool, access=>public for FR should be swimming_pool');

SELECT is(get_category1('amenity=>swimming_pool'::hstore, 'FR'), 'sport', 'get_category1 amenity=>swimming_pool for FR should be sport');

SELECT is(get_category2('amenity=>swimming_pool'::hstore, 'FR'), 'swimming_pool', 'get_category2 amenity=>swimming_pool for FR should be swimming_pool');

SELECT is(get_category1('club=>sport, sport:for=>disabled'::hstore, 'FR'), 'sport', 'get_category1 club=>sport, sport:for=>disabled for FR should be sport');

SELECT is(get_category2('club=>sport, sport:for=>disabled'::hstore, 'FR'), 'club', 'get_category2 club=>sport, sport:for=>disabled for FR should be club');

SELECT is(get_category1('shop=>frozen_food'::hstore, 'FR'), 'shop', 'get_category1 shop=>frozen_food for FR should be shop');

SELECT is(get_category2('shop=>frozen_food'::hstore, 'FR'), 'food', 'get_category2 shop=>frozen_food for FR should be food');

SELECT is(get_category1('shop=>supermarket'::hstore, 'FR'), 'shop', 'get_category1 shop=>supermarket for FR should be shop');

SELECT is(get_category2('shop=>supermarket'::hstore, 'FR'), 'food', 'get_category2 shop=>supermarket for FR should be food');

SELECT is(get_category1('shop=>butcher'::hstore, 'FR'), 'shop', 'get_category1 shop=>butcher for FR should be shop');

SELECT is(get_category2('shop=>butcher'::hstore, 'FR'), 'food', 'get_category2 shop=>butcher for FR should be food');

SELECT is(get_category1('shop=>cheese'::hstore, 'FR'), 'shop', 'get_category1 shop=>cheese for FR should be shop');

SELECT is(get_category2('shop=>cheese'::hstore, 'FR'), 'food', 'get_category2 shop=>cheese for FR should be food');

SELECT is(get_category1('shop=>convenience'::hstore, 'FR'), 'shop', 'get_category1 shop=>convenience for FR should be shop');

SELECT is(get_category2('shop=>convenience'::hstore, 'FR'), 'food', 'get_category2 shop=>convenience for FR should be food');

SELECT is(get_category1('shop=>general'::hstore, 'FR'), 'shop', 'get_category1 shop=>general for FR should be shop');

SELECT is(get_category2('shop=>general'::hstore, 'FR'), 'food', 'get_category2 shop=>general for FR should be food');

SELECT is(get_category1('shop=>seafood'::hstore, 'FR'), 'shop', 'get_category1 shop=>seafood for FR should be shop');

SELECT is(get_category2('shop=>seafood'::hstore, 'FR'), 'food', 'get_category2 shop=>seafood for FR should be food');

SELECT is(get_category1('shop=>greengrocer'::hstore, 'FR'), 'shop', 'get_category1 shop=>greengrocer for FR should be shop');

SELECT is(get_category2('shop=>greengrocer'::hstore, 'FR'), 'food', 'get_category2 shop=>greengrocer for FR should be food');

SELECT is(get_category1('shop=>deli'::hstore, 'FR'), 'shop', 'get_category1 shop=>deli for FR should be shop');

SELECT is(get_category2('shop=>deli'::hstore, 'FR'), 'food', 'get_category2 shop=>deli for FR should be food');

SELECT is(get_category1('shop=>spices'::hstore, 'FR'), 'shop', 'get_category1 shop=>spices for FR should be shop');

SELECT is(get_category2('shop=>spices'::hstore, 'FR'), 'food', 'get_category2 shop=>spices for FR should be food');

SELECT is(get_category1('shop=>honey'::hstore, 'FR'), 'shop', 'get_category1 shop=>honey for FR should be shop');

SELECT is(get_category2('shop=>honey'::hstore, 'FR'), 'food', 'get_category2 shop=>honey for FR should be food');

SELECT is(get_category1('shop=>pasta'::hstore, 'FR'), 'shop', 'get_category1 shop=>pasta for FR should be shop');

SELECT is(get_category2('shop=>pasta'::hstore, 'FR'), 'food', 'get_category2 shop=>pasta for FR should be food');

SELECT is(get_category1('shop=>cannery'::hstore, 'FR'), 'shop', 'get_category1 shop=>cannery for FR should be shop');

SELECT is(get_category2('shop=>cannery'::hstore, 'FR'), 'food', 'get_category2 shop=>cannery for FR should be food');

SELECT is(get_category1('shop=>tea'::hstore, 'FR'), 'shop', 'get_category1 shop=>tea for FR should be shop');

SELECT is(get_category2('shop=>tea'::hstore, 'FR'), 'food', 'get_category2 shop=>tea for FR should be food');

SELECT is(get_category1('shop=>coffee'::hstore, 'FR'), 'shop', 'get_category1 shop=>coffee for FR should be shop');

SELECT is(get_category2('shop=>coffee'::hstore, 'FR'), 'food', 'get_category2 shop=>coffee for FR should be food');

SELECT is(get_category1('shop=>health_food'::hstore, 'FR'), 'shop', 'get_category1 shop=>health_food for FR should be shop');

SELECT is(get_category2('shop=>health_food'::hstore, 'FR'), 'food', 'get_category2 shop=>health_food for FR should be food');

SELECT is(get_category1('shop=>dairy'::hstore, 'FR'), 'shop', 'get_category1 shop=>dairy for FR should be shop');

SELECT is(get_category2('shop=>dairy'::hstore, 'FR'), 'food', 'get_category2 shop=>dairy for FR should be food');

SELECT is(get_category1('shop=>confectionery'::hstore, 'FR'), 'shop', 'get_category1 shop=>confectionery for FR should be shop');

SELECT is(get_category2('shop=>confectionery'::hstore, 'FR'), 'food', 'get_category2 shop=>confectionery for FR should be food');

SELECT is(get_category1('shop=>chocolate'::hstore, 'FR'), 'shop', 'get_category1 shop=>chocolate for FR should be shop');

SELECT is(get_category2('shop=>chocolate'::hstore, 'FR'), 'food', 'get_category2 shop=>chocolate for FR should be food');

SELECT is(get_category1('shop=>farm'::hstore, 'FR'), 'shop', 'get_category1 shop=>farm for FR should be shop');

SELECT is(get_category2('shop=>farm'::hstore, 'FR'), 'food', 'get_category2 shop=>farm for FR should be food');

SELECT is(get_category1('shop=>bakery'::hstore, 'FR'), 'shop', 'get_category1 shop=>bakery for FR should be shop');

SELECT is(get_category2('shop=>bakery'::hstore, 'FR'), 'food', 'get_category2 shop=>bakery for FR should be food');

SELECT is(get_category1('shop=>pastry'::hstore, 'FR'), 'shop', 'get_category1 shop=>pastry for FR should be shop');

SELECT is(get_category2('shop=>pastry'::hstore, 'FR'), 'food', 'get_category2 shop=>pastry for FR should be food');

SELECT is(get_category1('shop=>alcohol'::hstore, 'FR'), 'shop', 'get_category1 shop=>alcohol for FR should be shop');

SELECT is(get_category2('shop=>alcohol'::hstore, 'FR'), 'food', 'get_category2 shop=>alcohol for FR should be food');

SELECT is(get_category1('shop=>beverages'::hstore, 'FR'), 'shop', 'get_category1 shop=>beverages for FR should be shop');

SELECT is(get_category2('shop=>beverages'::hstore, 'FR'), 'food', 'get_category2 shop=>beverages for FR should be food');

SELECT is(get_category1('shop=>wine'::hstore, 'FR'), 'shop', 'get_category1 shop=>wine for FR should be shop');

SELECT is(get_category2('shop=>wine'::hstore, 'FR'), 'food', 'get_category2 shop=>wine for FR should be food');

SELECT is(get_category1('shop=>winery'::hstore, 'FR'), 'shop', 'get_category1 shop=>winery for FR should be shop');

SELECT is(get_category2('shop=>winery'::hstore, 'FR'), 'food', 'get_category2 shop=>winery for FR should be food');

SELECT is(get_category1('amenity=>marketplace'::hstore, 'FR'), 'shop', 'get_category1 amenity=>marketplace for FR should be shop');

SELECT is(get_category2('amenity=>marketplace'::hstore, 'FR'), 'marketplace', 'get_category2 amenity=>marketplace for FR should be marketplace');

SELECT is(get_category1('shop=>boutique'::hstore, 'FR'), 'shop', 'get_category1 shop=>boutique for FR should be shop');

SELECT is(get_category2('shop=>boutique'::hstore, 'FR'), 'clothes', 'get_category2 shop=>boutique for FR should be clothes');

SELECT is(get_category1('shop=>clothes'::hstore, 'FR'), 'shop', 'get_category1 shop=>clothes for FR should be shop');

SELECT is(get_category2('shop=>clothes'::hstore, 'FR'), 'clothes', 'get_category2 shop=>clothes for FR should be clothes');

SELECT is(get_category1('shop=>fashion'::hstore, 'FR'), 'shop', 'get_category1 shop=>fashion for FR should be shop');

SELECT is(get_category2('shop=>fashion'::hstore, 'FR'), 'clothes', 'get_category2 shop=>fashion for FR should be clothes');

SELECT is(get_category1('shop=>shoes'::hstore, 'FR'), 'shop', 'get_category1 shop=>shoes for FR should be shop');

SELECT is(get_category2('shop=>shoes'::hstore, 'FR'), 'clothes', 'get_category2 shop=>shoes for FR should be clothes');

SELECT is(get_category1('shop=>bag'::hstore, 'FR'), 'shop', 'get_category1 shop=>bag for FR should be shop');

SELECT is(get_category2('shop=>bag'::hstore, 'FR'), 'clothes', 'get_category2 shop=>bag for FR should be clothes');

SELECT is(get_category1('shop=>jewelry'::hstore, 'FR'), 'shop', 'get_category1 shop=>jewelry for FR should be shop');

SELECT is(get_category2('shop=>jewelry'::hstore, 'FR'), 'clothes', 'get_category2 shop=>jewelry for FR should be clothes');

SELECT is(get_category1('shop=>tailor'::hstore, 'FR'), 'shop', 'get_category1 shop=>tailor for FR should be shop');

SELECT is(get_category2('shop=>tailor'::hstore, 'FR'), 'clothes', 'get_category2 shop=>tailor for FR should be clothes');

SELECT is(get_category1('shop=>watches'::hstore, 'FR'), 'shop', 'get_category1 shop=>watches for FR should be shop');

SELECT is(get_category2('shop=>watches'::hstore, 'FR'), 'clothes', 'get_category2 shop=>watches for FR should be clothes');

SELECT is(get_category1('shop=>fishing'::hstore, 'FR'), 'shop', 'get_category1 shop=>fishing for FR should be shop');

SELECT is(get_category2('shop=>fishing'::hstore, 'FR'), 'sports', 'get_category2 shop=>fishing for FR should be sports');

SELECT is(get_category1('shop=>hunting'::hstore, 'FR'), 'shop', 'get_category1 shop=>hunting for FR should be shop');

SELECT is(get_category2('shop=>hunting'::hstore, 'FR'), 'sports', 'get_category2 shop=>hunting for FR should be sports');

SELECT is(get_category1('shop=>sports'::hstore, 'FR'), 'shop', 'get_category1 shop=>sports for FR should be shop');

SELECT is(get_category2('shop=>sports'::hstore, 'FR'), 'sports', 'get_category2 shop=>sports for FR should be sports');

SELECT is(get_category1('shop=>outdoor'::hstore, 'FR'), 'shop', 'get_category1 shop=>outdoor for FR should be shop');

SELECT is(get_category2('shop=>outdoor'::hstore, 'FR'), 'sports', 'get_category2 shop=>outdoor for FR should be sports');

SELECT is(get_category1('shop=>beauty'::hstore, 'FR'), 'shop', 'get_category1 shop=>beauty for FR should be shop');

SELECT is(get_category2('shop=>beauty'::hstore, 'FR'), 'beauty', 'get_category2 shop=>beauty for FR should be beauty');

SELECT is(get_category1('shop=>cosmetics'::hstore, 'FR'), 'shop', 'get_category1 shop=>cosmetics for FR should be shop');

SELECT is(get_category2('shop=>cosmetics'::hstore, 'FR'), 'beauty', 'get_category2 shop=>cosmetics for FR should be beauty');

SELECT is(get_category1('shop=>hairdresser'::hstore, 'FR'), 'shop', 'get_category1 shop=>hairdresser for FR should be shop');

SELECT is(get_category2('shop=>hairdresser'::hstore, 'FR'), 'beauty', 'get_category2 shop=>hairdresser for FR should be beauty');

SELECT is(get_category1('shop=>massage'::hstore, 'FR'), 'shop', 'get_category1 shop=>massage for FR should be shop');

SELECT is(get_category2('shop=>massage'::hstore, 'FR'), 'beauty', 'get_category2 shop=>massage for FR should be beauty');

SELECT is(get_category1('shop=>perfumery'::hstore, 'FR'), 'shop', 'get_category1 shop=>perfumery for FR should be shop');

SELECT is(get_category2('shop=>perfumery'::hstore, 'FR'), 'beauty', 'get_category2 shop=>perfumery for FR should be beauty');

SELECT is(get_category1('shop=>chemist'::hstore, 'FR'), 'shop', 'get_category1 shop=>chemist for FR should be shop');

SELECT is(get_category2('shop=>chemist'::hstore, 'FR'), 'beauty', 'get_category2 shop=>chemist for FR should be beauty');

SELECT is(get_category1('shop=>tattoo'::hstore, 'FR'), 'shop', 'get_category1 shop=>tattoo for FR should be shop');

SELECT is(get_category2('shop=>tattoo'::hstore, 'FR'), 'beauty', 'get_category2 shop=>tattoo for FR should be beauty');

SELECT is(get_category1('office=>company, name=>Electricité de Tahiti'::hstore, 'FR'), 'shop', 'get_category1 office=>company, name=>Electricité de Tahiti for FR should be shop');

SELECT is(get_category2('office=>company, name=>Electricité de Tahiti'::hstore, 'FR'), 'edt', 'get_category2 office=>company, name=>Electricité de Tahiti for FR should be edt');

SELECT is(get_category1('office=>company, name=>EDT'::hstore, 'FR'), 'shop', 'get_category1 office=>company, name=>EDT for FR should be shop');

SELECT is(get_category2('office=>company, name=>EDT'::hstore, 'FR'), 'edt', 'get_category2 office=>company, name=>EDT for FR should be edt');

SELECT is(get_category1('office=>company, name=>Électricité de Tahiti'::hstore, 'FR'), 'shop', 'get_category1 office=>company, name=>Électricité de Tahiti for FR should be shop');

SELECT is(get_category2('office=>company, name=>Électricité de Tahiti'::hstore, 'FR'), 'edt', 'get_category2 office=>company, name=>Électricité de Tahiti for FR should be edt');

SELECT is(get_category1('office=>company, short_name=>EDT'::hstore, 'FR'), 'shop', 'get_category1 office=>company, short_name=>EDT for FR should be shop');

SELECT is(get_category2('office=>company, short_name=>EDT'::hstore, 'FR'), 'edt', 'get_category2 office=>company, short_name=>EDT for FR should be edt');

SELECT is(get_category1('shop=>fabric'::hstore, 'FR'), 'shop', 'get_category1 shop=>fabric for FR should be shop');

SELECT is(get_category2('shop=>fabric'::hstore, 'FR'), 'art', 'get_category2 shop=>fabric for FR should be art');

SELECT is(get_category1('shop=>sewing'::hstore, 'FR'), 'shop', 'get_category1 shop=>sewing for FR should be shop');

SELECT is(get_category2('shop=>sewing'::hstore, 'FR'), 'art', 'get_category2 shop=>sewing for FR should be art');

SELECT is(get_category1('shop=>haberdashery'::hstore, 'FR'), 'shop', 'get_category1 shop=>haberdashery for FR should be shop');

SELECT is(get_category2('shop=>haberdashery'::hstore, 'FR'), 'art', 'get_category2 shop=>haberdashery for FR should be art');

SELECT is(get_category1('shop=>wool'::hstore, 'FR'), 'shop', 'get_category1 shop=>wool for FR should be shop');

SELECT is(get_category2('shop=>wool'::hstore, 'FR'), 'art', 'get_category2 shop=>wool for FR should be art');

SELECT is(get_category1('shop=>art'::hstore, 'FR'), 'shop', 'get_category1 shop=>art for FR should be shop');

SELECT is(get_category2('shop=>art'::hstore, 'FR'), 'art', 'get_category2 shop=>art for FR should be art');

SELECT is(get_category1('shop=>music'::hstore, 'FR'), 'shop', 'get_category1 shop=>music for FR should be shop');

SELECT is(get_category2('shop=>music'::hstore, 'FR'), 'art', 'get_category2 shop=>music for FR should be art');

SELECT is(get_category1('shop=>musical_instrument'::hstore, 'FR'), 'shop', 'get_category1 shop=>musical_instrument for FR should be shop');

SELECT is(get_category2('shop=>musical_instrument'::hstore, 'FR'), 'art', 'get_category2 shop=>musical_instrument for FR should be art');

SELECT is(get_category1('shop=>photo'::hstore, 'FR'), 'shop', 'get_category1 shop=>photo for FR should be shop');

SELECT is(get_category2('shop=>photo'::hstore, 'FR'), 'art', 'get_category2 shop=>photo for FR should be art');

SELECT is(get_category1('shop=>craft'::hstore, 'FR'), 'shop', 'get_category1 shop=>craft for FR should be shop');

SELECT is(get_category2('shop=>craft'::hstore, 'FR'), 'art', 'get_category2 shop=>craft for FR should be art');

SELECT is(get_category1('shop=>camera'::hstore, 'FR'), 'shop', 'get_category1 shop=>camera for FR should be shop');

SELECT is(get_category2('shop=>camera'::hstore, 'FR'), 'art', 'get_category2 shop=>camera for FR should be art');

SELECT is(get_category1('shop=>video'::hstore, 'FR'), 'shop', 'get_category1 shop=>video for FR should be shop');

SELECT is(get_category2('shop=>video'::hstore, 'FR'), 'art', 'get_category2 shop=>video for FR should be art');

SELECT is(get_category1('shop=>video_games'::hstore, 'FR'), 'shop', 'get_category1 shop=>video_games for FR should be shop');

SELECT is(get_category2('shop=>video_games'::hstore, 'FR'), 'art', 'get_category2 shop=>video_games for FR should be art');

SELECT is(get_category1('craft=>sewing'::hstore, 'FR'), 'shop', 'get_category1 craft=>sewing for FR should be shop');

SELECT is(get_category2('craft=>sewing'::hstore, 'FR'), 'art', 'get_category2 craft=>sewing for FR should be art');

SELECT is(get_category1('craft=>*'::hstore, 'FR'), 'shop', 'get_category1 craft=>* for FR should be shop');

SELECT is(get_category2('craft=>*'::hstore, 'FR'), 'craft', 'get_category2 craft=>* for FR should be craft');

SELECT is(get_category1('shop=>stationery'::hstore, 'FR'), 'shop', 'get_category1 shop=>stationery for FR should be shop');

SELECT is(get_category2('shop=>stationery'::hstore, 'FR'), 'office_supply', 'get_category2 shop=>stationery for FR should be office_supply');

SELECT is(get_category1('shop=>printer_ink'::hstore, 'FR'), 'shop', 'get_category1 shop=>printer_ink for FR should be shop');

SELECT is(get_category2('shop=>printer_ink'::hstore, 'FR'), 'office_supply', 'get_category2 shop=>printer_ink for FR should be office_supply');

SELECT is(get_category1('shop=>books'::hstore, 'FR'), 'shop', 'get_category1 shop=>books for FR should be shop');

SELECT is(get_category2('shop=>books'::hstore, 'FR'), 'office_supply', 'get_category2 shop=>books for FR should be office_supply');

SELECT is(get_category1('shop=>kiosk'::hstore, 'FR'), 'shop', 'get_category1 shop=>kiosk for FR should be shop');

SELECT is(get_category2('shop=>kiosk'::hstore, 'FR'), 'office_supply', 'get_category2 shop=>kiosk for FR should be office_supply');

SELECT is(get_category1('shop=>newsagent'::hstore, 'FR'), 'shop', 'get_category1 shop=>newsagent for FR should be shop');

SELECT is(get_category2('shop=>newsagent'::hstore, 'FR'), 'office_supply', 'get_category2 shop=>newsagent for FR should be office_supply');

SELECT is(get_category1('shop=>medical_supply'::hstore, 'FR'), 'shop', 'get_category1 shop=>medical_supply for FR should be shop');

SELECT is(get_category2('shop=>medical_supply'::hstore, 'FR'), 'medical_supply', 'get_category2 shop=>medical_supply for FR should be medical_supply');

SELECT is(get_category1('shop=>optician'::hstore, 'FR'), 'shop', 'get_category1 shop=>optician for FR should be shop');

SELECT is(get_category2('shop=>optician'::hstore, 'FR'), 'optician', 'get_category2 shop=>optician for FR should be optician');

SELECT is(get_category1('craft=>optician'::hstore, 'FR'), 'shop', 'get_category1 craft=>optician for FR should be shop');

SELECT is(get_category2('craft=>optician'::hstore, 'FR'), 'optician', 'get_category2 craft=>optician for FR should be optician');

SELECT is(get_category1('shop=>hearing_aids'::hstore, 'FR'), 'shop', 'get_category1 shop=>hearing_aids for FR should be shop');

SELECT is(get_category2('shop=>hearing_aids'::hstore, 'FR'), 'hearing_aids', 'get_category2 shop=>hearing_aids for FR should be hearing_aids');

SELECT is(get_category1('shop=>variety_store'::hstore, 'FR'), 'shop', 'get_category1 shop=>variety_store for FR should be shop');

SELECT is(get_category2('shop=>variety_store'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>variety_store for FR should be shop_others');

SELECT is(get_category1('shop=>department_store'::hstore, 'FR'), 'shop', 'get_category1 shop=>department_store for FR should be shop');

SELECT is(get_category2('shop=>department_store'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>department_store for FR should be shop_others');

SELECT is(get_category1('shop=>wholesale'::hstore, 'FR'), 'shop', 'get_category1 shop=>wholesale for FR should be shop');

SELECT is(get_category2('shop=>wholesale'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>wholesale for FR should be shop_others');

SELECT is(get_category1('shop=>second_hand'::hstore, 'FR'), 'shop', 'get_category1 shop=>second_hand for FR should be shop');

SELECT is(get_category2('shop=>second_hand'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>second_hand for FR should be shop_others');

SELECT is(get_category1('shop=>charity'::hstore, 'FR'), 'shop', 'get_category1 shop=>charity for FR should be shop');

SELECT is(get_category2('shop=>charity'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>charity for FR should be shop_others');

SELECT is(get_category1('shop=>bathroom_furnishing'::hstore, 'FR'), 'shop', 'get_category1 shop=>bathroom_furnishing for FR should be shop');

SELECT is(get_category2('shop=>bathroom_furnishing'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>bathroom_furnishing for FR should be shop_others');

SELECT is(get_category1('shop=>carpet'::hstore, 'FR'), 'shop', 'get_category1 shop=>carpet for FR should be shop');

SELECT is(get_category2('shop=>carpet'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>carpet for FR should be shop_others');

SELECT is(get_category1('shop=>curtain'::hstore, 'FR'), 'shop', 'get_category1 shop=>curtain for FR should be shop');

SELECT is(get_category2('shop=>curtain'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>curtain for FR should be shop_others');

SELECT is(get_category1('shop=>furniture'::hstore, 'FR'), 'shop', 'get_category1 shop=>furniture for FR should be shop');

SELECT is(get_category2('shop=>furniture'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>furniture for FR should be shop_others');

SELECT is(get_category1('shop=>kitchen'::hstore, 'FR'), 'shop', 'get_category1 shop=>kitchen for FR should be shop');

SELECT is(get_category2('shop=>kitchen'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>kitchen for FR should be shop_others');

SELECT is(get_category1('shop=>houseware'::hstore, 'FR'), 'shop', 'get_category1 shop=>houseware for FR should be shop');

SELECT is(get_category2('shop=>houseware'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>houseware for FR should be shop_others');

SELECT is(get_category1('shop=>interior_decoration'::hstore, 'FR'), 'shop', 'get_category1 shop=>interior_decoration for FR should be shop');

SELECT is(get_category2('shop=>interior_decoration'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>interior_decoration for FR should be shop_others');

SELECT is(get_category1('shop=>pottery'::hstore, 'FR'), 'shop', 'get_category1 shop=>pottery for FR should be shop');

SELECT is(get_category2('shop=>pottery'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>pottery for FR should be shop_others');

SELECT is(get_category1('shop=>lighting'::hstore, 'FR'), 'shop', 'get_category1 shop=>lighting for FR should be shop');

SELECT is(get_category2('shop=>lighting'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>lighting for FR should be shop_others');

SELECT is(get_category1('shop=>bed'::hstore, 'FR'), 'shop', 'get_category1 shop=>bed for FR should be shop');

SELECT is(get_category2('shop=>bed'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>bed for FR should be shop_others');

SELECT is(get_category1('shop=>doityourself'::hstore, 'FR'), 'shop', 'get_category1 shop=>doityourself for FR should be shop');

SELECT is(get_category2('shop=>doityourself'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>doityourself for FR should be shop_others');

SELECT is(get_category1('shop=>electrical'::hstore, 'FR'), 'shop', 'get_category1 shop=>electrical for FR should be shop');

SELECT is(get_category2('shop=>electrical'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>electrical for FR should be shop_others');

SELECT is(get_category1('shop=>fireplace'::hstore, 'FR'), 'shop', 'get_category1 shop=>fireplace for FR should be shop');

SELECT is(get_category2('shop=>fireplace'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>fireplace for FR should be shop_others');

SELECT is(get_category1('shop=>glaziery'::hstore, 'FR'), 'shop', 'get_category1 shop=>glaziery for FR should be shop');

SELECT is(get_category2('shop=>glaziery'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>glaziery for FR should be shop_others');

SELECT is(get_category1('shop=>hardware'::hstore, 'FR'), 'shop', 'get_category1 shop=>hardware for FR should be shop');

SELECT is(get_category2('shop=>hardware'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>hardware for FR should be shop_others');

SELECT is(get_category1('shop=>paint'::hstore, 'FR'), 'shop', 'get_category1 shop=>paint for FR should be shop');

SELECT is(get_category2('shop=>paint'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>paint for FR should be shop_others');

SELECT is(get_category1('shop=>tiles'::hstore, 'FR'), 'shop', 'get_category1 shop=>tiles for FR should be shop');

SELECT is(get_category2('shop=>tiles'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>tiles for FR should be shop_others');

SELECT is(get_category1('shop=>obile_phone'::hstore, 'FR'), 'shop', 'get_category1 shop=>obile_phone for FR should be shop');

SELECT is(get_category2('shop=>obile_phone'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>obile_phone for FR should be shop_others');

SELECT is(get_category1('shop=>computer'::hstore, 'FR'), 'shop', 'get_category1 shop=>computer for FR should be shop');

SELECT is(get_category2('shop=>computer'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>computer for FR should be shop_others');

SELECT is(get_category1('shop=>electronics'::hstore, 'FR'), 'shop', 'get_category1 shop=>electronics for FR should be shop');

SELECT is(get_category2('shop=>electronics'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>electronics for FR should be shop_others');

SELECT is(get_category1('shop=>appliance'::hstore, 'FR'), 'shop', 'get_category1 shop=>appliance for FR should be shop');

SELECT is(get_category2('shop=>appliance'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>appliance for FR should be shop_others');

SELECT is(get_category1('shop=>hifi'::hstore, 'FR'), 'shop', 'get_category1 shop=>hifi for FR should be shop');

SELECT is(get_category2('shop=>hifi'::hstore, 'FR'), 'shop_others', 'get_category2 shop=>hifi for FR should be shop_others');

SELECT is(get_category1('craft=>electronics_repair'::hstore, 'FR'), 'shop', 'get_category1 craft=>electronics_repair for FR should be shop');

SELECT is(get_category2('craft=>electronics_repair'::hstore, 'FR'), 'shop_others', 'get_category2 craft=>electronics_repair for FR should be shop_others');

SELECT is(get_category1('amenity=>vending_machine, vending=>condoms'::hstore, 'FR'), 'shop', 'get_category1 amenity=>vending_machine, vending=>condoms for FR should be shop');

SELECT is(get_category2('amenity=>vending_machine, vending=>condoms'::hstore, 'FR'), 'shop_others', 'get_category2 amenity=>vending_machine, vending=>condoms for FR should be shop_others');

SELECT is(get_category1('amenity=>childcare'::hstore, 'FR'), 'education', 'get_category1 amenity=>childcare for FR should be education');

SELECT is(get_category2('amenity=>childcare'::hstore, 'FR'), 'childcare', 'get_category2 amenity=>childcare for FR should be childcare');

SELECT is(get_category1('amenity=>kindergarten'::hstore, 'FR'), 'education', 'get_category1 amenity=>kindergarten for FR should be education');

SELECT is(get_category2('amenity=>kindergarten'::hstore, 'FR'), 'kindergarten', 'get_category2 amenity=>kindergarten for FR should be kindergarten');

SELECT is(get_category1('amenity=>school, school:FR=>élémentaire'::hstore, 'FR'), 'education', 'get_category1 amenity=>school, school:FR=>élémentaire for FR should be education');

SELECT is(get_category2('amenity=>school, school:FR=>élémentaire'::hstore, 'FR'), 'elementary', 'get_category2 amenity=>school, school:FR=>élémentaire for FR should be elementary');

SELECT is(get_category1('amenity=>school, school:FR=>maternelle'::hstore, 'FR'), 'education', 'get_category1 amenity=>school, school:FR=>maternelle for FR should be education');

SELECT is(get_category2('amenity=>school, school:FR=>maternelle'::hstore, 'FR'), 'elementary', 'get_category2 amenity=>school, school:FR=>maternelle for FR should be elementary');

SELECT is(get_category1('amenity=>school, school:FR=>primaire'::hstore, 'FR'), 'education', 'get_category1 amenity=>school, school:FR=>primaire for FR should be education');

SELECT is(get_category2('amenity=>school, school:FR=>primaire'::hstore, 'FR'), 'elementary', 'get_category2 amenity=>school, school:FR=>primaire for FR should be elementary');

SELECT is(get_category1('amenity=>school, school:FR=>collège'::hstore, 'FR'), 'education', 'get_category1 amenity=>school, school:FR=>collège for FR should be education');

SELECT is(get_category2('amenity=>school, school:FR=>collège'::hstore, 'FR'), 'college', 'get_category2 amenity=>school, school:FR=>collège for FR should be college');

SELECT is(get_category1('amenity=>school, school:FR=>lycée'::hstore, 'FR'), 'education', 'get_category1 amenity=>school, school:FR=>lycée for FR should be education');

SELECT is(get_category2('amenity=>school, school:FR=>lycée'::hstore, 'FR'), 'lycee', 'get_category2 amenity=>school, school:FR=>lycée for FR should be lycee');

SELECT is(get_category1('amenity=>university'::hstore, 'FR'), 'education', 'get_category1 amenity=>university for FR should be education');

SELECT is(get_category2('amenity=>university'::hstore, 'FR'), 'university', 'get_category2 amenity=>university for FR should be university');

SELECT is(get_category1('amenity=>college'::hstore, 'FR'), 'education', 'get_category1 amenity=>college for FR should be education');

SELECT is(get_category2('amenity=>college'::hstore, 'FR'), 'college_sup', 'get_category2 amenity=>college for FR should be college_sup');

SELECT is(get_category1('healthcare=>centre'::hstore, 'FR'), 'health', 'get_category1 healthcare=>centre for FR should be health');

SELECT is(get_category2('healthcare=>centre'::hstore, 'FR'), 'centre', 'get_category2 healthcare=>centre for FR should be centre');

SELECT is(get_category1('healthcare=>rehabilitation'::hstore, 'FR'), 'health', 'get_category1 healthcare=>rehabilitation for FR should be health');

SELECT is(get_category2('healthcare=>rehabilitation'::hstore, 'FR'), 'centre', 'get_category2 healthcare=>rehabilitation for FR should be centre');

SELECT is(get_category1('healthcare=>audiologist'::hstore, 'FR'), 'health', 'get_category1 healthcare=>audiologist for FR should be health');

SELECT is(get_category2('healthcare=>audiologist'::hstore, 'FR'), 'centre', 'get_category2 healthcare=>audiologist for FR should be centre');

SELECT is(get_category1('healthcare=>dentist'::hstore, 'FR'), 'health', 'get_category1 healthcare=>dentist for FR should be health');

SELECT is(get_category2('healthcare=>dentist'::hstore, 'FR'), 'centre', 'get_category2 healthcare=>dentist for FR should be centre');

SELECT is(get_category1('healthcare=>midwife'::hstore, 'FR'), 'health', 'get_category1 healthcare=>midwife for FR should be health');

SELECT is(get_category2('healthcare=>midwife'::hstore, 'FR'), 'centre', 'get_category2 healthcare=>midwife for FR should be centre');

SELECT is(get_category1('healthcare=>nurse'::hstore, 'FR'), 'health', 'get_category1 healthcare=>nurse for FR should be health');

SELECT is(get_category2('healthcare=>nurse'::hstore, 'FR'), 'centre', 'get_category2 healthcare=>nurse for FR should be centre');

SELECT is(get_category1('healthcare=>podiatrist'::hstore, 'FR'), 'health', 'get_category1 healthcare=>podiatrist for FR should be health');

SELECT is(get_category2('healthcare=>podiatrist'::hstore, 'FR'), 'centre', 'get_category2 healthcare=>podiatrist for FR should be centre');

SELECT is(get_category1('healthcare=>psychotherapist'::hstore, 'FR'), 'health', 'get_category1 healthcare=>psychotherapist for FR should be health');

SELECT is(get_category2('healthcare=>psychotherapist'::hstore, 'FR'), 'centre', 'get_category2 healthcare=>psychotherapist for FR should be centre');

SELECT is(get_category1('healthcare=>speech_therapist'::hstore, 'FR'), 'health', 'get_category1 healthcare=>speech_therapist for FR should be health');

SELECT is(get_category2('healthcare=>speech_therapist'::hstore, 'FR'), 'centre', 'get_category2 healthcare=>speech_therapist for FR should be centre');

SELECT is(get_category1('amenity=>doctors'::hstore, 'FR'), 'health', 'get_category1 amenity=>doctors for FR should be health');

SELECT is(get_category2('amenity=>doctors'::hstore, 'FR'), 'centre', 'get_category2 amenity=>doctors for FR should be centre');

SELECT is(get_category1('healthcare=>clinic'::hstore, 'FR'), 'health', 'get_category1 healthcare=>clinic for FR should be health');

SELECT is(get_category2('healthcare=>clinic'::hstore, 'FR'), 'clinic', 'get_category2 healthcare=>clinic for FR should be clinic');

SELECT is(get_category1('amenity=>clinic'::hstore, 'FR'), 'health', 'get_category1 amenity=>clinic for FR should be health');

SELECT is(get_category2('amenity=>clinic'::hstore, 'FR'), 'clinic', 'get_category2 amenity=>clinic for FR should be clinic');

SELECT is(get_category1('healthcare=>hospital'::hstore, 'FR'), 'health', 'get_category1 healthcare=>hospital for FR should be health');

SELECT is(get_category2('healthcare=>hospital'::hstore, 'FR'), 'hospital', 'get_category2 healthcare=>hospital for FR should be hospital');

SELECT is(get_category1('amenity=>hospital'::hstore, 'FR'), 'health', 'get_category1 amenity=>hospital for FR should be health');

SELECT is(get_category2('amenity=>hospital'::hstore, 'FR'), 'hospital', 'get_category2 amenity=>hospital for FR should be hospital');

SELECT is(get_category1('amenity=>pharmacy'::hstore, 'FR'), 'health', 'get_category1 amenity=>pharmacy for FR should be health');

SELECT is(get_category2('amenity=>pharmacy'::hstore, 'FR'), 'pharmacy', 'get_category2 amenity=>pharmacy for FR should be pharmacy');

SELECT is(get_category1('healthcare=>doctor'::hstore, 'FR'), 'health', 'get_category1 healthcare=>doctor for FR should be health');

SELECT is(get_category2('healthcare=>doctor'::hstore, 'FR'), 'doctor', 'get_category2 healthcare=>doctor for FR should be doctor');

SELECT is(get_category1('healthcare=>occupational_therapist'::hstore, 'FR'), 'health', 'get_category1 healthcare=>occupational_therapist for FR should be health');

SELECT is(get_category2('healthcare=>occupational_therapist'::hstore, 'FR'), 'occupational_therapist', 'get_category2 healthcare=>occupational_therapist for FR should be occupational_therapist');

SELECT is(get_category1('healthcare=>physiotherapist'::hstore, 'FR'), 'health', 'get_category1 healthcare=>physiotherapist for FR should be health');

SELECT is(get_category2('healthcare=>physiotherapist'::hstore, 'FR'), 'physiotherapist', 'get_category2 healthcare=>physiotherapist for FR should be physiotherapist');

SELECT is(get_category1('amenity=>parking_space, parking_space=>disabled'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>parking_space, parking_space=>disabled for FR should be mobility');

SELECT is(get_category2('amenity=>parking_space, parking_space=>disabled'::hstore, 'FR'), 'parking_pmr', 'get_category2 amenity=>parking_space, parking_space=>disabled for FR should be parking_pmr');

SELECT is(get_category1('amenity=>parking_space, wheelchair=>yes'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>parking_space, wheelchair=>yes for FR should be mobility');

SELECT is(get_category2('amenity=>parking_space, wheelchair=>yes'::hstore, 'FR'), 'parking_pmr', 'get_category2 amenity=>parking_space, wheelchair=>yes for FR should be parking_pmr');

SELECT is(get_category1('amenity=>parking_space, wheelchair=>designated'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>parking_space, wheelchair=>designated for FR should be mobility');

SELECT is(get_category2('amenity=>parking_space, wheelchair=>designated'::hstore, 'FR'), 'parking_pmr', 'get_category2 amenity=>parking_space, wheelchair=>designated for FR should be parking_pmr');

SELECT is(get_category1('amenity=>parking_space, capacity:disabled=>*'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>parking_space, capacity:disabled=>* for FR should be mobility');

SELECT is(get_category2('amenity=>parking_space, capacity:disabled=>*'::hstore, 'FR'), 'parking_pmr', 'get_category2 amenity=>parking_space, capacity:disabled=>* for FR should be parking_pmr');

SELECT is(get_category1('amenity=>parking'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>parking for FR should be mobility');

SELECT is(get_category2('amenity=>parking'::hstore, 'FR'), 'parking', 'get_category2 amenity=>parking for FR should be parking');

SELECT is(get_category1('highway=>bus_stop'::hstore, 'FR'), 'mobility', 'get_category1 highway=>bus_stop for FR should be mobility');

SELECT is(get_category2('highway=>bus_stop'::hstore, 'FR'), 'bus_stop', 'get_category2 highway=>bus_stop for FR should be bus_stop');

SELECT is(get_category1('amenity=>bus_station'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>bus_station for FR should be mobility');

SELECT is(get_category2('amenity=>bus_station'::hstore, 'FR'), 'bus_stop', 'get_category2 amenity=>bus_station for FR should be bus_stop');

SELECT is(get_category1('public_transport=>stop_position, bus=>yes'::hstore, 'FR'), 'mobility', 'get_category1 public_transport=>stop_position, bus=>yes for FR should be mobility');

SELECT is(get_category2('public_transport=>stop_position, bus=>yes'::hstore, 'FR'), 'bus_stop', 'get_category2 public_transport=>stop_position, bus=>yes for FR should be bus_stop');

SELECT is(get_category1('public_transport=>platform, bus=>yes'::hstore, 'FR'), 'mobility', 'get_category1 public_transport=>platform, bus=>yes for FR should be mobility');

SELECT is(get_category2('public_transport=>platform, bus=>yes'::hstore, 'FR'), 'bus_stop', 'get_category2 public_transport=>platform, bus=>yes for FR should be bus_stop');

SELECT is(get_category1('obstacle:wheelchair=>yes, amenity=>parking, informal=>yes'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, amenity=>parking, informal=>yes for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, amenity=>parking, informal=>yes'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, amenity=>parking, informal=>yes for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, construction=>yes'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, construction=>yes for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, construction=>yes'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, construction=>yes for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, power=>pole'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, power=>pole for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, power=>pole'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, power=>pole for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, highway=>street_lamp'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, highway=>street_lamp for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, highway=>street_lamp'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, highway=>street_lamp for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, highway=>traffic_signals'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, highway=>traffic_signals for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, highway=>traffic_signals'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, highway=>traffic_signals for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, barrier=>bollard'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, barrier=>bollard for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, barrier=>bollard'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, barrier=>bollard for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, barrier=>cycle_barrier'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, barrier=>cycle_barrier for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, barrier=>cycle_barrier'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, barrier=>cycle_barrier for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, barrier=>block'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, barrier=>block for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, barrier=>block'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, barrier=>block for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, traffic_sign=>*'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, traffic_sign=>* for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, traffic_sign=>*'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, traffic_sign=>* for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, tourism=>information'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, tourism=>information for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, tourism=>information'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, tourism=>information for FR should be barrier');

SELECT is(get_category1('obstacle:wheelchair=>yes, natural=>tree'::hstore, 'FR'), 'mobility', 'get_category1 obstacle:wheelchair=>yes, natural=>tree for FR should be mobility');

SELECT is(get_category2('obstacle:wheelchair=>yes, natural=>tree'::hstore, 'FR'), 'barrier', 'get_category2 obstacle:wheelchair=>yes, natural=>tree for FR should be barrier');

SELECT is(get_category1('barrier=>kerb, kerb=>raised'::hstore, 'FR'), 'mobility', 'get_category1 barrier=>kerb, kerb=>raised for FR should be mobility');

SELECT is(get_category2('barrier=>kerb, kerb=>raised'::hstore, 'FR'), 'barrier', 'get_category2 barrier=>kerb, kerb=>raised for FR should be barrier');

SELECT is(get_category1('highway=>*, smoothness=>bad'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, smoothness=>bad for FR should be mobility');

SELECT is(get_category2('highway=>*, smoothness=>bad'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, smoothness=>bad for FR should be barrier');

SELECT is(get_category1('highway=>*, smoothness=>very_bad'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, smoothness=>very_bad for FR should be mobility');

SELECT is(get_category2('highway=>*, smoothness=>very_bad'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, smoothness=>very_bad for FR should be barrier');

SELECT is(get_category1('highway=>*, smoothness=>horrible'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, smoothness=>horrible for FR should be mobility');

SELECT is(get_category2('highway=>*, smoothness=>horrible'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, smoothness=>horrible for FR should be barrier');

SELECT is(get_category1('highway=>*, smoothness=>very_horrible'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, smoothness=>very_horrible for FR should be mobility');

SELECT is(get_category2('highway=>*, smoothness=>very_horrible'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, smoothness=>very_horrible for FR should be barrier');

SELECT is(get_category1('highway=>*, smoothness=>impassable'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, smoothness=>impassable for FR should be mobility');

SELECT is(get_category2('highway=>*, smoothness=>impassable'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, smoothness=>impassable for FR should be barrier');

SELECT is(get_category1('highway=>*, surface=>metal'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, surface=>metal for FR should be mobility');

SELECT is(get_category2('highway=>*, surface=>metal'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, surface=>metal for FR should be barrier');

SELECT is(get_category1('highway=>*, surface=>wood'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, surface=>wood for FR should be mobility');

SELECT is(get_category2('highway=>*, surface=>wood'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, surface=>wood for FR should be barrier');

SELECT is(get_category1('highway=>*, surface=>compacted'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, surface=>compacted for FR should be mobility');

SELECT is(get_category2('highway=>*, surface=>compacted'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, surface=>compacted for FR should be barrier');

SELECT is(get_category1('highway=>*, surface=>fine_gravel'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, surface=>fine_gravel for FR should be mobility');

SELECT is(get_category2('highway=>*, surface=>fine_gravel'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, surface=>fine_gravel for FR should be barrier');

SELECT is(get_category1('highway=>*, surface=>unhewn_cobblestone'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, surface=>unhewn_cobblestone for FR should be mobility');

SELECT is(get_category2('highway=>*, surface=>unhewn_cobblestone'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, surface=>unhewn_cobblestone for FR should be barrier');

SELECT is(get_category1('highway=>*, surface=>sand'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, surface=>sand for FR should be mobility');

SELECT is(get_category2('highway=>*, surface=>sand'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, surface=>sand for FR should be barrier');

SELECT is(get_category1('highway=>*, surface=>ground'::hstore, 'FR'), 'mobility', 'get_category1 highway=>*, surface=>ground for FR should be mobility');

SELECT is(get_category2('highway=>*, surface=>ground'::hstore, 'FR'), 'barrier', 'get_category2 highway=>*, surface=>ground for FR should be barrier');

SELECT is(get_category1('highway=>elevator'::hstore, 'FR'), 'mobility', 'get_category1 highway=>elevator for FR should be mobility');

SELECT is(get_category2('highway=>elevator'::hstore, 'FR'), 'elevator', 'get_category2 highway=>elevator for FR should be elevator');

SELECT is(get_category1('room=>elevator'::hstore, 'FR'), 'mobility', 'get_category1 room=>elevator for FR should be mobility');

SELECT is(get_category2('room=>elevator'::hstore, 'FR'), 'elevator', 'get_category2 room=>elevator for FR should be elevator');

SELECT is(get_category1('building:part=>elevator'::hstore, 'FR'), 'mobility', 'get_category1 building:part=>elevator for FR should be mobility');

SELECT is(get_category2('building:part=>elevator'::hstore, 'FR'), 'elevator', 'get_category2 building:part=>elevator for FR should be elevator');

SELECT is(get_category1('buildingpart:verticalpassage=>elevator'::hstore, 'FR'), 'mobility', 'get_category1 buildingpart:verticalpassage=>elevator for FR should be mobility');

SELECT is(get_category2('buildingpart:verticalpassage=>elevator'::hstore, 'FR'), 'elevator', 'get_category2 buildingpart:verticalpassage=>elevator for FR should be elevator');

SELECT is(get_category1('building=>elevator'::hstore, 'FR'), 'mobility', 'get_category1 building=>elevator for FR should be mobility');

SELECT is(get_category2('building=>elevator'::hstore, 'FR'), 'elevator', 'get_category2 building=>elevator for FR should be elevator');

SELECT is(get_category1('indoor=>elevator'::hstore, 'FR'), 'mobility', 'get_category1 indoor=>elevator for FR should be mobility');

SELECT is(get_category2('indoor=>elevator'::hstore, 'FR'), 'elevator', 'get_category2 indoor=>elevator for FR should be elevator');

SELECT is(get_category1('amenity=>taxi'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>taxi for FR should be mobility');

SELECT is(get_category2('amenity=>taxi'::hstore, 'FR'), 'taxi', 'get_category2 amenity=>taxi for FR should be taxi');

SELECT is(get_category1('amenity=>fuel'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>fuel for FR should be mobility');

SELECT is(get_category2('amenity=>fuel'::hstore, 'FR'), 'fuel', 'get_category2 amenity=>fuel for FR should be fuel');

SELECT is(get_category1('shop=>gas'::hstore, 'FR'), 'mobility', 'get_category1 shop=>gas for FR should be mobility');

SELECT is(get_category2('shop=>gas'::hstore, 'FR'), 'fuel', 'get_category2 shop=>gas for FR should be fuel');

SELECT is(get_category1('amenity=>car_rental'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>car_rental for FR should be mobility');

SELECT is(get_category2('amenity=>car_rental'::hstore, 'FR'), 'car_rental', 'get_category2 amenity=>car_rental for FR should be car_rental');

SELECT is(get_category1('amenity=>ferry_terminal'::hstore, 'FR'), 'mobility', 'get_category1 amenity=>ferry_terminal for FR should be mobility');

SELECT is(get_category2('amenity=>ferry_terminal'::hstore, 'FR'), 'ferry', 'get_category2 amenity=>ferry_terminal for FR should be ferry');

SELECT is(get_category1('aeroway=>aerodrome'::hstore, 'FR'), 'mobility', 'get_category1 aeroway=>aerodrome for FR should be mobility');

SELECT is(get_category2('aeroway=>aerodrome'::hstore, 'FR'), 'airport', 'get_category2 aeroway=>aerodrome for FR should be airport');

SELECT is(get_category1('tourism=>guest_house'::hstore, 'FR'), 'housing', 'get_category1 tourism=>guest_house for FR should be housing');

SELECT is(get_category2('tourism=>guest_house'::hstore, 'FR'), 'guest_house', 'get_category2 tourism=>guest_house for FR should be guest_house');

SELECT is(get_category1('tourism=>hotel'::hstore, 'FR'), 'housing', 'get_category1 tourism=>hotel for FR should be housing');

SELECT is(get_category2('tourism=>hotel'::hstore, 'FR'), 'hotel', 'get_category2 tourism=>hotel for FR should be hotel');

SELECT is(get_category1('tourism=>hostel'::hstore, 'FR'), 'housing', 'get_category1 tourism=>hostel for FR should be housing');

SELECT is(get_category2('tourism=>hostel'::hstore, 'FR'), 'hostel', 'get_category2 tourism=>hostel for FR should be hostel');

SELECT is(get_category1('tourism=>camp_site'::hstore, 'FR'), 'housing', 'get_category1 tourism=>camp_site for FR should be housing');

SELECT is(get_category2('tourism=>camp_site'::hstore, 'FR'), 'camping', 'get_category2 tourism=>camp_site for FR should be camping');

SELECT is(get_category1('amenity=>drinking_water'::hstore, 'FR'), 'tourism_outside', 'get_category1 amenity=>drinking_water for FR should be tourism_outside');

SELECT is(get_category2('amenity=>drinking_water'::hstore, 'FR'), 'drinking_water', 'get_category2 amenity=>drinking_water for FR should be drinking_water');

SELECT is(get_category1('amenity=>toilets'::hstore, 'FR'), 'tourism_outside', 'get_category1 amenity=>toilets for FR should be tourism_outside');

SELECT is(get_category2('amenity=>toilets'::hstore, 'FR'), 'toilets', 'get_category2 amenity=>toilets for FR should be toilets');

SELECT is(get_category1('amenity=>bench'::hstore, 'FR'), 'tourism_outside', 'get_category1 amenity=>bench for FR should be tourism_outside');

SELECT is(get_category2('amenity=>bench'::hstore, 'FR'), 'bench', 'get_category2 amenity=>bench for FR should be bench');

SELECT is(get_category1('amenity=>shower'::hstore, 'FR'), 'tourism_outside', 'get_category1 amenity=>shower for FR should be tourism_outside');

SELECT is(get_category2('amenity=>shower'::hstore, 'FR'), 'shower', 'get_category2 amenity=>shower for FR should be shower');

SELECT is(get_category1('leisure=>beach_resort'::hstore, 'FR'), 'tourism_outside', 'get_category1 leisure=>beach_resort for FR should be tourism_outside');

SELECT is(get_category2('leisure=>beach_resort'::hstore, 'FR'), 'beach_resort', 'get_category2 leisure=>beach_resort for FR should be beach_resort');

SELECT is(get_category1('natural=>beach'::hstore, 'FR'), 'tourism_outside', 'get_category1 natural=>beach for FR should be tourism_outside');

SELECT is(get_category2('natural=>beach'::hstore, 'FR'), 'beach_resort', 'get_category2 natural=>beach for FR should be beach_resort');

SELECT is(get_category1('leisure=>park'::hstore, 'FR'), 'tourism_outside', 'get_category1 leisure=>park for FR should be tourism_outside');

SELECT is(get_category2('leisure=>park'::hstore, 'FR'), 'park', 'get_category2 leisure=>park for FR should be park');

SELECT is(get_category1('tourism=>viewpoint'::hstore, 'FR'), 'tourism_outside', 'get_category1 tourism=>viewpoint for FR should be tourism_outside');

SELECT is(get_category2('tourism=>viewpoint'::hstore, 'FR'), 'viewpoint', 'get_category2 tourism=>viewpoint for FR should be viewpoint');

SELECT is(get_category1('waterway=>waterfall'::hstore, 'FR'), 'tourism_outside', 'get_category1 waterway=>waterfall for FR should be tourism_outside');

SELECT is(get_category2('waterway=>waterfall'::hstore, 'FR'), 'waterfall', 'get_category2 waterway=>waterfall for FR should be waterfall');

SELECT is(get_category1('tourism=>artwork'::hstore, 'FR'), 'tourism_outside', 'get_category1 tourism=>artwork for FR should be tourism_outside');

SELECT is(get_category2('tourism=>artwork'::hstore, 'FR'), 'artwork', 'get_category2 tourism=>artwork for FR should be artwork');

SELECT is(get_category1('historic=>*'::hstore, 'FR'), 'tourism_outside', 'get_category1 historic=>* for FR should be tourism_outside');

SELECT is(get_category2('historic=>*'::hstore, 'FR'), 'historic', 'get_category2 historic=>* for FR should be historic');

SELECT * FROM finish();
ROLLBACK;
