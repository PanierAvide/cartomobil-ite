
-- AUTOMATICALLY GENERATED SCRIPT
-- DO NOT EDIT DIRECTLY, EDIT INSTEAD "/categories.json"
-- THEN RUN "yarn run categories" TO UPDATE

BEGIN;
SELECT plan(906);

SELECT is(get_category('amenity=>police'::hstore, 'FR'), 'amenity', 'get_category amenity=>police for FR should be amenity');

SELECT is(get_subcategory('amenity=>police'::hstore, 'FR'), 'police', 'get_subcategory amenity=>police for FR should be police');

SELECT is(get_category('amenity=>townhall'::hstore, 'FR'), 'amenity', 'get_category amenity=>townhall for FR should be amenity');

SELECT is(get_subcategory('amenity=>townhall'::hstore, 'FR'), 'townhall', 'get_subcategory amenity=>townhall for FR should be townhall');

SELECT is(get_category('amenity=>post_office'::hstore, 'FR'), 'amenity', 'get_category amenity=>post_office for FR should be amenity');

SELECT is(get_subcategory('amenity=>post_office'::hstore, 'FR'), 'post_office', 'get_subcategory amenity=>post_office for FR should be post_office');

SELECT is(get_category('amenity=>vending_machine, vending=>stamps'::hstore, 'FR'), 'amenity', 'get_category amenity=>vending_machine, vending=>stamps for FR should be amenity');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>stamps'::hstore, 'FR'), 'post_office', 'get_subcategory amenity=>vending_machine, vending=>stamps for FR should be post_office');

SELECT is(get_category('amenity=>vending_machine, vending=>parcel_mail_in'::hstore, 'FR'), 'amenity', 'get_category amenity=>vending_machine, vending=>parcel_mail_in for FR should be amenity');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>parcel_mail_in'::hstore, 'FR'), 'post_office', 'get_subcategory amenity=>vending_machine, vending=>parcel_mail_in for FR should be post_office');

SELECT is(get_category('amenity=>vending_machine, vending=>parcel_pickup'::hstore, 'FR'), 'amenity', 'get_category amenity=>vending_machine, vending=>parcel_pickup for FR should be amenity');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>parcel_pickup'::hstore, 'FR'), 'post_office', 'get_subcategory amenity=>vending_machine, vending=>parcel_pickup for FR should be post_office');

SELECT is(get_category('amenity=>vending_machine, vending=>parcel_pickup;parcel_mail_in'::hstore, 'FR'), 'amenity', 'get_category amenity=>vending_machine, vending=>parcel_pickup;parcel_mail_in for FR should be amenity');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>parcel_pickup;parcel_mail_in'::hstore, 'FR'), 'post_office', 'get_subcategory amenity=>vending_machine, vending=>parcel_pickup;parcel_mail_in for FR should be post_office');

SELECT is(get_category('amenity=>childcare'::hstore, 'FR'), 'amenity', 'get_category amenity=>childcare for FR should be amenity');

SELECT is(get_subcategory('amenity=>childcare'::hstore, 'FR'), 'childcare', 'get_subcategory amenity=>childcare for FR should be childcare');

SELECT is(get_category('amenity=>kindergarten, kindergarten:FR=>*'::hstore, 'FR'), 'amenity', 'get_category amenity=>kindergarten, kindergarten:FR=>* for FR should be amenity');

SELECT is(get_subcategory('amenity=>kindergarten, kindergarten:FR=>*'::hstore, 'FR'), 'childcare', 'get_subcategory amenity=>kindergarten, kindergarten:FR=>* for FR should be childcare');

SELECT is(get_category('office=>employment_agency'::hstore, 'FR'), 'amenity', 'get_category office=>employment_agency for FR should be amenity');

SELECT is(get_subcategory('office=>employment_agency'::hstore, 'FR'), 'employment_agency', 'get_subcategory office=>employment_agency for FR should be employment_agency');

SELECT is(get_category('shop=>funeral_directors'::hstore, 'FR'), 'amenity', 'get_category shop=>funeral_directors for FR should be amenity');

SELECT is(get_subcategory('shop=>funeral_directors'::hstore, 'FR'), 'funeral_directors', 'get_subcategory shop=>funeral_directors for FR should be funeral_directors');

SELECT is(get_category('amenity=>bank'::hstore, 'FR'), 'amenity', 'get_category amenity=>bank for FR should be amenity');

SELECT is(get_subcategory('amenity=>bank'::hstore, 'FR'), 'money', 'get_subcategory amenity=>bank for FR should be money');

SELECT is(get_category('amenity=>atm'::hstore, 'FR'), 'amenity', 'get_category amenity=>atm for FR should be amenity');

SELECT is(get_subcategory('amenity=>atm'::hstore, 'FR'), 'money', 'get_subcategory amenity=>atm for FR should be money');

SELECT is(get_category('amenity=>money_transfer'::hstore, 'FR'), 'amenity', 'get_category amenity=>money_transfer for FR should be amenity');

SELECT is(get_subcategory('amenity=>money_transfer'::hstore, 'FR'), 'money', 'get_subcategory amenity=>money_transfer for FR should be money');

SELECT is(get_category('amenity=>mobile_money_agent'::hstore, 'FR'), 'amenity', 'get_category amenity=>mobile_money_agent for FR should be amenity');

SELECT is(get_subcategory('amenity=>mobile_money_agent'::hstore, 'FR'), 'money', 'get_subcategory amenity=>mobile_money_agent for FR should be money');

SELECT is(get_category('shop=>money_lender'::hstore, 'FR'), 'amenity', 'get_category shop=>money_lender for FR should be amenity');

SELECT is(get_subcategory('shop=>money_lender'::hstore, 'FR'), 'money', 'get_subcategory shop=>money_lender for FR should be money');

SELECT is(get_category('office=>insurance'::hstore, 'FR'), 'amenity', 'get_category office=>insurance for FR should be amenity');

SELECT is(get_subcategory('office=>insurance'::hstore, 'FR'), 'insurance', 'get_subcategory office=>insurance for FR should be insurance');

SELECT is(get_category('shop=>insurance'::hstore, 'FR'), 'amenity', 'get_category shop=>insurance for FR should be amenity');

SELECT is(get_subcategory('shop=>insurance'::hstore, 'FR'), 'insurance', 'get_subcategory shop=>insurance for FR should be insurance');

SELECT is(get_category('opening_hours:covid19=>*, tourism=>information, information=>office'::hstore, 'FR'), 'amenity', 'get_category opening_hours:covid19=>*, tourism=>information, information=>office for FR should be amenity');

SELECT is(get_subcategory('opening_hours:covid19=>*, tourism=>information, information=>office'::hstore, 'FR'), 'tourism_info', 'get_subcategory opening_hours:covid19=>*, tourism=>information, information=>office for FR should be tourism_info');

SELECT is(get_category('tourism=>hotel'::hstore, 'FR'), 'amenity', 'get_category tourism=>hotel for FR should be amenity');

SELECT is(get_subcategory('tourism=>hotel'::hstore, 'FR'), 'hotel', 'get_subcategory tourism=>hotel for FR should be hotel');

SELECT is(get_category('tourism=>hotel'::hstore, 'AT'), 'amenity', 'get_category tourism=>hotel for AT should be amenity');

SELECT is(get_subcategory('tourism=>hotel'::hstore, 'AT'), 'hotel', 'get_subcategory tourism=>hotel for AT should be hotel');

SELECT is(get_category('tourism=>hotel'::hstore, 'DE'), 'amenity', 'get_category tourism=>hotel for DE should be amenity');

SELECT is(get_subcategory('tourism=>hotel'::hstore, 'DE'), 'hotel', 'get_subcategory tourism=>hotel for DE should be hotel');

SELECT is(get_category('tourism=>hotel'::hstore, 'CH'), 'amenity', 'get_category tourism=>hotel for CH should be amenity');

SELECT is(get_subcategory('tourism=>hotel'::hstore, 'CH'), 'hotel', 'get_subcategory tourism=>hotel for CH should be hotel');

SELECT is(get_category('tourism=>hotel'::hstore, 'IT'), 'amenity', 'get_category tourism=>hotel for IT should be amenity');

SELECT is(get_subcategory('tourism=>hotel'::hstore, 'IT'), 'hotel', 'get_subcategory tourism=>hotel for IT should be hotel');

SELECT is(get_category('tourism=>motel'::hstore, 'FR'), 'amenity', 'get_category tourism=>motel for FR should be amenity');

SELECT is(get_subcategory('tourism=>motel'::hstore, 'FR'), 'hotel', 'get_subcategory tourism=>motel for FR should be hotel');

SELECT is(get_category('tourism=>motel'::hstore, 'AT'), 'amenity', 'get_category tourism=>motel for AT should be amenity');

SELECT is(get_subcategory('tourism=>motel'::hstore, 'AT'), 'hotel', 'get_subcategory tourism=>motel for AT should be hotel');

SELECT is(get_category('tourism=>motel'::hstore, 'DE'), 'amenity', 'get_category tourism=>motel for DE should be amenity');

SELECT is(get_subcategory('tourism=>motel'::hstore, 'DE'), 'hotel', 'get_subcategory tourism=>motel for DE should be hotel');

SELECT is(get_category('tourism=>motel'::hstore, 'CH'), 'amenity', 'get_category tourism=>motel for CH should be amenity');

SELECT is(get_subcategory('tourism=>motel'::hstore, 'CH'), 'hotel', 'get_subcategory tourism=>motel for CH should be hotel');

SELECT is(get_category('tourism=>motel'::hstore, 'IT'), 'amenity', 'get_category tourism=>motel for IT should be amenity');

SELECT is(get_subcategory('tourism=>motel'::hstore, 'IT'), 'hotel', 'get_subcategory tourism=>motel for IT should be hotel');

SELECT is(get_category('tourism=>hostel'::hstore, 'FR'), 'amenity', 'get_category tourism=>hostel for FR should be amenity');

SELECT is(get_subcategory('tourism=>hostel'::hstore, 'FR'), 'hotel', 'get_subcategory tourism=>hostel for FR should be hotel');

SELECT is(get_category('tourism=>hostel'::hstore, 'AT'), 'amenity', 'get_category tourism=>hostel for AT should be amenity');

SELECT is(get_subcategory('tourism=>hostel'::hstore, 'AT'), 'hotel', 'get_subcategory tourism=>hostel for AT should be hotel');

SELECT is(get_category('tourism=>hostel'::hstore, 'DE'), 'amenity', 'get_category tourism=>hostel for DE should be amenity');

SELECT is(get_subcategory('tourism=>hostel'::hstore, 'DE'), 'hotel', 'get_subcategory tourism=>hostel for DE should be hotel');

SELECT is(get_category('tourism=>hostel'::hstore, 'CH'), 'amenity', 'get_category tourism=>hostel for CH should be amenity');

SELECT is(get_subcategory('tourism=>hostel'::hstore, 'CH'), 'hotel', 'get_subcategory tourism=>hostel for CH should be hotel');

SELECT is(get_category('tourism=>hostel'::hstore, 'IT'), 'amenity', 'get_category tourism=>hostel for IT should be amenity');

SELECT is(get_subcategory('tourism=>hostel'::hstore, 'IT'), 'hotel', 'get_subcategory tourism=>hostel for IT should be hotel');

SELECT is(get_category('amenity=>recycling, recycling_type=>centre'::hstore, 'AT'), 'amenity', 'get_category amenity=>recycling, recycling_type=>centre for AT should be amenity');

SELECT is(get_subcategory('amenity=>recycling, recycling_type=>centre'::hstore, 'AT'), 'recycling_centre', 'get_subcategory amenity=>recycling, recycling_type=>centre for AT should be recycling_centre');

SELECT is(get_category('amenity=>recycling, recycling_type=>centre'::hstore, 'CH'), 'amenity', 'get_category amenity=>recycling, recycling_type=>centre for CH should be amenity');

SELECT is(get_subcategory('amenity=>recycling, recycling_type=>centre'::hstore, 'CH'), 'recycling_centre', 'get_subcategory amenity=>recycling, recycling_type=>centre for CH should be recycling_centre');

SELECT is(get_category('amenity=>recycling, recycling_type=>centre'::hstore, 'DE'), 'amenity', 'get_category amenity=>recycling, recycling_type=>centre for DE should be amenity');

SELECT is(get_subcategory('amenity=>recycling, recycling_type=>centre'::hstore, 'DE'), 'recycling_centre', 'get_subcategory amenity=>recycling, recycling_type=>centre for DE should be recycling_centre');

SELECT is(get_category('amenity=>recycling, recycling_type=>centre'::hstore, 'FR'), 'amenity', 'get_category amenity=>recycling, recycling_type=>centre for FR should be amenity');

SELECT is(get_subcategory('amenity=>recycling, recycling_type=>centre'::hstore, 'FR'), 'recycling_centre', 'get_subcategory amenity=>recycling, recycling_type=>centre for FR should be recycling_centre');

SELECT is(get_category('amenity=>recycling, recycling_type=>centre'::hstore, 'IT'), 'amenity', 'get_category amenity=>recycling, recycling_type=>centre for IT should be amenity');

SELECT is(get_subcategory('amenity=>recycling, recycling_type=>centre'::hstore, 'IT'), 'recycling_centre', 'get_subcategory amenity=>recycling, recycling_type=>centre for IT should be recycling_centre');

SELECT is(get_category('amenity=>library'::hstore, 'AT'), 'amenity', 'get_category amenity=>library for AT should be amenity');

SELECT is(get_subcategory('amenity=>library'::hstore, 'AT'), 'library', 'get_subcategory amenity=>library for AT should be library');

SELECT is(get_category('amenity=>library'::hstore, 'CH'), 'amenity', 'get_category amenity=>library for CH should be amenity');

SELECT is(get_subcategory('amenity=>library'::hstore, 'CH'), 'library', 'get_subcategory amenity=>library for CH should be library');

SELECT is(get_category('amenity=>library'::hstore, 'DE'), 'amenity', 'get_category amenity=>library for DE should be amenity');

SELECT is(get_subcategory('amenity=>library'::hstore, 'DE'), 'library', 'get_subcategory amenity=>library for DE should be library');

SELECT is(get_category('amenity=>library'::hstore, 'FI'), 'amenity', 'get_category amenity=>library for FI should be amenity');

SELECT is(get_subcategory('amenity=>library'::hstore, 'FI'), 'library', 'get_subcategory amenity=>library for FI should be library');

SELECT is(get_category('amenity=>library'::hstore, 'IT'), 'amenity', 'get_category amenity=>library for IT should be amenity');

SELECT is(get_subcategory('amenity=>library'::hstore, 'IT'), 'library', 'get_subcategory amenity=>library for IT should be library');

SELECT is(get_category('amenity=>library'::hstore, 'FR'), 'amenity', 'get_category amenity=>library for FR should be amenity');

SELECT is(get_subcategory('amenity=>library'::hstore, 'FR'), 'library', 'get_subcategory amenity=>library for FR should be library');

SELECT is(get_category('shop=>copyshop'::hstore, 'AT'), 'amenity', 'get_category shop=>copyshop for AT should be amenity');

SELECT is(get_subcategory('shop=>copyshop'::hstore, 'AT'), 'copyshop', 'get_subcategory shop=>copyshop for AT should be copyshop');

SELECT is(get_category('shop=>copyshop'::hstore, 'CH'), 'amenity', 'get_category shop=>copyshop for CH should be amenity');

SELECT is(get_subcategory('shop=>copyshop'::hstore, 'CH'), 'copyshop', 'get_subcategory shop=>copyshop for CH should be copyshop');

SELECT is(get_category('shop=>copyshop'::hstore, 'DE'), 'amenity', 'get_category shop=>copyshop for DE should be amenity');

SELECT is(get_subcategory('shop=>copyshop'::hstore, 'DE'), 'copyshop', 'get_subcategory shop=>copyshop for DE should be copyshop');

SELECT is(get_category('shop=>copyshop'::hstore, 'IT'), 'amenity', 'get_category shop=>copyshop for IT should be amenity');

SELECT is(get_subcategory('shop=>copyshop'::hstore, 'IT'), 'copyshop', 'get_subcategory shop=>copyshop for IT should be copyshop');

SELECT is(get_category('shop=>copyshop'::hstore, 'FR'), 'amenity', 'get_category shop=>copyshop for FR should be amenity');

SELECT is(get_subcategory('shop=>copyshop'::hstore, 'FR'), 'copyshop', 'get_subcategory shop=>copyshop for FR should be copyshop');

SELECT is(get_category('tourism=>museum'::hstore, 'IT'), 'amenity', 'get_category tourism=>museum for IT should be amenity');

SELECT is(get_subcategory('tourism=>museum'::hstore, 'IT'), 'museum', 'get_subcategory tourism=>museum for IT should be museum');

SELECT is(get_category('tourism=>museum'::hstore, 'FR'), 'amenity', 'get_category tourism=>museum for FR should be amenity');

SELECT is(get_subcategory('tourism=>museum'::hstore, 'FR'), 'museum', 'get_subcategory tourism=>museum for FR should be museum');

SELECT is(get_category('historic=>archaeological_site'::hstore, 'IT'), 'amenity', 'get_category historic=>archaeological_site for IT should be amenity');

SELECT is(get_subcategory('historic=>archaeological_site'::hstore, 'IT'), 'museum', 'get_subcategory historic=>archaeological_site for IT should be museum');

SELECT is(get_category('historic=>archaeological_site'::hstore, 'FR'), 'amenity', 'get_category historic=>archaeological_site for FR should be amenity');

SELECT is(get_subcategory('historic=>archaeological_site'::hstore, 'FR'), 'museum', 'get_subcategory historic=>archaeological_site for FR should be museum');

SELECT is(get_category('amenity=>place_of_worship'::hstore, 'IT'), 'amenity', 'get_category amenity=>place_of_worship for IT should be amenity');

SELECT is(get_subcategory('amenity=>place_of_worship'::hstore, 'IT'), 'place_of_worship', 'get_subcategory amenity=>place_of_worship for IT should be place_of_worship');

SELECT is(get_category('leisure=>sports_centre'::hstore, 'IT'), 'amenity', 'get_category leisure=>sports_centre for IT should be amenity');

SELECT is(get_subcategory('leisure=>sports_centre'::hstore, 'IT'), 'sports_centre', 'get_subcategory leisure=>sports_centre for IT should be sports_centre');

SELECT is(get_category('leisure=>beach_resort'::hstore, 'IT'), 'amenity', 'get_category leisure=>beach_resort for IT should be amenity');

SELECT is(get_subcategory('leisure=>beach_resort'::hstore, 'IT'), 'beach_resort', 'get_subcategory leisure=>beach_resort for IT should be beach_resort');

SELECT is(get_category('amenity=>pharmacy'::hstore, 'FR'), 'health', 'get_category amenity=>pharmacy for FR should be health');

SELECT is(get_subcategory('amenity=>pharmacy'::hstore, 'FR'), 'pharmacy', 'get_subcategory amenity=>pharmacy for FR should be pharmacy');

SELECT is(get_category('healthcare=>centre, healthcare:speciality=>covid19'::hstore, 'FR'), 'health', 'get_category healthcare=>centre, healthcare:speciality=>covid19 for FR should be health');

SELECT is(get_subcategory('healthcare=>centre, healthcare:speciality=>covid19'::hstore, 'FR'), 'covid19_centre', 'get_subcategory healthcare=>centre, healthcare:speciality=>covid19 for FR should be covid19_centre');

SELECT is(get_category('shop=>optician'::hstore, 'FR'), 'health', 'get_category shop=>optician for FR should be health');

SELECT is(get_subcategory('shop=>optician'::hstore, 'FR'), 'optician', 'get_subcategory shop=>optician for FR should be optician');

SELECT is(get_category('craft=>optician'::hstore, 'FR'), 'health', 'get_category craft=>optician for FR should be health');

SELECT is(get_subcategory('craft=>optician'::hstore, 'FR'), 'optician', 'get_subcategory craft=>optician for FR should be optician');

SELECT is(get_category('shop=>hearing_aids'::hstore, 'FR'), 'health', 'get_category shop=>hearing_aids for FR should be health');

SELECT is(get_subcategory('shop=>hearing_aids'::hstore, 'FR'), 'hearing_aids', 'get_subcategory shop=>hearing_aids for FR should be hearing_aids');

SELECT is(get_category('amenity=>vending_machine, vending=>condoms'::hstore, 'FR'), 'health', 'get_category amenity=>vending_machine, vending=>condoms for FR should be health');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>condoms'::hstore, 'FR'), 'condoms', 'get_subcategory amenity=>vending_machine, vending=>condoms for FR should be condoms');

SELECT is(get_category('shop=>medical_supply'::hstore, 'FR'), 'health', 'get_category shop=>medical_supply for FR should be health');

SELECT is(get_subcategory('shop=>medical_supply'::hstore, 'FR'), 'medical_supply', 'get_subcategory shop=>medical_supply for FR should be medical_supply');

SELECT is(get_category('opening_hours:covid19=>*, healthcare=>centre'::hstore, 'FR'), 'health', 'get_category opening_hours:covid19=>*, healthcare=>centre for FR should be health');

SELECT is(get_subcategory('opening_hours:covid19=>*, healthcare=>centre'::hstore, 'FR'), 'health_center', 'get_subcategory opening_hours:covid19=>*, healthcare=>centre for FR should be health_center');

SELECT is(get_category('opening_hours:covid19=>*, healthcare=>clinic'::hstore, 'FR'), 'health', 'get_category opening_hours:covid19=>*, healthcare=>clinic for FR should be health');

SELECT is(get_subcategory('opening_hours:covid19=>*, healthcare=>clinic'::hstore, 'FR'), 'health_center', 'get_subcategory opening_hours:covid19=>*, healthcare=>clinic for FR should be health_center');

SELECT is(get_category('opening_hours:covid19=>*, healthcare=>doctor'::hstore, 'FR'), 'health', 'get_category opening_hours:covid19=>*, healthcare=>doctor for FR should be health');

SELECT is(get_subcategory('opening_hours:covid19=>*, healthcare=>doctor'::hstore, 'FR'), 'health_center', 'get_subcategory opening_hours:covid19=>*, healthcare=>doctor for FR should be health_center');

SELECT is(get_category('opening_hours:covid19=>*, healthcare=>hospital'::hstore, 'FR'), 'health', 'get_category opening_hours:covid19=>*, healthcare=>hospital for FR should be health');

SELECT is(get_subcategory('opening_hours:covid19=>*, healthcare=>hospital'::hstore, 'FR'), 'health_center', 'get_subcategory opening_hours:covid19=>*, healthcare=>hospital for FR should be health_center');

SELECT is(get_category('opening_hours:covid19=>*, healthcare=>rehabilitation'::hstore, 'FR'), 'health', 'get_category opening_hours:covid19=>*, healthcare=>rehabilitation for FR should be health');

SELECT is(get_subcategory('opening_hours:covid19=>*, healthcare=>rehabilitation'::hstore, 'FR'), 'health_center', 'get_subcategory opening_hours:covid19=>*, healthcare=>rehabilitation for FR should be health_center');

SELECT is(get_category('opening_hours:covid19=>*, healthcare=>laboratory'::hstore, 'FR'), 'health', 'get_category opening_hours:covid19=>*, healthcare=>laboratory for FR should be health');

SELECT is(get_subcategory('opening_hours:covid19=>*, healthcare=>laboratory'::hstore, 'FR'), 'health_center', 'get_subcategory opening_hours:covid19=>*, healthcare=>laboratory for FR should be health_center');

SELECT is(get_category('opening_hours:covid19=>*, amenity=>hospital'::hstore, 'FR'), 'health', 'get_category opening_hours:covid19=>*, amenity=>hospital for FR should be health');

SELECT is(get_subcategory('opening_hours:covid19=>*, amenity=>hospital'::hstore, 'FR'), 'health_center', 'get_subcategory opening_hours:covid19=>*, amenity=>hospital for FR should be health_center');

SELECT is(get_category('opening_hours:covid19=>*, amenity=>clinic'::hstore, 'FR'), 'health', 'get_category opening_hours:covid19=>*, amenity=>clinic for FR should be health');

SELECT is(get_subcategory('opening_hours:covid19=>*, amenity=>clinic'::hstore, 'FR'), 'health_center', 'get_subcategory opening_hours:covid19=>*, amenity=>clinic for FR should be health_center');

SELECT is(get_category('opening_hours:covid19=>*, amenity=>doctors'::hstore, 'FR'), 'health', 'get_category opening_hours:covid19=>*, amenity=>doctors for FR should be health');

SELECT is(get_subcategory('opening_hours:covid19=>*, amenity=>doctors'::hstore, 'FR'), 'health_center', 'get_subcategory opening_hours:covid19=>*, amenity=>doctors for FR should be health_center');

SELECT is(get_category('shop=>herbalist'::hstore, 'IT'), 'health', 'get_category shop=>herbalist for IT should be health');

SELECT is(get_subcategory('shop=>herbalist'::hstore, 'IT'), 'herbalist', 'get_subcategory shop=>herbalist for IT should be herbalist');

SELECT is(get_category('shop=>frozen_food'::hstore, 'FR'), 'food', 'get_category shop=>frozen_food for FR should be food');

SELECT is(get_subcategory('shop=>frozen_food'::hstore, 'FR'), 'supermarket', 'get_subcategory shop=>frozen_food for FR should be supermarket');

SELECT is(get_category('shop=>supermarket'::hstore, 'FR'), 'food', 'get_category shop=>supermarket for FR should be food');

SELECT is(get_subcategory('shop=>supermarket'::hstore, 'FR'), 'supermarket', 'get_subcategory shop=>supermarket for FR should be supermarket');

SELECT is(get_category('shop=>butcher'::hstore, 'FR'), 'food', 'get_category shop=>butcher for FR should be food');

SELECT is(get_subcategory('shop=>butcher'::hstore, 'FR'), 'butcher', 'get_subcategory shop=>butcher for FR should be butcher');

SELECT is(get_category('shop=>cheese'::hstore, 'FR'), 'food', 'get_category shop=>cheese for FR should be food');

SELECT is(get_subcategory('shop=>cheese'::hstore, 'FR'), 'cheese', 'get_subcategory shop=>cheese for FR should be cheese');

SELECT is(get_category('shop=>convenience'::hstore, 'FR'), 'food', 'get_category shop=>convenience for FR should be food');

SELECT is(get_subcategory('shop=>convenience'::hstore, 'FR'), 'convenience', 'get_subcategory shop=>convenience for FR should be convenience');

SELECT is(get_category('shop=>general'::hstore, 'FR'), 'food', 'get_category shop=>general for FR should be food');

SELECT is(get_subcategory('shop=>general'::hstore, 'FR'), 'convenience', 'get_subcategory shop=>general for FR should be convenience');

SELECT is(get_category('shop=>seafood'::hstore, 'FR'), 'food', 'get_category shop=>seafood for FR should be food');

SELECT is(get_subcategory('shop=>seafood'::hstore, 'FR'), 'seafood', 'get_subcategory shop=>seafood for FR should be seafood');

SELECT is(get_category('shop=>greengrocer'::hstore, 'FR'), 'food', 'get_category shop=>greengrocer for FR should be food');

SELECT is(get_subcategory('shop=>greengrocer'::hstore, 'FR'), 'greengrocer', 'get_subcategory shop=>greengrocer for FR should be greengrocer');

SELECT is(get_category('shop=>deli'::hstore, 'FR'), 'food', 'get_category shop=>deli for FR should be food');

SELECT is(get_subcategory('shop=>deli'::hstore, 'FR'), 'grocery', 'get_subcategory shop=>deli for FR should be grocery');

SELECT is(get_category('shop=>spices'::hstore, 'FR'), 'food', 'get_category shop=>spices for FR should be food');

SELECT is(get_subcategory('shop=>spices'::hstore, 'FR'), 'grocery', 'get_subcategory shop=>spices for FR should be grocery');

SELECT is(get_category('shop=>honey'::hstore, 'FR'), 'food', 'get_category shop=>honey for FR should be food');

SELECT is(get_subcategory('shop=>honey'::hstore, 'FR'), 'grocery', 'get_subcategory shop=>honey for FR should be grocery');

SELECT is(get_category('shop=>pasta'::hstore, 'FR'), 'food', 'get_category shop=>pasta for FR should be food');

SELECT is(get_subcategory('shop=>pasta'::hstore, 'FR'), 'grocery', 'get_subcategory shop=>pasta for FR should be grocery');

SELECT is(get_category('shop=>cannery'::hstore, 'FR'), 'food', 'get_category shop=>cannery for FR should be food');

SELECT is(get_subcategory('shop=>cannery'::hstore, 'FR'), 'grocery', 'get_subcategory shop=>cannery for FR should be grocery');

SELECT is(get_category('shop=>health_food'::hstore, 'FR'), 'food', 'get_category shop=>health_food for FR should be food');

SELECT is(get_subcategory('shop=>health_food'::hstore, 'FR'), 'health_food', 'get_subcategory shop=>health_food for FR should be health_food');

SELECT is(get_category('shop=>chocolate'::hstore, 'FR'), 'food', 'get_category shop=>chocolate for FR should be food');

SELECT is(get_subcategory('shop=>chocolate'::hstore, 'FR'), 'chocolate', 'get_subcategory shop=>chocolate for FR should be chocolate');

SELECT is(get_category('shop=>tea'::hstore, 'FR'), 'food', 'get_category shop=>tea for FR should be food');

SELECT is(get_subcategory('shop=>tea'::hstore, 'FR'), 'tea', 'get_subcategory shop=>tea for FR should be tea');

SELECT is(get_category('shop=>coffee'::hstore, 'FR'), 'food', 'get_category shop=>coffee for FR should be food');

SELECT is(get_subcategory('shop=>coffee'::hstore, 'FR'), 'coffee', 'get_subcategory shop=>coffee for FR should be coffee');

SELECT is(get_category('shop=>dairy'::hstore, 'FR'), 'food', 'get_category shop=>dairy for FR should be food');

SELECT is(get_subcategory('shop=>dairy'::hstore, 'FR'), 'dairy', 'get_subcategory shop=>dairy for FR should be dairy');

SELECT is(get_category('amenity=>vending_machine, vending=>milk'::hstore, 'FR'), 'food', 'get_category amenity=>vending_machine, vending=>milk for FR should be food');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>milk'::hstore, 'FR'), 'dairy', 'get_subcategory amenity=>vending_machine, vending=>milk for FR should be dairy');

SELECT is(get_category('shop=>confectionery'::hstore, 'FR'), 'food', 'get_category shop=>confectionery for FR should be food');

SELECT is(get_subcategory('shop=>confectionery'::hstore, 'FR'), 'confectionery', 'get_subcategory shop=>confectionery for FR should be confectionery');

SELECT is(get_category('shop=>farm'::hstore, 'FR'), 'food', 'get_category shop=>farm for FR should be food');

SELECT is(get_subcategory('shop=>farm'::hstore, 'FR'), 'farm', 'get_subcategory shop=>farm for FR should be farm');

SELECT is(get_category('amenity=>marketplace'::hstore, 'FR'), 'food', 'get_category amenity=>marketplace for FR should be food');

SELECT is(get_subcategory('amenity=>marketplace'::hstore, 'FR'), 'marketplace', 'get_subcategory amenity=>marketplace for FR should be marketplace');

SELECT is(get_category('shop=>bakery'::hstore, 'FR'), 'food', 'get_category shop=>bakery for FR should be food');

SELECT is(get_subcategory('shop=>bakery'::hstore, 'FR'), 'bakery', 'get_subcategory shop=>bakery for FR should be bakery');

SELECT is(get_category('shop=>pastry'::hstore, 'FR'), 'food', 'get_category shop=>pastry for FR should be food');

SELECT is(get_subcategory('shop=>pastry'::hstore, 'FR'), 'bakery', 'get_subcategory shop=>pastry for FR should be bakery');

SELECT is(get_category('amenity=>vending_machine, vending=>bread'::hstore, 'FR'), 'food', 'get_category amenity=>vending_machine, vending=>bread for FR should be food');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>bread'::hstore, 'FR'), 'bakery', 'get_subcategory amenity=>vending_machine, vending=>bread for FR should be bakery');

SELECT is(get_category('shop=>alcohol'::hstore, 'CD'), 'food', 'get_category shop=>alcohol for CD should be food');

SELECT is(get_subcategory('shop=>alcohol'::hstore, 'CD'), 'alcohol', 'get_subcategory shop=>alcohol for CD should be alcohol');

SELECT is(get_category('shop=>beverages'::hstore, 'CD'), 'food', 'get_category shop=>beverages for CD should be food');

SELECT is(get_subcategory('shop=>beverages'::hstore, 'CD'), 'alcohol', 'get_subcategory shop=>beverages for CD should be alcohol');

SELECT is(get_category('shop=>wine'::hstore, 'CD'), 'food', 'get_category shop=>wine for CD should be food');

SELECT is(get_subcategory('shop=>wine'::hstore, 'CD'), 'alcohol', 'get_subcategory shop=>wine for CD should be alcohol');

SELECT is(get_category('shop=>winery'::hstore, 'CD'), 'food', 'get_category shop=>winery for CD should be food');

SELECT is(get_subcategory('shop=>winery'::hstore, 'CD'), 'alcohol', 'get_subcategory shop=>winery for CD should be alcohol');

SELECT is(get_category('amenity=>vending_machine, vending=>pizza'::hstore, 'FR'), 'eat', 'get_category amenity=>vending_machine, vending=>pizza for FR should be eat');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>pizza'::hstore, 'FR'), 'vending_machine', 'get_subcategory amenity=>vending_machine, vending=>pizza for FR should be vending_machine');

SELECT is(get_category('amenity=>vending_machine, vending=>drinks'::hstore, 'FR'), 'eat', 'get_category amenity=>vending_machine, vending=>drinks for FR should be eat');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>drinks'::hstore, 'FR'), 'vending_machine', 'get_subcategory amenity=>vending_machine, vending=>drinks for FR should be vending_machine');

SELECT is(get_category('amenity=>vending_machine, vending=>water'::hstore, 'FR'), 'eat', 'get_category amenity=>vending_machine, vending=>water for FR should be eat');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>water'::hstore, 'FR'), 'vending_machine', 'get_subcategory amenity=>vending_machine, vending=>water for FR should be vending_machine');

SELECT is(get_category('amenity=>vending_machine, vending=>sweets'::hstore, 'FR'), 'eat', 'get_category amenity=>vending_machine, vending=>sweets for FR should be eat');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>sweets'::hstore, 'FR'), 'vending_machine', 'get_subcategory amenity=>vending_machine, vending=>sweets for FR should be vending_machine');

SELECT is(get_category('amenity=>restaurant'::hstore, 'FR'), 'eat', 'get_category amenity=>restaurant for FR should be eat');

SELECT is(get_subcategory('amenity=>restaurant'::hstore, 'FR'), 'restaurant', 'get_subcategory amenity=>restaurant for FR should be restaurant');

SELECT is(get_category('amenity=>fast_food'::hstore, 'FR'), 'eat', 'get_category amenity=>fast_food for FR should be eat');

SELECT is(get_subcategory('amenity=>fast_food'::hstore, 'FR'), 'fast_food', 'get_subcategory amenity=>fast_food for FR should be fast_food');

SELECT is(get_category('amenity=>ice_cream'::hstore, 'DE'), 'eat', 'get_category amenity=>ice_cream for DE should be eat');

SELECT is(get_subcategory('amenity=>ice_cream'::hstore, 'DE'), 'ice_cream', 'get_subcategory amenity=>ice_cream for DE should be ice_cream');

SELECT is(get_category('amenity=>ice_cream'::hstore, 'AT'), 'eat', 'get_category amenity=>ice_cream for AT should be eat');

SELECT is(get_subcategory('amenity=>ice_cream'::hstore, 'AT'), 'ice_cream', 'get_subcategory amenity=>ice_cream for AT should be ice_cream');

SELECT is(get_category('amenity=>ice_cream'::hstore, 'CH'), 'eat', 'get_category amenity=>ice_cream for CH should be eat');

SELECT is(get_subcategory('amenity=>ice_cream'::hstore, 'CH'), 'ice_cream', 'get_subcategory amenity=>ice_cream for CH should be ice_cream');

SELECT is(get_category('amenity=>ice_cream'::hstore, 'IT'), 'eat', 'get_category amenity=>ice_cream for IT should be eat');

SELECT is(get_subcategory('amenity=>ice_cream'::hstore, 'IT'), 'ice_cream', 'get_subcategory amenity=>ice_cream for IT should be ice_cream');

SELECT is(get_category('amenity=>cafe, cuisine=>ice_cream'::hstore, 'DE'), 'eat', 'get_category amenity=>cafe, cuisine=>ice_cream for DE should be eat');

SELECT is(get_subcategory('amenity=>cafe, cuisine=>ice_cream'::hstore, 'DE'), 'ice_cream', 'get_subcategory amenity=>cafe, cuisine=>ice_cream for DE should be ice_cream');

SELECT is(get_category('amenity=>cafe, cuisine=>ice_cream'::hstore, 'AT'), 'eat', 'get_category amenity=>cafe, cuisine=>ice_cream for AT should be eat');

SELECT is(get_subcategory('amenity=>cafe, cuisine=>ice_cream'::hstore, 'AT'), 'ice_cream', 'get_subcategory amenity=>cafe, cuisine=>ice_cream for AT should be ice_cream');

SELECT is(get_category('amenity=>cafe, cuisine=>ice_cream'::hstore, 'CH'), 'eat', 'get_category amenity=>cafe, cuisine=>ice_cream for CH should be eat');

SELECT is(get_subcategory('amenity=>cafe, cuisine=>ice_cream'::hstore, 'CH'), 'ice_cream', 'get_subcategory amenity=>cafe, cuisine=>ice_cream for CH should be ice_cream');

SELECT is(get_category('amenity=>cafe, cuisine=>ice_cream'::hstore, 'IT'), 'eat', 'get_category amenity=>cafe, cuisine=>ice_cream for IT should be eat');

SELECT is(get_subcategory('amenity=>cafe, cuisine=>ice_cream'::hstore, 'IT'), 'ice_cream', 'get_subcategory amenity=>cafe, cuisine=>ice_cream for IT should be ice_cream');

SELECT is(get_category('shop=>ice_cream'::hstore, 'DE'), 'eat', 'get_category shop=>ice_cream for DE should be eat');

SELECT is(get_subcategory('shop=>ice_cream'::hstore, 'DE'), 'ice_cream', 'get_subcategory shop=>ice_cream for DE should be ice_cream');

SELECT is(get_category('shop=>ice_cream'::hstore, 'AT'), 'eat', 'get_category shop=>ice_cream for AT should be eat');

SELECT is(get_subcategory('shop=>ice_cream'::hstore, 'AT'), 'ice_cream', 'get_subcategory shop=>ice_cream for AT should be ice_cream');

SELECT is(get_category('shop=>ice_cream'::hstore, 'CH'), 'eat', 'get_category shop=>ice_cream for CH should be eat');

SELECT is(get_subcategory('shop=>ice_cream'::hstore, 'CH'), 'ice_cream', 'get_subcategory shop=>ice_cream for CH should be ice_cream');

SELECT is(get_category('shop=>ice_cream'::hstore, 'IT'), 'eat', 'get_category shop=>ice_cream for IT should be eat');

SELECT is(get_subcategory('shop=>ice_cream'::hstore, 'IT'), 'ice_cream', 'get_subcategory shop=>ice_cream for IT should be ice_cream');

SELECT is(get_category('opening_hours:covid19=>*, amenity=>cafe'::hstore, 'FR'), 'eat', 'get_category opening_hours:covid19=>*, amenity=>cafe for FR should be eat');

SELECT is(get_subcategory('opening_hours:covid19=>*, amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_subcategory opening_hours:covid19=>*, amenity=>cafe for FR should be cafe');

SELECT is(get_category('opening_hours:covid19=>*, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'eat', 'get_category opening_hours:covid19=>*, amenity=>vending_machine, vending=>coffee for FR should be eat');

SELECT is(get_subcategory('opening_hours:covid19=>*, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'cafe', 'get_subcategory opening_hours:covid19=>*, amenity=>vending_machine, vending=>coffee for FR should be cafe');

SELECT is(get_category('delivery=>yes, amenity=>cafe'::hstore, 'FR'), 'eat', 'get_category delivery=>yes, amenity=>cafe for FR should be eat');

SELECT is(get_subcategory('delivery=>yes, amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_subcategory delivery=>yes, amenity=>cafe for FR should be cafe');

SELECT is(get_category('delivery=>only, amenity=>cafe'::hstore, 'FR'), 'eat', 'get_category delivery=>only, amenity=>cafe for FR should be eat');

SELECT is(get_subcategory('delivery=>only, amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_subcategory delivery=>only, amenity=>cafe for FR should be cafe');

SELECT is(get_category('delivery=>yes, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'eat', 'get_category delivery=>yes, amenity=>vending_machine, vending=>coffee for FR should be eat');

SELECT is(get_subcategory('delivery=>yes, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'cafe', 'get_subcategory delivery=>yes, amenity=>vending_machine, vending=>coffee for FR should be cafe');

SELECT is(get_category('delivery=>only, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'eat', 'get_category delivery=>only, amenity=>vending_machine, vending=>coffee for FR should be eat');

SELECT is(get_subcategory('delivery=>only, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'cafe', 'get_subcategory delivery=>only, amenity=>vending_machine, vending=>coffee for FR should be cafe');

SELECT is(get_category('takeaway=>yes, amenity=>cafe'::hstore, 'FR'), 'eat', 'get_category takeaway=>yes, amenity=>cafe for FR should be eat');

SELECT is(get_subcategory('takeaway=>yes, amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_subcategory takeaway=>yes, amenity=>cafe for FR should be cafe');

SELECT is(get_category('takeaway=>only, amenity=>cafe'::hstore, 'FR'), 'eat', 'get_category takeaway=>only, amenity=>cafe for FR should be eat');

SELECT is(get_subcategory('takeaway=>only, amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_subcategory takeaway=>only, amenity=>cafe for FR should be cafe');

SELECT is(get_category('takeaway=>yes, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'eat', 'get_category takeaway=>yes, amenity=>vending_machine, vending=>coffee for FR should be eat');

SELECT is(get_subcategory('takeaway=>yes, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'cafe', 'get_subcategory takeaway=>yes, amenity=>vending_machine, vending=>coffee for FR should be cafe');

SELECT is(get_category('takeaway=>only, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'eat', 'get_category takeaway=>only, amenity=>vending_machine, vending=>coffee for FR should be eat');

SELECT is(get_subcategory('takeaway=>only, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'cafe', 'get_subcategory takeaway=>only, amenity=>vending_machine, vending=>coffee for FR should be cafe');

SELECT is(get_category('delivery:covid19=>yes, amenity=>cafe'::hstore, 'FR'), 'eat', 'get_category delivery:covid19=>yes, amenity=>cafe for FR should be eat');

SELECT is(get_subcategory('delivery:covid19=>yes, amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_subcategory delivery:covid19=>yes, amenity=>cafe for FR should be cafe');

SELECT is(get_category('delivery:covid19=>only, amenity=>cafe'::hstore, 'FR'), 'eat', 'get_category delivery:covid19=>only, amenity=>cafe for FR should be eat');

SELECT is(get_subcategory('delivery:covid19=>only, amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_subcategory delivery:covid19=>only, amenity=>cafe for FR should be cafe');

SELECT is(get_category('delivery:covid19=>yes, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'eat', 'get_category delivery:covid19=>yes, amenity=>vending_machine, vending=>coffee for FR should be eat');

SELECT is(get_subcategory('delivery:covid19=>yes, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'cafe', 'get_subcategory delivery:covid19=>yes, amenity=>vending_machine, vending=>coffee for FR should be cafe');

SELECT is(get_category('delivery:covid19=>only, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'eat', 'get_category delivery:covid19=>only, amenity=>vending_machine, vending=>coffee for FR should be eat');

SELECT is(get_subcategory('delivery:covid19=>only, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'cafe', 'get_subcategory delivery:covid19=>only, amenity=>vending_machine, vending=>coffee for FR should be cafe');

SELECT is(get_category('takeaway:covid19=>yes, amenity=>cafe'::hstore, 'FR'), 'eat', 'get_category takeaway:covid19=>yes, amenity=>cafe for FR should be eat');

SELECT is(get_subcategory('takeaway:covid19=>yes, amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_subcategory takeaway:covid19=>yes, amenity=>cafe for FR should be cafe');

SELECT is(get_category('takeaway:covid19=>only, amenity=>cafe'::hstore, 'FR'), 'eat', 'get_category takeaway:covid19=>only, amenity=>cafe for FR should be eat');

SELECT is(get_subcategory('takeaway:covid19=>only, amenity=>cafe'::hstore, 'FR'), 'cafe', 'get_subcategory takeaway:covid19=>only, amenity=>cafe for FR should be cafe');

SELECT is(get_category('takeaway:covid19=>yes, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'eat', 'get_category takeaway:covid19=>yes, amenity=>vending_machine, vending=>coffee for FR should be eat');

SELECT is(get_subcategory('takeaway:covid19=>yes, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'cafe', 'get_subcategory takeaway:covid19=>yes, amenity=>vending_machine, vending=>coffee for FR should be cafe');

SELECT is(get_category('takeaway:covid19=>only, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'eat', 'get_category takeaway:covid19=>only, amenity=>vending_machine, vending=>coffee for FR should be eat');

SELECT is(get_subcategory('takeaway:covid19=>only, amenity=>vending_machine, vending=>coffee'::hstore, 'FR'), 'cafe', 'get_subcategory takeaway:covid19=>only, amenity=>vending_machine, vending=>coffee for FR should be cafe');

SELECT is(get_category('opening_hours:covid19=>*, amenity=>bar'::hstore, 'FR'), 'eat', 'get_category opening_hours:covid19=>*, amenity=>bar for FR should be eat');

SELECT is(get_subcategory('opening_hours:covid19=>*, amenity=>bar'::hstore, 'FR'), 'bar', 'get_subcategory opening_hours:covid19=>*, amenity=>bar for FR should be bar');

SELECT is(get_category('opening_hours:covid19=>*, amenity=>pub'::hstore, 'FR'), 'eat', 'get_category opening_hours:covid19=>*, amenity=>pub for FR should be eat');

SELECT is(get_subcategory('opening_hours:covid19=>*, amenity=>pub'::hstore, 'FR'), 'bar', 'get_subcategory opening_hours:covid19=>*, amenity=>pub for FR should be bar');

SELECT is(get_category('delivery=>yes, amenity=>bar'::hstore, 'FR'), 'eat', 'get_category delivery=>yes, amenity=>bar for FR should be eat');

SELECT is(get_subcategory('delivery=>yes, amenity=>bar'::hstore, 'FR'), 'bar', 'get_subcategory delivery=>yes, amenity=>bar for FR should be bar');

SELECT is(get_category('delivery=>only, amenity=>bar'::hstore, 'FR'), 'eat', 'get_category delivery=>only, amenity=>bar for FR should be eat');

SELECT is(get_subcategory('delivery=>only, amenity=>bar'::hstore, 'FR'), 'bar', 'get_subcategory delivery=>only, amenity=>bar for FR should be bar');

SELECT is(get_category('delivery=>yes, amenity=>pub'::hstore, 'FR'), 'eat', 'get_category delivery=>yes, amenity=>pub for FR should be eat');

SELECT is(get_subcategory('delivery=>yes, amenity=>pub'::hstore, 'FR'), 'bar', 'get_subcategory delivery=>yes, amenity=>pub for FR should be bar');

SELECT is(get_category('delivery=>only, amenity=>pub'::hstore, 'FR'), 'eat', 'get_category delivery=>only, amenity=>pub for FR should be eat');

SELECT is(get_subcategory('delivery=>only, amenity=>pub'::hstore, 'FR'), 'bar', 'get_subcategory delivery=>only, amenity=>pub for FR should be bar');

SELECT is(get_category('takeaway=>yes, amenity=>bar'::hstore, 'FR'), 'eat', 'get_category takeaway=>yes, amenity=>bar for FR should be eat');

SELECT is(get_subcategory('takeaway=>yes, amenity=>bar'::hstore, 'FR'), 'bar', 'get_subcategory takeaway=>yes, amenity=>bar for FR should be bar');

SELECT is(get_category('takeaway=>only, amenity=>bar'::hstore, 'FR'), 'eat', 'get_category takeaway=>only, amenity=>bar for FR should be eat');

SELECT is(get_subcategory('takeaway=>only, amenity=>bar'::hstore, 'FR'), 'bar', 'get_subcategory takeaway=>only, amenity=>bar for FR should be bar');

SELECT is(get_category('takeaway=>yes, amenity=>pub'::hstore, 'FR'), 'eat', 'get_category takeaway=>yes, amenity=>pub for FR should be eat');

SELECT is(get_subcategory('takeaway=>yes, amenity=>pub'::hstore, 'FR'), 'bar', 'get_subcategory takeaway=>yes, amenity=>pub for FR should be bar');

SELECT is(get_category('takeaway=>only, amenity=>pub'::hstore, 'FR'), 'eat', 'get_category takeaway=>only, amenity=>pub for FR should be eat');

SELECT is(get_subcategory('takeaway=>only, amenity=>pub'::hstore, 'FR'), 'bar', 'get_subcategory takeaway=>only, amenity=>pub for FR should be bar');

SELECT is(get_category('delivery:covid19=>yes, amenity=>bar'::hstore, 'FR'), 'eat', 'get_category delivery:covid19=>yes, amenity=>bar for FR should be eat');

SELECT is(get_subcategory('delivery:covid19=>yes, amenity=>bar'::hstore, 'FR'), 'bar', 'get_subcategory delivery:covid19=>yes, amenity=>bar for FR should be bar');

SELECT is(get_category('delivery:covid19=>only, amenity=>bar'::hstore, 'FR'), 'eat', 'get_category delivery:covid19=>only, amenity=>bar for FR should be eat');

SELECT is(get_subcategory('delivery:covid19=>only, amenity=>bar'::hstore, 'FR'), 'bar', 'get_subcategory delivery:covid19=>only, amenity=>bar for FR should be bar');

SELECT is(get_category('delivery:covid19=>yes, amenity=>pub'::hstore, 'FR'), 'eat', 'get_category delivery:covid19=>yes, amenity=>pub for FR should be eat');

SELECT is(get_subcategory('delivery:covid19=>yes, amenity=>pub'::hstore, 'FR'), 'bar', 'get_subcategory delivery:covid19=>yes, amenity=>pub for FR should be bar');

SELECT is(get_category('delivery:covid19=>only, amenity=>pub'::hstore, 'FR'), 'eat', 'get_category delivery:covid19=>only, amenity=>pub for FR should be eat');

SELECT is(get_subcategory('delivery:covid19=>only, amenity=>pub'::hstore, 'FR'), 'bar', 'get_subcategory delivery:covid19=>only, amenity=>pub for FR should be bar');

SELECT is(get_category('takeaway:covid19=>yes, amenity=>bar'::hstore, 'FR'), 'eat', 'get_category takeaway:covid19=>yes, amenity=>bar for FR should be eat');

SELECT is(get_subcategory('takeaway:covid19=>yes, amenity=>bar'::hstore, 'FR'), 'bar', 'get_subcategory takeaway:covid19=>yes, amenity=>bar for FR should be bar');

SELECT is(get_category('takeaway:covid19=>only, amenity=>bar'::hstore, 'FR'), 'eat', 'get_category takeaway:covid19=>only, amenity=>bar for FR should be eat');

SELECT is(get_subcategory('takeaway:covid19=>only, amenity=>bar'::hstore, 'FR'), 'bar', 'get_subcategory takeaway:covid19=>only, amenity=>bar for FR should be bar');

SELECT is(get_category('takeaway:covid19=>yes, amenity=>pub'::hstore, 'FR'), 'eat', 'get_category takeaway:covid19=>yes, amenity=>pub for FR should be eat');

SELECT is(get_subcategory('takeaway:covid19=>yes, amenity=>pub'::hstore, 'FR'), 'bar', 'get_subcategory takeaway:covid19=>yes, amenity=>pub for FR should be bar');

SELECT is(get_category('takeaway:covid19=>only, amenity=>pub'::hstore, 'FR'), 'eat', 'get_category takeaway:covid19=>only, amenity=>pub for FR should be eat');

SELECT is(get_subcategory('takeaway:covid19=>only, amenity=>pub'::hstore, 'FR'), 'bar', 'get_subcategory takeaway:covid19=>only, amenity=>pub for FR should be bar');

SELECT is(get_category('shop=>tobacco'::hstore, 'FR'), 'drugs', 'get_category shop=>tobacco for FR should be drugs');

SELECT is(get_subcategory('shop=>tobacco'::hstore, 'FR'), 'tobacco', 'get_subcategory shop=>tobacco for FR should be tobacco');

SELECT is(get_category('shop=>newsagent;tobacco'::hstore, 'FR'), 'drugs', 'get_category shop=>newsagent;tobacco for FR should be drugs');

SELECT is(get_subcategory('shop=>newsagent;tobacco'::hstore, 'FR'), 'tobacco', 'get_subcategory shop=>newsagent;tobacco for FR should be tobacco');

SELECT is(get_category('shop=>tobacco;newsagent'::hstore, 'FR'), 'drugs', 'get_category shop=>tobacco;newsagent for FR should be drugs');

SELECT is(get_subcategory('shop=>tobacco;newsagent'::hstore, 'FR'), 'tobacco', 'get_subcategory shop=>tobacco;newsagent for FR should be tobacco');

SELECT is(get_category('tobacco=>yes'::hstore, 'FR'), 'drugs', 'get_category tobacco=>yes for FR should be drugs');

SELECT is(get_subcategory('tobacco=>yes'::hstore, 'FR'), 'tobacco', 'get_subcategory tobacco=>yes for FR should be tobacco');

SELECT is(get_category('tobacco=>only'::hstore, 'FR'), 'drugs', 'get_category tobacco=>only for FR should be drugs');

SELECT is(get_subcategory('tobacco=>only'::hstore, 'FR'), 'tobacco', 'get_subcategory tobacco=>only for FR should be tobacco');

SELECT is(get_category('amenity=>vending_machine, vending=>cigarettes'::hstore, 'FR'), 'drugs', 'get_category amenity=>vending_machine, vending=>cigarettes for FR should be drugs');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>cigarettes'::hstore, 'FR'), 'tobacco', 'get_subcategory amenity=>vending_machine, vending=>cigarettes for FR should be tobacco');

SELECT is(get_category('shop=>e-cigarette'::hstore, 'FR'), 'drugs', 'get_category shop=>e-cigarette for FR should be drugs');

SELECT is(get_subcategory('shop=>e-cigarette'::hstore, 'FR'), 'e_cigarette', 'get_subcategory shop=>e-cigarette for FR should be e_cigarette');

SELECT is(get_category('amenity=>vending_machine, vending=>e-cigarettes'::hstore, 'FR'), 'drugs', 'get_category amenity=>vending_machine, vending=>e-cigarettes for FR should be drugs');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>e-cigarettes'::hstore, 'FR'), 'e_cigarette', 'get_subcategory amenity=>vending_machine, vending=>e-cigarettes for FR should be e_cigarette');

SELECT is(get_category('shop=>alcohol'::hstore, 'FR'), 'drugs', 'get_category shop=>alcohol for FR should be drugs');

SELECT is(get_subcategory('shop=>alcohol'::hstore, 'FR'), 'alcohol', 'get_subcategory shop=>alcohol for FR should be alcohol');

SELECT is(get_category('shop=>beverages'::hstore, 'FR'), 'drugs', 'get_category shop=>beverages for FR should be drugs');

SELECT is(get_subcategory('shop=>beverages'::hstore, 'FR'), 'alcohol', 'get_subcategory shop=>beverages for FR should be alcohol');

SELECT is(get_category('shop=>wine'::hstore, 'FR'), 'drugs', 'get_category shop=>wine for FR should be drugs');

SELECT is(get_subcategory('shop=>wine'::hstore, 'FR'), 'alcohol', 'get_subcategory shop=>wine for FR should be alcohol');

SELECT is(get_category('amenity=>bank'::hstore, 'CD'), 'money', 'get_category amenity=>bank for CD should be money');

SELECT is(get_subcategory('amenity=>bank'::hstore, 'CD'), 'bank', 'get_subcategory amenity=>bank for CD should be bank');

SELECT is(get_category('amenity=>atm'::hstore, 'CD'), 'money', 'get_category amenity=>atm for CD should be money');

SELECT is(get_subcategory('amenity=>atm'::hstore, 'CD'), 'atm', 'get_subcategory amenity=>atm for CD should be atm');

SELECT is(get_category('amenity=>money_transfer'::hstore, 'CD'), 'money', 'get_category amenity=>money_transfer for CD should be money');

SELECT is(get_subcategory('amenity=>money_transfer'::hstore, 'CD'), 'money_transfer', 'get_subcategory amenity=>money_transfer for CD should be money_transfer');

SELECT is(get_category('amenity=>mobile_money_agent'::hstore, 'CD'), 'money', 'get_category amenity=>mobile_money_agent for CD should be money');

SELECT is(get_subcategory('amenity=>mobile_money_agent'::hstore, 'CD'), 'mobile_money_agent', 'get_subcategory amenity=>mobile_money_agent for CD should be mobile_money_agent');

SELECT is(get_category('shop=>shoes'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>shoes for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>shoes'::hstore, 'FR'), 'shoes', 'get_subcategory shop=>shoes for FR should be shoes');

SELECT is(get_category('shop=>bag'::hstore, 'DE'), 'clothing_beauty', 'get_category shop=>bag for DE should be clothing_beauty');

SELECT is(get_subcategory('shop=>bag'::hstore, 'DE'), 'bag', 'get_subcategory shop=>bag for DE should be bag');

SELECT is(get_category('shop=>bag'::hstore, 'AT'), 'clothing_beauty', 'get_category shop=>bag for AT should be clothing_beauty');

SELECT is(get_subcategory('shop=>bag'::hstore, 'AT'), 'bag', 'get_subcategory shop=>bag for AT should be bag');

SELECT is(get_category('shop=>bag'::hstore, 'CH'), 'clothing_beauty', 'get_category shop=>bag for CH should be clothing_beauty');

SELECT is(get_subcategory('shop=>bag'::hstore, 'CH'), 'bag', 'get_subcategory shop=>bag for CH should be bag');

SELECT is(get_category('shop=>bag'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>bag for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>bag'::hstore, 'FR'), 'bag', 'get_subcategory shop=>bag for FR should be bag');

SELECT is(get_category('shop=>bag'::hstore, 'IT'), 'clothing_beauty', 'get_category shop=>bag for IT should be clothing_beauty');

SELECT is(get_subcategory('shop=>bag'::hstore, 'IT'), 'bag', 'get_subcategory shop=>bag for IT should be bag');

SELECT is(get_category('shop=>beauty'::hstore, 'DE'), 'clothing_beauty', 'get_category shop=>beauty for DE should be clothing_beauty');

SELECT is(get_subcategory('shop=>beauty'::hstore, 'DE'), 'beauty', 'get_subcategory shop=>beauty for DE should be beauty');

SELECT is(get_category('shop=>beauty'::hstore, 'AT'), 'clothing_beauty', 'get_category shop=>beauty for AT should be clothing_beauty');

SELECT is(get_subcategory('shop=>beauty'::hstore, 'AT'), 'beauty', 'get_subcategory shop=>beauty for AT should be beauty');

SELECT is(get_category('shop=>beauty'::hstore, 'CH'), 'clothing_beauty', 'get_category shop=>beauty for CH should be clothing_beauty');

SELECT is(get_subcategory('shop=>beauty'::hstore, 'CH'), 'beauty', 'get_subcategory shop=>beauty for CH should be beauty');

SELECT is(get_category('shop=>beauty'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>beauty for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>beauty'::hstore, 'FR'), 'beauty', 'get_subcategory shop=>beauty for FR should be beauty');

SELECT is(get_category('shop=>beauty'::hstore, 'IT'), 'clothing_beauty', 'get_category shop=>beauty for IT should be clothing_beauty');

SELECT is(get_subcategory('shop=>beauty'::hstore, 'IT'), 'beauty', 'get_subcategory shop=>beauty for IT should be beauty');

SELECT is(get_category('shop=>boutique'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>boutique for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>boutique'::hstore, 'FR'), 'clothes', 'get_subcategory shop=>boutique for FR should be clothes');

SELECT is(get_category('shop=>clothes'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>clothes for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>clothes'::hstore, 'FR'), 'clothes', 'get_subcategory shop=>clothes for FR should be clothes');

SELECT is(get_category('shop=>fashion'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>fashion for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>fashion'::hstore, 'FR'), 'clothes', 'get_subcategory shop=>fashion for FR should be clothes');

SELECT is(get_category('shop=>cosmetics'::hstore, 'DE'), 'clothing_beauty', 'get_category shop=>cosmetics for DE should be clothing_beauty');

SELECT is(get_subcategory('shop=>cosmetics'::hstore, 'DE'), 'cosmetics', 'get_subcategory shop=>cosmetics for DE should be cosmetics');

SELECT is(get_category('shop=>cosmetics'::hstore, 'AT'), 'clothing_beauty', 'get_category shop=>cosmetics for AT should be clothing_beauty');

SELECT is(get_subcategory('shop=>cosmetics'::hstore, 'AT'), 'cosmetics', 'get_subcategory shop=>cosmetics for AT should be cosmetics');

SELECT is(get_category('shop=>cosmetics'::hstore, 'CH'), 'clothing_beauty', 'get_category shop=>cosmetics for CH should be clothing_beauty');

SELECT is(get_subcategory('shop=>cosmetics'::hstore, 'CH'), 'cosmetics', 'get_subcategory shop=>cosmetics for CH should be cosmetics');

SELECT is(get_category('shop=>cosmetics'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>cosmetics for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>cosmetics'::hstore, 'FR'), 'cosmetics', 'get_subcategory shop=>cosmetics for FR should be cosmetics');

SELECT is(get_category('shop=>cosmetics'::hstore, 'IT'), 'clothing_beauty', 'get_category shop=>cosmetics for IT should be clothing_beauty');

SELECT is(get_subcategory('shop=>cosmetics'::hstore, 'IT'), 'cosmetics', 'get_subcategory shop=>cosmetics for IT should be cosmetics');

SELECT is(get_category('shop=>hairdresser'::hstore, 'DE'), 'clothing_beauty', 'get_category shop=>hairdresser for DE should be clothing_beauty');

SELECT is(get_subcategory('shop=>hairdresser'::hstore, 'DE'), 'hairdresser', 'get_subcategory shop=>hairdresser for DE should be hairdresser');

SELECT is(get_category('shop=>hairdresser'::hstore, 'AT'), 'clothing_beauty', 'get_category shop=>hairdresser for AT should be clothing_beauty');

SELECT is(get_subcategory('shop=>hairdresser'::hstore, 'AT'), 'hairdresser', 'get_subcategory shop=>hairdresser for AT should be hairdresser');

SELECT is(get_category('shop=>hairdresser'::hstore, 'CH'), 'clothing_beauty', 'get_category shop=>hairdresser for CH should be clothing_beauty');

SELECT is(get_subcategory('shop=>hairdresser'::hstore, 'CH'), 'hairdresser', 'get_subcategory shop=>hairdresser for CH should be hairdresser');

SELECT is(get_category('shop=>hairdresser'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>hairdresser for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>hairdresser'::hstore, 'FR'), 'hairdresser', 'get_subcategory shop=>hairdresser for FR should be hairdresser');

SELECT is(get_category('shop=>hairdresser'::hstore, 'IT'), 'clothing_beauty', 'get_category shop=>hairdresser for IT should be clothing_beauty');

SELECT is(get_subcategory('shop=>hairdresser'::hstore, 'IT'), 'hairdresser', 'get_subcategory shop=>hairdresser for IT should be hairdresser');

SELECT is(get_category('shop=>jewelry'::hstore, 'DE'), 'clothing_beauty', 'get_category shop=>jewelry for DE should be clothing_beauty');

SELECT is(get_subcategory('shop=>jewelry'::hstore, 'DE'), 'jewelry', 'get_subcategory shop=>jewelry for DE should be jewelry');

SELECT is(get_category('shop=>jewelry'::hstore, 'AT'), 'clothing_beauty', 'get_category shop=>jewelry for AT should be clothing_beauty');

SELECT is(get_subcategory('shop=>jewelry'::hstore, 'AT'), 'jewelry', 'get_subcategory shop=>jewelry for AT should be jewelry');

SELECT is(get_category('shop=>jewelry'::hstore, 'CH'), 'clothing_beauty', 'get_category shop=>jewelry for CH should be clothing_beauty');

SELECT is(get_subcategory('shop=>jewelry'::hstore, 'CH'), 'jewelry', 'get_subcategory shop=>jewelry for CH should be jewelry');

SELECT is(get_category('shop=>jewelry'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>jewelry for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>jewelry'::hstore, 'FR'), 'jewelry', 'get_subcategory shop=>jewelry for FR should be jewelry');

SELECT is(get_category('shop=>jewelry'::hstore, 'IT'), 'clothing_beauty', 'get_category shop=>jewelry for IT should be clothing_beauty');

SELECT is(get_subcategory('shop=>jewelry'::hstore, 'IT'), 'jewelry', 'get_subcategory shop=>jewelry for IT should be jewelry');

SELECT is(get_category('shop=>massage'::hstore, 'DE'), 'clothing_beauty', 'get_category shop=>massage for DE should be clothing_beauty');

SELECT is(get_subcategory('shop=>massage'::hstore, 'DE'), 'massage', 'get_subcategory shop=>massage for DE should be massage');

SELECT is(get_category('shop=>massage'::hstore, 'AT'), 'clothing_beauty', 'get_category shop=>massage for AT should be clothing_beauty');

SELECT is(get_subcategory('shop=>massage'::hstore, 'AT'), 'massage', 'get_subcategory shop=>massage for AT should be massage');

SELECT is(get_category('shop=>massage'::hstore, 'CH'), 'clothing_beauty', 'get_category shop=>massage for CH should be clothing_beauty');

SELECT is(get_subcategory('shop=>massage'::hstore, 'CH'), 'massage', 'get_subcategory shop=>massage for CH should be massage');

SELECT is(get_category('shop=>massage'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>massage for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>massage'::hstore, 'FR'), 'massage', 'get_subcategory shop=>massage for FR should be massage');

SELECT is(get_category('shop=>massage'::hstore, 'IT'), 'clothing_beauty', 'get_category shop=>massage for IT should be clothing_beauty');

SELECT is(get_subcategory('shop=>massage'::hstore, 'IT'), 'massage', 'get_subcategory shop=>massage for IT should be massage');

SELECT is(get_category('shop=>tailor'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>tailor for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>tailor'::hstore, 'FR'), 'tailor', 'get_subcategory shop=>tailor for FR should be tailor');

SELECT is(get_category('shop=>perfumery'::hstore, 'DE'), 'clothing_beauty', 'get_category shop=>perfumery for DE should be clothing_beauty');

SELECT is(get_subcategory('shop=>perfumery'::hstore, 'DE'), 'perfumery', 'get_subcategory shop=>perfumery for DE should be perfumery');

SELECT is(get_category('shop=>perfumery'::hstore, 'AT'), 'clothing_beauty', 'get_category shop=>perfumery for AT should be clothing_beauty');

SELECT is(get_subcategory('shop=>perfumery'::hstore, 'AT'), 'perfumery', 'get_subcategory shop=>perfumery for AT should be perfumery');

SELECT is(get_category('shop=>perfumery'::hstore, 'CH'), 'clothing_beauty', 'get_category shop=>perfumery for CH should be clothing_beauty');

SELECT is(get_subcategory('shop=>perfumery'::hstore, 'CH'), 'perfumery', 'get_subcategory shop=>perfumery for CH should be perfumery');

SELECT is(get_category('shop=>perfumery'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>perfumery for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>perfumery'::hstore, 'FR'), 'perfumery', 'get_subcategory shop=>perfumery for FR should be perfumery');

SELECT is(get_category('shop=>perfumery'::hstore, 'IT'), 'clothing_beauty', 'get_category shop=>perfumery for IT should be clothing_beauty');

SELECT is(get_subcategory('shop=>perfumery'::hstore, 'IT'), 'perfumery', 'get_subcategory shop=>perfumery for IT should be perfumery');

SELECT is(get_category('shop=>chemist'::hstore, 'FR'), 'clothing_beauty', 'get_category shop=>chemist for FR should be clothing_beauty');

SELECT is(get_subcategory('shop=>chemist'::hstore, 'FR'), 'chemist', 'get_subcategory shop=>chemist for FR should be chemist');

SELECT is(get_category('shop=>doityourself'::hstore, 'FR'), 'home_equipment', 'get_category shop=>doityourself for FR should be home_equipment');

SELECT is(get_subcategory('shop=>doityourself'::hstore, 'FR'), 'hardware', 'get_subcategory shop=>doityourself for FR should be hardware');

SELECT is(get_category('shop=>electrical'::hstore, 'FR'), 'home_equipment', 'get_category shop=>electrical for FR should be home_equipment');

SELECT is(get_subcategory('shop=>electrical'::hstore, 'FR'), 'hardware', 'get_subcategory shop=>electrical for FR should be hardware');

SELECT is(get_category('shop=>fireplace'::hstore, 'FR'), 'home_equipment', 'get_category shop=>fireplace for FR should be home_equipment');

SELECT is(get_subcategory('shop=>fireplace'::hstore, 'FR'), 'hardware', 'get_subcategory shop=>fireplace for FR should be hardware');

SELECT is(get_category('shop=>glaziery'::hstore, 'FR'), 'home_equipment', 'get_category shop=>glaziery for FR should be home_equipment');

SELECT is(get_subcategory('shop=>glaziery'::hstore, 'FR'), 'hardware', 'get_subcategory shop=>glaziery for FR should be hardware');

SELECT is(get_category('shop=>hardware'::hstore, 'FR'), 'home_equipment', 'get_category shop=>hardware for FR should be home_equipment');

SELECT is(get_subcategory('shop=>hardware'::hstore, 'FR'), 'hardware', 'get_subcategory shop=>hardware for FR should be hardware');

SELECT is(get_category('shop=>paint'::hstore, 'FR'), 'home_equipment', 'get_category shop=>paint for FR should be home_equipment');

SELECT is(get_subcategory('shop=>paint'::hstore, 'FR'), 'hardware', 'get_subcategory shop=>paint for FR should be hardware');

SELECT is(get_category('shop=>tiles'::hstore, 'FR'), 'home_equipment', 'get_category shop=>tiles for FR should be home_equipment');

SELECT is(get_subcategory('shop=>tiles'::hstore, 'FR'), 'hardware', 'get_subcategory shop=>tiles for FR should be hardware');

SELECT is(get_category('shop=>bed'::hstore, 'DE'), 'home_equipment', 'get_category shop=>bed for DE should be home_equipment');

SELECT is(get_subcategory('shop=>bed'::hstore, 'DE'), 'bed', 'get_subcategory shop=>bed for DE should be bed');

SELECT is(get_category('shop=>bed'::hstore, 'AT'), 'home_equipment', 'get_category shop=>bed for AT should be home_equipment');

SELECT is(get_subcategory('shop=>bed'::hstore, 'AT'), 'bed', 'get_subcategory shop=>bed for AT should be bed');

SELECT is(get_category('shop=>bed'::hstore, 'CH'), 'home_equipment', 'get_category shop=>bed for CH should be home_equipment');

SELECT is(get_subcategory('shop=>bed'::hstore, 'CH'), 'bed', 'get_subcategory shop=>bed for CH should be bed');

SELECT is(get_category('shop=>bed'::hstore, 'FR'), 'home_equipment', 'get_category shop=>bed for FR should be home_equipment');

SELECT is(get_subcategory('shop=>bed'::hstore, 'FR'), 'bed', 'get_subcategory shop=>bed for FR should be bed');

SELECT is(get_category('shop=>bed'::hstore, 'IT'), 'home_equipment', 'get_category shop=>bed for IT should be home_equipment');

SELECT is(get_subcategory('shop=>bed'::hstore, 'IT'), 'bed', 'get_subcategory shop=>bed for IT should be bed');

SELECT is(get_category('shop=>bathroom_furnishing'::hstore, 'DE'), 'home_equipment', 'get_category shop=>bathroom_furnishing for DE should be home_equipment');

SELECT is(get_subcategory('shop=>bathroom_furnishing'::hstore, 'DE'), 'furniture', 'get_subcategory shop=>bathroom_furnishing for DE should be furniture');

SELECT is(get_category('shop=>bathroom_furnishing'::hstore, 'AT'), 'home_equipment', 'get_category shop=>bathroom_furnishing for AT should be home_equipment');

SELECT is(get_subcategory('shop=>bathroom_furnishing'::hstore, 'AT'), 'furniture', 'get_subcategory shop=>bathroom_furnishing for AT should be furniture');

SELECT is(get_category('shop=>bathroom_furnishing'::hstore, 'CH'), 'home_equipment', 'get_category shop=>bathroom_furnishing for CH should be home_equipment');

SELECT is(get_subcategory('shop=>bathroom_furnishing'::hstore, 'CH'), 'furniture', 'get_subcategory shop=>bathroom_furnishing for CH should be furniture');

SELECT is(get_category('shop=>bathroom_furnishing'::hstore, 'FR'), 'home_equipment', 'get_category shop=>bathroom_furnishing for FR should be home_equipment');

SELECT is(get_subcategory('shop=>bathroom_furnishing'::hstore, 'FR'), 'furniture', 'get_subcategory shop=>bathroom_furnishing for FR should be furniture');

SELECT is(get_category('shop=>bathroom_furnishing'::hstore, 'IT'), 'home_equipment', 'get_category shop=>bathroom_furnishing for IT should be home_equipment');

SELECT is(get_subcategory('shop=>bathroom_furnishing'::hstore, 'IT'), 'furniture', 'get_subcategory shop=>bathroom_furnishing for IT should be furniture');

SELECT is(get_category('shop=>carpet'::hstore, 'DE'), 'home_equipment', 'get_category shop=>carpet for DE should be home_equipment');

SELECT is(get_subcategory('shop=>carpet'::hstore, 'DE'), 'furniture', 'get_subcategory shop=>carpet for DE should be furniture');

SELECT is(get_category('shop=>carpet'::hstore, 'AT'), 'home_equipment', 'get_category shop=>carpet for AT should be home_equipment');

SELECT is(get_subcategory('shop=>carpet'::hstore, 'AT'), 'furniture', 'get_subcategory shop=>carpet for AT should be furniture');

SELECT is(get_category('shop=>carpet'::hstore, 'CH'), 'home_equipment', 'get_category shop=>carpet for CH should be home_equipment');

SELECT is(get_subcategory('shop=>carpet'::hstore, 'CH'), 'furniture', 'get_subcategory shop=>carpet for CH should be furniture');

SELECT is(get_category('shop=>carpet'::hstore, 'FR'), 'home_equipment', 'get_category shop=>carpet for FR should be home_equipment');

SELECT is(get_subcategory('shop=>carpet'::hstore, 'FR'), 'furniture', 'get_subcategory shop=>carpet for FR should be furniture');

SELECT is(get_category('shop=>carpet'::hstore, 'IT'), 'home_equipment', 'get_category shop=>carpet for IT should be home_equipment');

SELECT is(get_subcategory('shop=>carpet'::hstore, 'IT'), 'furniture', 'get_subcategory shop=>carpet for IT should be furniture');

SELECT is(get_category('shop=>curtain'::hstore, 'DE'), 'home_equipment', 'get_category shop=>curtain for DE should be home_equipment');

SELECT is(get_subcategory('shop=>curtain'::hstore, 'DE'), 'furniture', 'get_subcategory shop=>curtain for DE should be furniture');

SELECT is(get_category('shop=>curtain'::hstore, 'AT'), 'home_equipment', 'get_category shop=>curtain for AT should be home_equipment');

SELECT is(get_subcategory('shop=>curtain'::hstore, 'AT'), 'furniture', 'get_subcategory shop=>curtain for AT should be furniture');

SELECT is(get_category('shop=>curtain'::hstore, 'CH'), 'home_equipment', 'get_category shop=>curtain for CH should be home_equipment');

SELECT is(get_subcategory('shop=>curtain'::hstore, 'CH'), 'furniture', 'get_subcategory shop=>curtain for CH should be furniture');

SELECT is(get_category('shop=>curtain'::hstore, 'FR'), 'home_equipment', 'get_category shop=>curtain for FR should be home_equipment');

SELECT is(get_subcategory('shop=>curtain'::hstore, 'FR'), 'furniture', 'get_subcategory shop=>curtain for FR should be furniture');

SELECT is(get_category('shop=>curtain'::hstore, 'IT'), 'home_equipment', 'get_category shop=>curtain for IT should be home_equipment');

SELECT is(get_subcategory('shop=>curtain'::hstore, 'IT'), 'furniture', 'get_subcategory shop=>curtain for IT should be furniture');

SELECT is(get_category('shop=>furniture'::hstore, 'DE'), 'home_equipment', 'get_category shop=>furniture for DE should be home_equipment');

SELECT is(get_subcategory('shop=>furniture'::hstore, 'DE'), 'furniture', 'get_subcategory shop=>furniture for DE should be furniture');

SELECT is(get_category('shop=>furniture'::hstore, 'AT'), 'home_equipment', 'get_category shop=>furniture for AT should be home_equipment');

SELECT is(get_subcategory('shop=>furniture'::hstore, 'AT'), 'furniture', 'get_subcategory shop=>furniture for AT should be furniture');

SELECT is(get_category('shop=>furniture'::hstore, 'CH'), 'home_equipment', 'get_category shop=>furniture for CH should be home_equipment');

SELECT is(get_subcategory('shop=>furniture'::hstore, 'CH'), 'furniture', 'get_subcategory shop=>furniture for CH should be furniture');

SELECT is(get_category('shop=>furniture'::hstore, 'FR'), 'home_equipment', 'get_category shop=>furniture for FR should be home_equipment');

SELECT is(get_subcategory('shop=>furniture'::hstore, 'FR'), 'furniture', 'get_subcategory shop=>furniture for FR should be furniture');

SELECT is(get_category('shop=>furniture'::hstore, 'IT'), 'home_equipment', 'get_category shop=>furniture for IT should be home_equipment');

SELECT is(get_subcategory('shop=>furniture'::hstore, 'IT'), 'furniture', 'get_subcategory shop=>furniture for IT should be furniture');

SELECT is(get_category('shop=>kitchen'::hstore, 'DE'), 'home_equipment', 'get_category shop=>kitchen for DE should be home_equipment');

SELECT is(get_subcategory('shop=>kitchen'::hstore, 'DE'), 'furniture', 'get_subcategory shop=>kitchen for DE should be furniture');

SELECT is(get_category('shop=>kitchen'::hstore, 'AT'), 'home_equipment', 'get_category shop=>kitchen for AT should be home_equipment');

SELECT is(get_subcategory('shop=>kitchen'::hstore, 'AT'), 'furniture', 'get_subcategory shop=>kitchen for AT should be furniture');

SELECT is(get_category('shop=>kitchen'::hstore, 'CH'), 'home_equipment', 'get_category shop=>kitchen for CH should be home_equipment');

SELECT is(get_subcategory('shop=>kitchen'::hstore, 'CH'), 'furniture', 'get_subcategory shop=>kitchen for CH should be furniture');

SELECT is(get_category('shop=>kitchen'::hstore, 'FR'), 'home_equipment', 'get_category shop=>kitchen for FR should be home_equipment');

SELECT is(get_subcategory('shop=>kitchen'::hstore, 'FR'), 'furniture', 'get_subcategory shop=>kitchen for FR should be furniture');

SELECT is(get_category('shop=>kitchen'::hstore, 'IT'), 'home_equipment', 'get_category shop=>kitchen for IT should be home_equipment');

SELECT is(get_subcategory('shop=>kitchen'::hstore, 'IT'), 'furniture', 'get_subcategory shop=>kitchen for IT should be furniture');

SELECT is(get_category('shop=>houseware'::hstore, 'DE'), 'home_equipment', 'get_category shop=>houseware for DE should be home_equipment');

SELECT is(get_subcategory('shop=>houseware'::hstore, 'DE'), 'houseware', 'get_subcategory shop=>houseware for DE should be houseware');

SELECT is(get_category('shop=>houseware'::hstore, 'AT'), 'home_equipment', 'get_category shop=>houseware for AT should be home_equipment');

SELECT is(get_subcategory('shop=>houseware'::hstore, 'AT'), 'houseware', 'get_subcategory shop=>houseware for AT should be houseware');

SELECT is(get_category('shop=>houseware'::hstore, 'CH'), 'home_equipment', 'get_category shop=>houseware for CH should be home_equipment');

SELECT is(get_subcategory('shop=>houseware'::hstore, 'CH'), 'houseware', 'get_subcategory shop=>houseware for CH should be houseware');

SELECT is(get_category('shop=>houseware'::hstore, 'FR'), 'home_equipment', 'get_category shop=>houseware for FR should be home_equipment');

SELECT is(get_subcategory('shop=>houseware'::hstore, 'FR'), 'houseware', 'get_subcategory shop=>houseware for FR should be houseware');

SELECT is(get_category('shop=>houseware'::hstore, 'IT'), 'home_equipment', 'get_category shop=>houseware for IT should be home_equipment');

SELECT is(get_subcategory('shop=>houseware'::hstore, 'IT'), 'houseware', 'get_subcategory shop=>houseware for IT should be houseware');

SELECT is(get_category('shop=>interior_decoration'::hstore, 'DE'), 'home_equipment', 'get_category shop=>interior_decoration for DE should be home_equipment');

SELECT is(get_subcategory('shop=>interior_decoration'::hstore, 'DE'), 'interior_decoration', 'get_subcategory shop=>interior_decoration for DE should be interior_decoration');

SELECT is(get_category('shop=>interior_decoration'::hstore, 'AT'), 'home_equipment', 'get_category shop=>interior_decoration for AT should be home_equipment');

SELECT is(get_subcategory('shop=>interior_decoration'::hstore, 'AT'), 'interior_decoration', 'get_subcategory shop=>interior_decoration for AT should be interior_decoration');

SELECT is(get_category('shop=>interior_decoration'::hstore, 'CH'), 'home_equipment', 'get_category shop=>interior_decoration for CH should be home_equipment');

SELECT is(get_subcategory('shop=>interior_decoration'::hstore, 'CH'), 'interior_decoration', 'get_subcategory shop=>interior_decoration for CH should be interior_decoration');

SELECT is(get_category('shop=>interior_decoration'::hstore, 'FR'), 'home_equipment', 'get_category shop=>interior_decoration for FR should be home_equipment');

SELECT is(get_subcategory('shop=>interior_decoration'::hstore, 'FR'), 'interior_decoration', 'get_subcategory shop=>interior_decoration for FR should be interior_decoration');

SELECT is(get_category('shop=>interior_decoration'::hstore, 'IT'), 'home_equipment', 'get_category shop=>interior_decoration for IT should be home_equipment');

SELECT is(get_subcategory('shop=>interior_decoration'::hstore, 'IT'), 'interior_decoration', 'get_subcategory shop=>interior_decoration for IT should be interior_decoration');

SELECT is(get_category('shop=>pottery'::hstore, 'DE'), 'home_equipment', 'get_category shop=>pottery for DE should be home_equipment');

SELECT is(get_subcategory('shop=>pottery'::hstore, 'DE'), 'pottery', 'get_subcategory shop=>pottery for DE should be pottery');

SELECT is(get_category('shop=>pottery'::hstore, 'AT'), 'home_equipment', 'get_category shop=>pottery for AT should be home_equipment');

SELECT is(get_subcategory('shop=>pottery'::hstore, 'AT'), 'pottery', 'get_subcategory shop=>pottery for AT should be pottery');

SELECT is(get_category('shop=>pottery'::hstore, 'CH'), 'home_equipment', 'get_category shop=>pottery for CH should be home_equipment');

SELECT is(get_subcategory('shop=>pottery'::hstore, 'CH'), 'pottery', 'get_subcategory shop=>pottery for CH should be pottery');

SELECT is(get_category('shop=>pottery'::hstore, 'IT'), 'home_equipment', 'get_category shop=>pottery for IT should be home_equipment');

SELECT is(get_subcategory('shop=>pottery'::hstore, 'IT'), 'pottery', 'get_subcategory shop=>pottery for IT should be pottery');

SELECT is(get_category('shop=>watches'::hstore, 'DE'), 'home_equipment', 'get_category shop=>watches for DE should be home_equipment');

SELECT is(get_subcategory('shop=>watches'::hstore, 'DE'), 'watches', 'get_subcategory shop=>watches for DE should be watches');

SELECT is(get_category('shop=>watches'::hstore, 'AT'), 'home_equipment', 'get_category shop=>watches for AT should be home_equipment');

SELECT is(get_subcategory('shop=>watches'::hstore, 'AT'), 'watches', 'get_subcategory shop=>watches for AT should be watches');

SELECT is(get_category('shop=>watches'::hstore, 'CH'), 'home_equipment', 'get_category shop=>watches for CH should be home_equipment');

SELECT is(get_subcategory('shop=>watches'::hstore, 'CH'), 'watches', 'get_subcategory shop=>watches for CH should be watches');

SELECT is(get_category('shop=>watches'::hstore, 'FR'), 'home_equipment', 'get_category shop=>watches for FR should be home_equipment');

SELECT is(get_subcategory('shop=>watches'::hstore, 'FR'), 'watches', 'get_subcategory shop=>watches for FR should be watches');

SELECT is(get_category('shop=>watches'::hstore, 'IT'), 'home_equipment', 'get_category shop=>watches for IT should be home_equipment');

SELECT is(get_subcategory('shop=>watches'::hstore, 'IT'), 'watches', 'get_subcategory shop=>watches for IT should be watches');

SELECT is(get_category('shop=>lighting'::hstore, 'AT'), 'home_equipment', 'get_category shop=>lighting for AT should be home_equipment');

SELECT is(get_subcategory('shop=>lighting'::hstore, 'AT'), 'lighting', 'get_subcategory shop=>lighting for AT should be lighting');

SELECT is(get_category('shop=>lighting'::hstore, 'CH'), 'home_equipment', 'get_category shop=>lighting for CH should be home_equipment');

SELECT is(get_subcategory('shop=>lighting'::hstore, 'CH'), 'lighting', 'get_subcategory shop=>lighting for CH should be lighting');

SELECT is(get_category('shop=>lighting'::hstore, 'DE'), 'home_equipment', 'get_category shop=>lighting for DE should be home_equipment');

SELECT is(get_subcategory('shop=>lighting'::hstore, 'DE'), 'lighting', 'get_subcategory shop=>lighting for DE should be lighting');

SELECT is(get_category('shop=>lighting'::hstore, 'IT'), 'home_equipment', 'get_category shop=>lighting for IT should be home_equipment');

SELECT is(get_subcategory('shop=>lighting'::hstore, 'IT'), 'lighting', 'get_subcategory shop=>lighting for IT should be lighting');

SELECT is(get_category('shop=>lighting'::hstore, 'FR'), 'home_equipment', 'get_category shop=>lighting for FR should be home_equipment');

SELECT is(get_subcategory('shop=>lighting'::hstore, 'FR'), 'lighting', 'get_subcategory shop=>lighting for FR should be lighting');

SELECT is(get_category('shop=>hifi'::hstore, 'DE'), 'home_equipment', 'get_category shop=>hifi for DE should be home_equipment');

SELECT is(get_subcategory('shop=>hifi'::hstore, 'DE'), 'hifi', 'get_subcategory shop=>hifi for DE should be hifi');

SELECT is(get_category('shop=>hifi'::hstore, 'AT'), 'home_equipment', 'get_category shop=>hifi for AT should be home_equipment');

SELECT is(get_subcategory('shop=>hifi'::hstore, 'AT'), 'hifi', 'get_subcategory shop=>hifi for AT should be hifi');

SELECT is(get_category('shop=>hifi'::hstore, 'CH'), 'home_equipment', 'get_category shop=>hifi for CH should be home_equipment');

SELECT is(get_subcategory('shop=>hifi'::hstore, 'CH'), 'hifi', 'get_subcategory shop=>hifi for CH should be hifi');

SELECT is(get_category('shop=>hifi'::hstore, 'FR'), 'home_equipment', 'get_category shop=>hifi for FR should be home_equipment');

SELECT is(get_subcategory('shop=>hifi'::hstore, 'FR'), 'hifi', 'get_subcategory shop=>hifi for FR should be hifi');

SELECT is(get_category('shop=>hifi'::hstore, 'IT'), 'home_equipment', 'get_category shop=>hifi for IT should be home_equipment');

SELECT is(get_subcategory('shop=>hifi'::hstore, 'IT'), 'hifi', 'get_subcategory shop=>hifi for IT should be hifi');

SELECT is(get_category('shop=>electronics'::hstore, 'FR'), 'home_equipment', 'get_category shop=>electronics for FR should be home_equipment');

SELECT is(get_subcategory('shop=>electronics'::hstore, 'FR'), 'electronics', 'get_subcategory shop=>electronics for FR should be electronics');

SELECT is(get_category('craft=>electronics_repair'::hstore, 'FR'), 'home_equipment', 'get_category craft=>electronics_repair for FR should be home_equipment');

SELECT is(get_subcategory('craft=>electronics_repair'::hstore, 'FR'), 'electronics', 'get_subcategory craft=>electronics_repair for FR should be electronics');

SELECT is(get_category('shop=>appliance'::hstore, 'FR'), 'home_equipment', 'get_category shop=>appliance for FR should be home_equipment');

SELECT is(get_subcategory('shop=>appliance'::hstore, 'FR'), 'electronics', 'get_subcategory shop=>appliance for FR should be electronics');

SELECT is(get_category('shop=>mobile_phone'::hstore, 'FR'), 'shop', 'get_category shop=>mobile_phone for FR should be shop');

SELECT is(get_subcategory('shop=>mobile_phone'::hstore, 'FR'), 'mobile_phone', 'get_subcategory shop=>mobile_phone for FR should be mobile_phone');

SELECT is(get_category('shop=>computer'::hstore, 'FR'), 'shop', 'get_category shop=>computer for FR should be shop');

SELECT is(get_subcategory('shop=>computer'::hstore, 'FR'), 'computer', 'get_subcategory shop=>computer for FR should be computer');

SELECT is(get_category('shop=>printer_ink'::hstore, 'IT'), 'shop', 'get_category shop=>printer_ink for IT should be shop');

SELECT is(get_subcategory('shop=>printer_ink'::hstore, 'IT'), 'printer_ink', 'get_subcategory shop=>printer_ink for IT should be printer_ink');

SELECT is(get_category('shop=>dry_cleaning'::hstore, 'FR'), 'shop', 'get_category shop=>dry_cleaning for FR should be shop');

SELECT is(get_subcategory('shop=>dry_cleaning'::hstore, 'FR'), 'dry_cleaning', 'get_subcategory shop=>dry_cleaning for FR should be dry_cleaning');

SELECT is(get_category('shop=>laundry'::hstore, 'FR'), 'shop', 'get_category shop=>laundry for FR should be shop');

SELECT is(get_subcategory('shop=>laundry'::hstore, 'FR'), 'laundry', 'get_subcategory shop=>laundry for FR should be laundry');

SELECT is(get_category('shop=>stationery'::hstore, 'AT'), 'shop', 'get_category shop=>stationery for AT should be shop');

SELECT is(get_subcategory('shop=>stationery'::hstore, 'AT'), 'stationery', 'get_subcategory shop=>stationery for AT should be stationery');

SELECT is(get_category('shop=>stationery'::hstore, 'CH'), 'shop', 'get_category shop=>stationery for CH should be shop');

SELECT is(get_subcategory('shop=>stationery'::hstore, 'CH'), 'stationery', 'get_subcategory shop=>stationery for CH should be stationery');

SELECT is(get_category('shop=>stationery'::hstore, 'DE'), 'shop', 'get_category shop=>stationery for DE should be shop');

SELECT is(get_subcategory('shop=>stationery'::hstore, 'DE'), 'stationery', 'get_subcategory shop=>stationery for DE should be stationery');

SELECT is(get_category('shop=>stationery'::hstore, 'FR'), 'shop', 'get_category shop=>stationery for FR should be shop');

SELECT is(get_subcategory('shop=>stationery'::hstore, 'FR'), 'stationery', 'get_subcategory shop=>stationery for FR should be stationery');

SELECT is(get_category('shop=>stationery'::hstore, 'IT'), 'shop', 'get_category shop=>stationery for IT should be shop');

SELECT is(get_subcategory('shop=>stationery'::hstore, 'IT'), 'stationery', 'get_subcategory shop=>stationery for IT should be stationery');

SELECT is(get_category('shop=>kiosk'::hstore, 'FR'), 'shop', 'get_category shop=>kiosk for FR should be shop');

SELECT is(get_subcategory('shop=>kiosk'::hstore, 'FR'), 'newsagent', 'get_subcategory shop=>kiosk for FR should be newsagent');

SELECT is(get_category('shop=>newsagent'::hstore, 'FR'), 'shop', 'get_category shop=>newsagent for FR should be shop');

SELECT is(get_subcategory('shop=>newsagent'::hstore, 'FR'), 'newsagent', 'get_subcategory shop=>newsagent for FR should be newsagent');

SELECT is(get_category('newsagent=>yes'::hstore, 'FR'), 'shop', 'get_category newsagent=>yes for FR should be shop');

SELECT is(get_subcategory('newsagent=>yes'::hstore, 'FR'), 'newsagent', 'get_subcategory newsagent=>yes for FR should be newsagent');

SELECT is(get_category('shop=>pet'::hstore, 'FR'), 'shop', 'get_category shop=>pet for FR should be shop');

SELECT is(get_subcategory('shop=>pet'::hstore, 'FR'), 'pet', 'get_subcategory shop=>pet for FR should be pet');

SELECT is(get_category('shop=>agrarian'::hstore, 'AT'), 'shop', 'get_category shop=>agrarian for AT should be shop');

SELECT is(get_subcategory('shop=>agrarian'::hstore, 'AT'), 'agrarian', 'get_subcategory shop=>agrarian for AT should be agrarian');

SELECT is(get_category('shop=>agrarian'::hstore, 'CH'), 'shop', 'get_category shop=>agrarian for CH should be shop');

SELECT is(get_subcategory('shop=>agrarian'::hstore, 'CH'), 'agrarian', 'get_subcategory shop=>agrarian for CH should be agrarian');

SELECT is(get_category('shop=>agrarian'::hstore, 'DE'), 'shop', 'get_category shop=>agrarian for DE should be shop');

SELECT is(get_subcategory('shop=>agrarian'::hstore, 'DE'), 'agrarian', 'get_subcategory shop=>agrarian for DE should be agrarian');

SELECT is(get_category('shop=>agrarian'::hstore, 'FR'), 'shop', 'get_category shop=>agrarian for FR should be shop');

SELECT is(get_subcategory('shop=>agrarian'::hstore, 'FR'), 'agrarian', 'get_subcategory shop=>agrarian for FR should be agrarian');

SELECT is(get_category('shop=>agrarian'::hstore, 'IT'), 'shop', 'get_category shop=>agrarian for IT should be shop');

SELECT is(get_subcategory('shop=>agrarian'::hstore, 'IT'), 'agrarian', 'get_subcategory shop=>agrarian for IT should be agrarian');

SELECT is(get_category('shop=>garden_centre'::hstore, 'FR'), 'shop', 'get_category shop=>garden_centre for FR should be shop');

SELECT is(get_subcategory('shop=>garden_centre'::hstore, 'FR'), 'flower', 'get_subcategory shop=>garden_centre for FR should be flower');

SELECT is(get_category('shop=>florist'::hstore, 'FR'), 'shop', 'get_category shop=>florist for FR should be shop');

SELECT is(get_subcategory('shop=>florist'::hstore, 'FR'), 'flower', 'get_subcategory shop=>florist for FR should be flower');

SELECT is(get_category('shop=>fabric'::hstore, 'FR'), 'shop', 'get_category shop=>fabric for FR should be shop');

SELECT is(get_subcategory('shop=>fabric'::hstore, 'FR'), 'sewing', 'get_subcategory shop=>fabric for FR should be sewing');

SELECT is(get_category('shop=>sewing'::hstore, 'FR'), 'shop', 'get_category shop=>sewing for FR should be shop');

SELECT is(get_subcategory('shop=>sewing'::hstore, 'FR'), 'sewing', 'get_subcategory shop=>sewing for FR should be sewing');

SELECT is(get_category('shop=>haberdashery'::hstore, 'FR'), 'shop', 'get_category shop=>haberdashery for FR should be shop');

SELECT is(get_subcategory('shop=>haberdashery'::hstore, 'FR'), 'sewing', 'get_subcategory shop=>haberdashery for FR should be sewing');

SELECT is(get_category('shop=>wool'::hstore, 'FR'), 'shop', 'get_category shop=>wool for FR should be shop');

SELECT is(get_subcategory('shop=>wool'::hstore, 'FR'), 'sewing', 'get_subcategory shop=>wool for FR should be sewing');

SELECT is(get_category('craft=>sewing'::hstore, 'FR'), 'shop', 'get_category craft=>sewing for FR should be shop');

SELECT is(get_subcategory('craft=>sewing'::hstore, 'FR'), 'sewing', 'get_subcategory craft=>sewing for FR should be sewing');

SELECT is(get_category('shop=>books'::hstore, 'DE'), 'shop', 'get_category shop=>books for DE should be shop');

SELECT is(get_subcategory('shop=>books'::hstore, 'DE'), 'books', 'get_subcategory shop=>books for DE should be books');

SELECT is(get_category('shop=>books'::hstore, 'AT'), 'shop', 'get_category shop=>books for AT should be shop');

SELECT is(get_subcategory('shop=>books'::hstore, 'AT'), 'books', 'get_subcategory shop=>books for AT should be books');

SELECT is(get_category('shop=>books'::hstore, 'CH'), 'shop', 'get_category shop=>books for CH should be shop');

SELECT is(get_subcategory('shop=>books'::hstore, 'CH'), 'books', 'get_subcategory shop=>books for CH should be books');

SELECT is(get_category('shop=>books'::hstore, 'IT'), 'shop', 'get_category shop=>books for IT should be shop');

SELECT is(get_subcategory('shop=>books'::hstore, 'IT'), 'books', 'get_subcategory shop=>books for IT should be books');

SELECT is(get_category('shop=>books'::hstore, 'FR'), 'shop', 'get_category shop=>books for FR should be shop');

SELECT is(get_subcategory('shop=>books'::hstore, 'FR'), 'books', 'get_subcategory shop=>books for FR should be books');

SELECT is(get_category('amenity=>vending_machine, vending=>books'::hstore, 'DE'), 'shop', 'get_category amenity=>vending_machine, vending=>books for DE should be shop');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>books'::hstore, 'DE'), 'books', 'get_subcategory amenity=>vending_machine, vending=>books for DE should be books');

SELECT is(get_category('amenity=>vending_machine, vending=>books'::hstore, 'AT'), 'shop', 'get_category amenity=>vending_machine, vending=>books for AT should be shop');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>books'::hstore, 'AT'), 'books', 'get_subcategory amenity=>vending_machine, vending=>books for AT should be books');

SELECT is(get_category('amenity=>vending_machine, vending=>books'::hstore, 'CH'), 'shop', 'get_category amenity=>vending_machine, vending=>books for CH should be shop');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>books'::hstore, 'CH'), 'books', 'get_subcategory amenity=>vending_machine, vending=>books for CH should be books');

SELECT is(get_category('amenity=>vending_machine, vending=>books'::hstore, 'IT'), 'shop', 'get_category amenity=>vending_machine, vending=>books for IT should be shop');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>books'::hstore, 'IT'), 'books', 'get_subcategory amenity=>vending_machine, vending=>books for IT should be books');

SELECT is(get_category('amenity=>vending_machine, vending=>books'::hstore, 'FR'), 'shop', 'get_category amenity=>vending_machine, vending=>books for FR should be shop');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>books'::hstore, 'FR'), 'books', 'get_subcategory amenity=>vending_machine, vending=>books for FR should be books');

SELECT is(get_category('amenity=>public_bookcase'::hstore, 'DE'), 'shop', 'get_category amenity=>public_bookcase for DE should be shop');

SELECT is(get_subcategory('amenity=>public_bookcase'::hstore, 'DE'), 'books', 'get_subcategory amenity=>public_bookcase for DE should be books');

SELECT is(get_category('amenity=>public_bookcase'::hstore, 'AT'), 'shop', 'get_category amenity=>public_bookcase for AT should be shop');

SELECT is(get_subcategory('amenity=>public_bookcase'::hstore, 'AT'), 'books', 'get_subcategory amenity=>public_bookcase for AT should be books');

SELECT is(get_category('amenity=>public_bookcase'::hstore, 'CH'), 'shop', 'get_category amenity=>public_bookcase for CH should be shop');

SELECT is(get_subcategory('amenity=>public_bookcase'::hstore, 'CH'), 'books', 'get_subcategory amenity=>public_bookcase for CH should be books');

SELECT is(get_category('amenity=>public_bookcase'::hstore, 'IT'), 'shop', 'get_category amenity=>public_bookcase for IT should be shop');

SELECT is(get_subcategory('amenity=>public_bookcase'::hstore, 'IT'), 'books', 'get_subcategory amenity=>public_bookcase for IT should be books');

SELECT is(get_category('amenity=>public_bookcase'::hstore, 'FR'), 'shop', 'get_category amenity=>public_bookcase for FR should be shop');

SELECT is(get_subcategory('amenity=>public_bookcase'::hstore, 'FR'), 'books', 'get_subcategory amenity=>public_bookcase for FR should be books');

SELECT is(get_category('shop=>art'::hstore, 'DE'), 'shop', 'get_category shop=>art for DE should be shop');

SELECT is(get_subcategory('shop=>art'::hstore, 'DE'), 'art', 'get_subcategory shop=>art for DE should be art');

SELECT is(get_category('shop=>art'::hstore, 'AT'), 'shop', 'get_category shop=>art for AT should be shop');

SELECT is(get_subcategory('shop=>art'::hstore, 'AT'), 'art', 'get_subcategory shop=>art for AT should be art');

SELECT is(get_category('shop=>art'::hstore, 'CH'), 'shop', 'get_category shop=>art for CH should be shop');

SELECT is(get_subcategory('shop=>art'::hstore, 'CH'), 'art', 'get_subcategory shop=>art for CH should be art');

SELECT is(get_category('shop=>art'::hstore, 'FR'), 'shop', 'get_category shop=>art for FR should be shop');

SELECT is(get_subcategory('shop=>art'::hstore, 'FR'), 'art', 'get_subcategory shop=>art for FR should be art');

SELECT is(get_category('shop=>art'::hstore, 'IT'), 'shop', 'get_category shop=>art for IT should be shop');

SELECT is(get_subcategory('shop=>art'::hstore, 'IT'), 'art', 'get_subcategory shop=>art for IT should be art');

SELECT is(get_category('shop=>charity'::hstore, 'DE'), 'shop', 'get_category shop=>charity for DE should be shop');

SELECT is(get_subcategory('shop=>charity'::hstore, 'DE'), 'charity', 'get_subcategory shop=>charity for DE should be charity');

SELECT is(get_category('shop=>charity'::hstore, 'AT'), 'shop', 'get_category shop=>charity for AT should be shop');

SELECT is(get_subcategory('shop=>charity'::hstore, 'AT'), 'charity', 'get_subcategory shop=>charity for AT should be charity');

SELECT is(get_category('shop=>charity'::hstore, 'CH'), 'shop', 'get_category shop=>charity for CH should be shop');

SELECT is(get_subcategory('shop=>charity'::hstore, 'CH'), 'charity', 'get_subcategory shop=>charity for CH should be charity');

SELECT is(get_category('shop=>charity'::hstore, 'FR'), 'shop', 'get_category shop=>charity for FR should be shop');

SELECT is(get_subcategory('shop=>charity'::hstore, 'FR'), 'charity', 'get_subcategory shop=>charity for FR should be charity');

SELECT is(get_category('shop=>charity'::hstore, 'IT'), 'shop', 'get_category shop=>charity for IT should be shop');

SELECT is(get_subcategory('shop=>charity'::hstore, 'IT'), 'charity', 'get_subcategory shop=>charity for IT should be charity');

SELECT is(get_category('shop=>department_store'::hstore, 'DE'), 'shop', 'get_category shop=>department_store for DE should be shop');

SELECT is(get_subcategory('shop=>department_store'::hstore, 'DE'), 'department_store', 'get_subcategory shop=>department_store for DE should be department_store');

SELECT is(get_category('shop=>department_store'::hstore, 'AT'), 'shop', 'get_category shop=>department_store for AT should be shop');

SELECT is(get_subcategory('shop=>department_store'::hstore, 'AT'), 'department_store', 'get_subcategory shop=>department_store for AT should be department_store');

SELECT is(get_category('shop=>department_store'::hstore, 'CH'), 'shop', 'get_category shop=>department_store for CH should be shop');

SELECT is(get_subcategory('shop=>department_store'::hstore, 'CH'), 'department_store', 'get_subcategory shop=>department_store for CH should be department_store');

SELECT is(get_category('shop=>department_store'::hstore, 'FR'), 'shop', 'get_category shop=>department_store for FR should be shop');

SELECT is(get_subcategory('shop=>department_store'::hstore, 'FR'), 'department_store', 'get_subcategory shop=>department_store for FR should be department_store');

SELECT is(get_category('shop=>department_store'::hstore, 'IT'), 'shop', 'get_category shop=>department_store for IT should be shop');

SELECT is(get_subcategory('shop=>department_store'::hstore, 'IT'), 'department_store', 'get_subcategory shop=>department_store for IT should be department_store');

SELECT is(get_category('opening_hours:covid19=>*, shop=>gift'::hstore, 'DE'), 'shop', 'get_category opening_hours:covid19=>*, shop=>gift for DE should be shop');

SELECT is(get_subcategory('opening_hours:covid19=>*, shop=>gift'::hstore, 'DE'), 'gift', 'get_subcategory opening_hours:covid19=>*, shop=>gift for DE should be gift');

SELECT is(get_category('opening_hours:covid19=>*, shop=>gift'::hstore, 'AT'), 'shop', 'get_category opening_hours:covid19=>*, shop=>gift for AT should be shop');

SELECT is(get_subcategory('opening_hours:covid19=>*, shop=>gift'::hstore, 'AT'), 'gift', 'get_subcategory opening_hours:covid19=>*, shop=>gift for AT should be gift');

SELECT is(get_category('opening_hours:covid19=>*, shop=>gift'::hstore, 'CH'), 'shop', 'get_category opening_hours:covid19=>*, shop=>gift for CH should be shop');

SELECT is(get_subcategory('opening_hours:covid19=>*, shop=>gift'::hstore, 'CH'), 'gift', 'get_subcategory opening_hours:covid19=>*, shop=>gift for CH should be gift');

SELECT is(get_category('opening_hours:covid19=>*, shop=>gift'::hstore, 'FR'), 'shop', 'get_category opening_hours:covid19=>*, shop=>gift for FR should be shop');

SELECT is(get_subcategory('opening_hours:covid19=>*, shop=>gift'::hstore, 'FR'), 'gift', 'get_subcategory opening_hours:covid19=>*, shop=>gift for FR should be gift');

SELECT is(get_category('opening_hours:covid19=>*, shop=>gift'::hstore, 'IT'), 'shop', 'get_category opening_hours:covid19=>*, shop=>gift for IT should be shop');

SELECT is(get_subcategory('opening_hours:covid19=>*, shop=>gift'::hstore, 'IT'), 'gift', 'get_subcategory opening_hours:covid19=>*, shop=>gift for IT should be gift');

SELECT is(get_category('shop=>music'::hstore, 'DE'), 'shop', 'get_category shop=>music for DE should be shop');

SELECT is(get_subcategory('shop=>music'::hstore, 'DE'), 'music', 'get_subcategory shop=>music for DE should be music');

SELECT is(get_category('shop=>music'::hstore, 'AT'), 'shop', 'get_category shop=>music for AT should be shop');

SELECT is(get_subcategory('shop=>music'::hstore, 'AT'), 'music', 'get_subcategory shop=>music for AT should be music');

SELECT is(get_category('shop=>music'::hstore, 'CH'), 'shop', 'get_category shop=>music for CH should be shop');

SELECT is(get_subcategory('shop=>music'::hstore, 'CH'), 'music', 'get_subcategory shop=>music for CH should be music');

SELECT is(get_category('shop=>music'::hstore, 'FR'), 'shop', 'get_category shop=>music for FR should be shop');

SELECT is(get_subcategory('shop=>music'::hstore, 'FR'), 'music', 'get_subcategory shop=>music for FR should be music');

SELECT is(get_category('shop=>music'::hstore, 'IT'), 'shop', 'get_category shop=>music for IT should be shop');

SELECT is(get_subcategory('shop=>music'::hstore, 'IT'), 'music', 'get_subcategory shop=>music for IT should be music');

SELECT is(get_category('shop=>musical_instrument'::hstore, 'DE'), 'shop', 'get_category shop=>musical_instrument for DE should be shop');

SELECT is(get_subcategory('shop=>musical_instrument'::hstore, 'DE'), 'musical_instrument', 'get_subcategory shop=>musical_instrument for DE should be musical_instrument');

SELECT is(get_category('shop=>musical_instrument'::hstore, 'AT'), 'shop', 'get_category shop=>musical_instrument for AT should be shop');

SELECT is(get_subcategory('shop=>musical_instrument'::hstore, 'AT'), 'musical_instrument', 'get_subcategory shop=>musical_instrument for AT should be musical_instrument');

SELECT is(get_category('shop=>musical_instrument'::hstore, 'CH'), 'shop', 'get_category shop=>musical_instrument for CH should be shop');

SELECT is(get_subcategory('shop=>musical_instrument'::hstore, 'CH'), 'musical_instrument', 'get_subcategory shop=>musical_instrument for CH should be musical_instrument');

SELECT is(get_category('shop=>musical_instrument'::hstore, 'FR'), 'shop', 'get_category shop=>musical_instrument for FR should be shop');

SELECT is(get_subcategory('shop=>musical_instrument'::hstore, 'FR'), 'musical_instrument', 'get_subcategory shop=>musical_instrument for FR should be musical_instrument');

SELECT is(get_category('shop=>musical_instrument'::hstore, 'IT'), 'shop', 'get_category shop=>musical_instrument for IT should be shop');

SELECT is(get_subcategory('shop=>musical_instrument'::hstore, 'IT'), 'musical_instrument', 'get_subcategory shop=>musical_instrument for IT should be musical_instrument');

SELECT is(get_category('shop=>photo'::hstore, 'DE'), 'shop', 'get_category shop=>photo for DE should be shop');

SELECT is(get_subcategory('shop=>photo'::hstore, 'DE'), 'photo', 'get_subcategory shop=>photo for DE should be photo');

SELECT is(get_category('shop=>photo'::hstore, 'AT'), 'shop', 'get_category shop=>photo for AT should be shop');

SELECT is(get_subcategory('shop=>photo'::hstore, 'AT'), 'photo', 'get_subcategory shop=>photo for AT should be photo');

SELECT is(get_category('shop=>photo'::hstore, 'CH'), 'shop', 'get_category shop=>photo for CH should be shop');

SELECT is(get_subcategory('shop=>photo'::hstore, 'CH'), 'photo', 'get_subcategory shop=>photo for CH should be photo');

SELECT is(get_category('shop=>photo'::hstore, 'FR'), 'shop', 'get_category shop=>photo for FR should be shop');

SELECT is(get_subcategory('shop=>photo'::hstore, 'FR'), 'photo', 'get_subcategory shop=>photo for FR should be photo');

SELECT is(get_category('shop=>photo'::hstore, 'IT'), 'shop', 'get_category shop=>photo for IT should be shop');

SELECT is(get_subcategory('shop=>photo'::hstore, 'IT'), 'photo', 'get_subcategory shop=>photo for IT should be photo');

SELECT is(get_category('shop=>second_hand'::hstore, 'DE'), 'shop', 'get_category shop=>second_hand for DE should be shop');

SELECT is(get_subcategory('shop=>second_hand'::hstore, 'DE'), 'second_hand', 'get_subcategory shop=>second_hand for DE should be second_hand');

SELECT is(get_category('shop=>second_hand'::hstore, 'AT'), 'shop', 'get_category shop=>second_hand for AT should be shop');

SELECT is(get_subcategory('shop=>second_hand'::hstore, 'AT'), 'second_hand', 'get_subcategory shop=>second_hand for AT should be second_hand');

SELECT is(get_category('shop=>second_hand'::hstore, 'CH'), 'shop', 'get_category shop=>second_hand for CH should be shop');

SELECT is(get_subcategory('shop=>second_hand'::hstore, 'CH'), 'second_hand', 'get_subcategory shop=>second_hand for CH should be second_hand');

SELECT is(get_category('shop=>second_hand'::hstore, 'FR'), 'shop', 'get_category shop=>second_hand for FR should be shop');

SELECT is(get_subcategory('shop=>second_hand'::hstore, 'FR'), 'second_hand', 'get_subcategory shop=>second_hand for FR should be second_hand');

SELECT is(get_category('shop=>second_hand'::hstore, 'IT'), 'shop', 'get_category shop=>second_hand for IT should be shop');

SELECT is(get_subcategory('shop=>second_hand'::hstore, 'IT'), 'second_hand', 'get_subcategory shop=>second_hand for IT should be second_hand');

SELECT is(get_category('shop=>ticket'::hstore, 'DE'), 'shop', 'get_category shop=>ticket for DE should be shop');

SELECT is(get_subcategory('shop=>ticket'::hstore, 'DE'), 'ticket', 'get_subcategory shop=>ticket for DE should be ticket');

SELECT is(get_category('shop=>ticket'::hstore, 'AT'), 'shop', 'get_category shop=>ticket for AT should be shop');

SELECT is(get_subcategory('shop=>ticket'::hstore, 'AT'), 'ticket', 'get_subcategory shop=>ticket for AT should be ticket');

SELECT is(get_category('shop=>ticket'::hstore, 'CH'), 'shop', 'get_category shop=>ticket for CH should be shop');

SELECT is(get_subcategory('shop=>ticket'::hstore, 'CH'), 'ticket', 'get_subcategory shop=>ticket for CH should be ticket');

SELECT is(get_category('shop=>ticket'::hstore, 'IT'), 'shop', 'get_category shop=>ticket for IT should be shop');

SELECT is(get_subcategory('shop=>ticket'::hstore, 'IT'), 'ticket', 'get_subcategory shop=>ticket for IT should be ticket');

SELECT is(get_category('shop=>toys'::hstore, 'DE'), 'shop', 'get_category shop=>toys for DE should be shop');

SELECT is(get_subcategory('shop=>toys'::hstore, 'DE'), 'toys', 'get_subcategory shop=>toys for DE should be toys');

SELECT is(get_category('shop=>toys'::hstore, 'AT'), 'shop', 'get_category shop=>toys for AT should be shop');

SELECT is(get_subcategory('shop=>toys'::hstore, 'AT'), 'toys', 'get_subcategory shop=>toys for AT should be toys');

SELECT is(get_category('shop=>toys'::hstore, 'CH'), 'shop', 'get_category shop=>toys for CH should be shop');

SELECT is(get_subcategory('shop=>toys'::hstore, 'CH'), 'toys', 'get_subcategory shop=>toys for CH should be toys');

SELECT is(get_category('shop=>toys'::hstore, 'FR'), 'shop', 'get_category shop=>toys for FR should be shop');

SELECT is(get_subcategory('shop=>toys'::hstore, 'FR'), 'toys', 'get_subcategory shop=>toys for FR should be toys');

SELECT is(get_category('shop=>toys'::hstore, 'IT'), 'shop', 'get_category shop=>toys for IT should be shop');

SELECT is(get_subcategory('shop=>toys'::hstore, 'IT'), 'toys', 'get_subcategory shop=>toys for IT should be toys');

SELECT is(get_category('shop=>trade'::hstore, 'DE'), 'shop', 'get_category shop=>trade for DE should be shop');

SELECT is(get_subcategory('shop=>trade'::hstore, 'DE'), 'trade', 'get_subcategory shop=>trade for DE should be trade');

SELECT is(get_category('shop=>trade'::hstore, 'AT'), 'shop', 'get_category shop=>trade for AT should be shop');

SELECT is(get_subcategory('shop=>trade'::hstore, 'AT'), 'trade', 'get_subcategory shop=>trade for AT should be trade');

SELECT is(get_category('shop=>trade'::hstore, 'CH'), 'shop', 'get_category shop=>trade for CH should be shop');

SELECT is(get_subcategory('shop=>trade'::hstore, 'CH'), 'trade', 'get_subcategory shop=>trade for CH should be trade');

SELECT is(get_category('shop=>trade'::hstore, 'IT'), 'shop', 'get_category shop=>trade for IT should be shop');

SELECT is(get_subcategory('shop=>trade'::hstore, 'IT'), 'trade', 'get_subcategory shop=>trade for IT should be trade');

SELECT is(get_category('shop=>travel_agency'::hstore, 'DE'), 'shop', 'get_category shop=>travel_agency for DE should be shop');

SELECT is(get_subcategory('shop=>travel_agency'::hstore, 'DE'), 'travel_agency', 'get_subcategory shop=>travel_agency for DE should be travel_agency');

SELECT is(get_category('shop=>travel_agency'::hstore, 'AT'), 'shop', 'get_category shop=>travel_agency for AT should be shop');

SELECT is(get_subcategory('shop=>travel_agency'::hstore, 'AT'), 'travel_agency', 'get_subcategory shop=>travel_agency for AT should be travel_agency');

SELECT is(get_category('shop=>travel_agency'::hstore, 'CH'), 'shop', 'get_category shop=>travel_agency for CH should be shop');

SELECT is(get_subcategory('shop=>travel_agency'::hstore, 'CH'), 'travel_agency', 'get_subcategory shop=>travel_agency for CH should be travel_agency');

SELECT is(get_category('shop=>travel_agency'::hstore, 'IT'), 'shop', 'get_category shop=>travel_agency for IT should be shop');

SELECT is(get_subcategory('shop=>travel_agency'::hstore, 'IT'), 'travel_agency', 'get_subcategory shop=>travel_agency for IT should be travel_agency');

SELECT is(get_category('shop=>variety_store'::hstore, 'DE'), 'shop', 'get_category shop=>variety_store for DE should be shop');

SELECT is(get_subcategory('shop=>variety_store'::hstore, 'DE'), 'variety_store', 'get_subcategory shop=>variety_store for DE should be variety_store');

SELECT is(get_category('shop=>variety_store'::hstore, 'AT'), 'shop', 'get_category shop=>variety_store for AT should be shop');

SELECT is(get_subcategory('shop=>variety_store'::hstore, 'AT'), 'variety_store', 'get_subcategory shop=>variety_store for AT should be variety_store');

SELECT is(get_category('shop=>variety_store'::hstore, 'CH'), 'shop', 'get_category shop=>variety_store for CH should be shop');

SELECT is(get_subcategory('shop=>variety_store'::hstore, 'CH'), 'variety_store', 'get_subcategory shop=>variety_store for CH should be variety_store');

SELECT is(get_category('shop=>variety_store'::hstore, 'FR'), 'shop', 'get_category shop=>variety_store for FR should be shop');

SELECT is(get_subcategory('shop=>variety_store'::hstore, 'FR'), 'variety_store', 'get_subcategory shop=>variety_store for FR should be variety_store');

SELECT is(get_category('shop=>variety_store'::hstore, 'IT'), 'shop', 'get_category shop=>variety_store for IT should be shop');

SELECT is(get_subcategory('shop=>variety_store'::hstore, 'IT'), 'variety_store', 'get_subcategory shop=>variety_store for IT should be variety_store');

SELECT is(get_category('shop=>video'::hstore, 'DE'), 'shop', 'get_category shop=>video for DE should be shop');

SELECT is(get_subcategory('shop=>video'::hstore, 'DE'), 'video', 'get_subcategory shop=>video for DE should be video');

SELECT is(get_category('shop=>video'::hstore, 'AT'), 'shop', 'get_category shop=>video for AT should be shop');

SELECT is(get_subcategory('shop=>video'::hstore, 'AT'), 'video', 'get_subcategory shop=>video for AT should be video');

SELECT is(get_category('shop=>video'::hstore, 'CH'), 'shop', 'get_category shop=>video for CH should be shop');

SELECT is(get_subcategory('shop=>video'::hstore, 'CH'), 'video', 'get_subcategory shop=>video for CH should be video');

SELECT is(get_category('shop=>video'::hstore, 'IT'), 'shop', 'get_category shop=>video for IT should be shop');

SELECT is(get_subcategory('shop=>video'::hstore, 'IT'), 'video', 'get_subcategory shop=>video for IT should be video');

SELECT is(get_category('shop=>video_games'::hstore, 'DE'), 'shop', 'get_category shop=>video_games for DE should be shop');

SELECT is(get_subcategory('shop=>video_games'::hstore, 'DE'), 'video_games', 'get_subcategory shop=>video_games for DE should be video_games');

SELECT is(get_category('shop=>video_games'::hstore, 'AT'), 'shop', 'get_category shop=>video_games for AT should be shop');

SELECT is(get_subcategory('shop=>video_games'::hstore, 'AT'), 'video_games', 'get_subcategory shop=>video_games for AT should be video_games');

SELECT is(get_category('shop=>video_games'::hstore, 'CH'), 'shop', 'get_category shop=>video_games for CH should be shop');

SELECT is(get_subcategory('shop=>video_games'::hstore, 'CH'), 'video_games', 'get_subcategory shop=>video_games for CH should be video_games');

SELECT is(get_category('shop=>video_games'::hstore, 'FR'), 'shop', 'get_category shop=>video_games for FR should be shop');

SELECT is(get_subcategory('shop=>video_games'::hstore, 'FR'), 'video_games', 'get_subcategory shop=>video_games for FR should be video_games');

SELECT is(get_category('shop=>video_games'::hstore, 'IT'), 'shop', 'get_category shop=>video_games for IT should be shop');

SELECT is(get_subcategory('shop=>video_games'::hstore, 'IT'), 'video_games', 'get_subcategory shop=>video_games for IT should be video_games');

SELECT is(get_category('shop=>weapons'::hstore, 'DE'), 'shop', 'get_category shop=>weapons for DE should be shop');

SELECT is(get_subcategory('shop=>weapons'::hstore, 'DE'), 'weapons', 'get_subcategory shop=>weapons for DE should be weapons');

SELECT is(get_category('shop=>weapons'::hstore, 'AT'), 'shop', 'get_category shop=>weapons for AT should be shop');

SELECT is(get_subcategory('shop=>weapons'::hstore, 'AT'), 'weapons', 'get_subcategory shop=>weapons for AT should be weapons');

SELECT is(get_category('shop=>weapons'::hstore, 'CH'), 'shop', 'get_category shop=>weapons for CH should be shop');

SELECT is(get_subcategory('shop=>weapons'::hstore, 'CH'), 'weapons', 'get_subcategory shop=>weapons for CH should be weapons');

SELECT is(get_category('shop=>wholesale'::hstore, 'DE'), 'shop', 'get_category shop=>wholesale for DE should be shop');

SELECT is(get_subcategory('shop=>wholesale'::hstore, 'DE'), 'wholesale', 'get_subcategory shop=>wholesale for DE should be wholesale');

SELECT is(get_category('shop=>wholesale'::hstore, 'AT'), 'shop', 'get_category shop=>wholesale for AT should be shop');

SELECT is(get_subcategory('shop=>wholesale'::hstore, 'AT'), 'wholesale', 'get_subcategory shop=>wholesale for AT should be wholesale');

SELECT is(get_category('shop=>wholesale'::hstore, 'CH'), 'shop', 'get_category shop=>wholesale for CH should be shop');

SELECT is(get_subcategory('shop=>wholesale'::hstore, 'CH'), 'wholesale', 'get_subcategory shop=>wholesale for CH should be wholesale');

SELECT is(get_category('shop=>wholesale'::hstore, 'IT'), 'shop', 'get_category shop=>wholesale for IT should be shop');

SELECT is(get_subcategory('shop=>wholesale'::hstore, 'IT'), 'wholesale', 'get_subcategory shop=>wholesale for IT should be wholesale');

SELECT is(get_category('shop=>fishing'::hstore, 'DE'), 'shop', 'get_category shop=>fishing for DE should be shop');

SELECT is(get_subcategory('shop=>fishing'::hstore, 'DE'), 'sports', 'get_subcategory shop=>fishing for DE should be sports');

SELECT is(get_category('shop=>fishing'::hstore, 'AT'), 'shop', 'get_category shop=>fishing for AT should be shop');

SELECT is(get_subcategory('shop=>fishing'::hstore, 'AT'), 'sports', 'get_subcategory shop=>fishing for AT should be sports');

SELECT is(get_category('shop=>fishing'::hstore, 'CH'), 'shop', 'get_category shop=>fishing for CH should be shop');

SELECT is(get_subcategory('shop=>fishing'::hstore, 'CH'), 'sports', 'get_subcategory shop=>fishing for CH should be sports');

SELECT is(get_category('shop=>fishing'::hstore, 'FI'), 'shop', 'get_category shop=>fishing for FI should be shop');

SELECT is(get_subcategory('shop=>fishing'::hstore, 'FI'), 'sports', 'get_subcategory shop=>fishing for FI should be sports');

SELECT is(get_category('shop=>fishing'::hstore, 'FR'), 'shop', 'get_category shop=>fishing for FR should be shop');

SELECT is(get_subcategory('shop=>fishing'::hstore, 'FR'), 'sports', 'get_subcategory shop=>fishing for FR should be sports');

SELECT is(get_category('shop=>fishing'::hstore, 'IT'), 'shop', 'get_category shop=>fishing for IT should be shop');

SELECT is(get_subcategory('shop=>fishing'::hstore, 'IT'), 'sports', 'get_subcategory shop=>fishing for IT should be sports');

SELECT is(get_category('shop=>hunting'::hstore, 'DE'), 'shop', 'get_category shop=>hunting for DE should be shop');

SELECT is(get_subcategory('shop=>hunting'::hstore, 'DE'), 'sports', 'get_subcategory shop=>hunting for DE should be sports');

SELECT is(get_category('shop=>hunting'::hstore, 'AT'), 'shop', 'get_category shop=>hunting for AT should be shop');

SELECT is(get_subcategory('shop=>hunting'::hstore, 'AT'), 'sports', 'get_subcategory shop=>hunting for AT should be sports');

SELECT is(get_category('shop=>hunting'::hstore, 'CH'), 'shop', 'get_category shop=>hunting for CH should be shop');

SELECT is(get_subcategory('shop=>hunting'::hstore, 'CH'), 'sports', 'get_subcategory shop=>hunting for CH should be sports');

SELECT is(get_category('shop=>hunting'::hstore, 'FI'), 'shop', 'get_category shop=>hunting for FI should be shop');

SELECT is(get_subcategory('shop=>hunting'::hstore, 'FI'), 'sports', 'get_subcategory shop=>hunting for FI should be sports');

SELECT is(get_category('shop=>hunting'::hstore, 'FR'), 'shop', 'get_category shop=>hunting for FR should be shop');

SELECT is(get_subcategory('shop=>hunting'::hstore, 'FR'), 'sports', 'get_subcategory shop=>hunting for FR should be sports');

SELECT is(get_category('shop=>hunting'::hstore, 'IT'), 'shop', 'get_category shop=>hunting for IT should be shop');

SELECT is(get_subcategory('shop=>hunting'::hstore, 'IT'), 'sports', 'get_subcategory shop=>hunting for IT should be sports');

SELECT is(get_category('shop=>sports'::hstore, 'DE'), 'shop', 'get_category shop=>sports for DE should be shop');

SELECT is(get_subcategory('shop=>sports'::hstore, 'DE'), 'sports', 'get_subcategory shop=>sports for DE should be sports');

SELECT is(get_category('shop=>sports'::hstore, 'AT'), 'shop', 'get_category shop=>sports for AT should be shop');

SELECT is(get_subcategory('shop=>sports'::hstore, 'AT'), 'sports', 'get_subcategory shop=>sports for AT should be sports');

SELECT is(get_category('shop=>sports'::hstore, 'CH'), 'shop', 'get_category shop=>sports for CH should be shop');

SELECT is(get_subcategory('shop=>sports'::hstore, 'CH'), 'sports', 'get_subcategory shop=>sports for CH should be sports');

SELECT is(get_category('shop=>sports'::hstore, 'FI'), 'shop', 'get_category shop=>sports for FI should be shop');

SELECT is(get_subcategory('shop=>sports'::hstore, 'FI'), 'sports', 'get_subcategory shop=>sports for FI should be sports');

SELECT is(get_category('shop=>sports'::hstore, 'FR'), 'shop', 'get_category shop=>sports for FR should be shop');

SELECT is(get_subcategory('shop=>sports'::hstore, 'FR'), 'sports', 'get_subcategory shop=>sports for FR should be sports');

SELECT is(get_category('shop=>sports'::hstore, 'IT'), 'shop', 'get_category shop=>sports for IT should be shop');

SELECT is(get_subcategory('shop=>sports'::hstore, 'IT'), 'sports', 'get_subcategory shop=>sports for IT should be sports');

SELECT is(get_category('shop=>outdoor'::hstore, 'DE'), 'shop', 'get_category shop=>outdoor for DE should be shop');

SELECT is(get_subcategory('shop=>outdoor'::hstore, 'DE'), 'sports', 'get_subcategory shop=>outdoor for DE should be sports');

SELECT is(get_category('shop=>outdoor'::hstore, 'AT'), 'shop', 'get_category shop=>outdoor for AT should be shop');

SELECT is(get_subcategory('shop=>outdoor'::hstore, 'AT'), 'sports', 'get_subcategory shop=>outdoor for AT should be sports');

SELECT is(get_category('shop=>outdoor'::hstore, 'CH'), 'shop', 'get_category shop=>outdoor for CH should be shop');

SELECT is(get_subcategory('shop=>outdoor'::hstore, 'CH'), 'sports', 'get_subcategory shop=>outdoor for CH should be sports');

SELECT is(get_category('shop=>outdoor'::hstore, 'FI'), 'shop', 'get_category shop=>outdoor for FI should be shop');

SELECT is(get_subcategory('shop=>outdoor'::hstore, 'FI'), 'sports', 'get_subcategory shop=>outdoor for FI should be sports');

SELECT is(get_category('shop=>outdoor'::hstore, 'FR'), 'shop', 'get_category shop=>outdoor for FR should be shop');

SELECT is(get_subcategory('shop=>outdoor'::hstore, 'FR'), 'sports', 'get_subcategory shop=>outdoor for FR should be sports');

SELECT is(get_category('shop=>outdoor'::hstore, 'IT'), 'shop', 'get_category shop=>outdoor for IT should be shop');

SELECT is(get_subcategory('shop=>outdoor'::hstore, 'IT'), 'sports', 'get_subcategory shop=>outdoor for IT should be sports');

SELECT is(get_category('amenity=>fuel'::hstore, 'FR'), 'mobility', 'get_category amenity=>fuel for FR should be mobility');

SELECT is(get_subcategory('amenity=>fuel'::hstore, 'FR'), 'fuel', 'get_subcategory amenity=>fuel for FR should be fuel');

SELECT is(get_category('shop=>gas'::hstore, 'FR'), 'mobility', 'get_category shop=>gas for FR should be mobility');

SELECT is(get_subcategory('shop=>gas'::hstore, 'FR'), 'fuel', 'get_subcategory shop=>gas for FR should be fuel');

SELECT is(get_category('amenity=>car_rental'::hstore, 'FR'), 'mobility', 'get_category amenity=>car_rental for FR should be mobility');

SELECT is(get_subcategory('amenity=>car_rental'::hstore, 'FR'), 'car_rental', 'get_subcategory amenity=>car_rental for FR should be car_rental');

SELECT is(get_category('shop=>bicycle'::hstore, 'FR'), 'mobility', 'get_category shop=>bicycle for FR should be mobility');

SELECT is(get_subcategory('shop=>bicycle'::hstore, 'FR'), 'bicycle', 'get_subcategory shop=>bicycle for FR should be bicycle');

SELECT is(get_category('shop=>car_parts'::hstore, 'FR'), 'mobility', 'get_category shop=>car_parts for FR should be mobility');

SELECT is(get_subcategory('shop=>car_parts'::hstore, 'FR'), 'car', 'get_subcategory shop=>car_parts for FR should be car');

SELECT is(get_category('shop=>car_repair'::hstore, 'FR'), 'mobility', 'get_category shop=>car_repair for FR should be mobility');

SELECT is(get_subcategory('shop=>car_repair'::hstore, 'FR'), 'car', 'get_subcategory shop=>car_repair for FR should be car');

SELECT is(get_category('shop=>car'::hstore, 'DE'), 'mobility', 'get_category shop=>car for DE should be mobility');

SELECT is(get_subcategory('shop=>car'::hstore, 'DE'), 'car_dealer', 'get_subcategory shop=>car for DE should be car_dealer');

SELECT is(get_category('shop=>car'::hstore, 'AT'), 'mobility', 'get_category shop=>car for AT should be mobility');

SELECT is(get_subcategory('shop=>car'::hstore, 'AT'), 'car_dealer', 'get_subcategory shop=>car for AT should be car_dealer');

SELECT is(get_category('shop=>car'::hstore, 'CH'), 'mobility', 'get_category shop=>car for CH should be mobility');

SELECT is(get_subcategory('shop=>car'::hstore, 'CH'), 'car_dealer', 'get_subcategory shop=>car for CH should be car_dealer');

SELECT is(get_category('shop=>car'::hstore, 'FR'), 'mobility', 'get_category shop=>car for FR should be mobility');

SELECT is(get_subcategory('shop=>car'::hstore, 'FR'), 'car_dealer', 'get_subcategory shop=>car for FR should be car_dealer');

SELECT is(get_category('shop=>car'::hstore, 'IT'), 'mobility', 'get_category shop=>car for IT should be mobility');

SELECT is(get_subcategory('shop=>car'::hstore, 'IT'), 'car_dealer', 'get_subcategory shop=>car for IT should be car_dealer');

SELECT is(get_category('amenity=>car_wash'::hstore, 'AT'), 'mobility', 'get_category amenity=>car_wash for AT should be mobility');

SELECT is(get_subcategory('amenity=>car_wash'::hstore, 'AT'), 'car_wash', 'get_subcategory amenity=>car_wash for AT should be car_wash');

SELECT is(get_category('amenity=>car_wash'::hstore, 'CH'), 'mobility', 'get_category amenity=>car_wash for CH should be mobility');

SELECT is(get_subcategory('amenity=>car_wash'::hstore, 'CH'), 'car_wash', 'get_subcategory amenity=>car_wash for CH should be car_wash');

SELECT is(get_category('amenity=>car_wash'::hstore, 'DE'), 'mobility', 'get_category amenity=>car_wash for DE should be mobility');

SELECT is(get_subcategory('amenity=>car_wash'::hstore, 'DE'), 'car_wash', 'get_subcategory amenity=>car_wash for DE should be car_wash');

SELECT is(get_category('amenity=>car_wash'::hstore, 'IT'), 'mobility', 'get_category amenity=>car_wash for IT should be mobility');

SELECT is(get_subcategory('amenity=>car_wash'::hstore, 'IT'), 'car_wash', 'get_subcategory amenity=>car_wash for IT should be car_wash');

SELECT is(get_category('amenity=>car_wash'::hstore, 'FR'), 'mobility', 'get_category amenity=>car_wash for FR should be mobility');

SELECT is(get_subcategory('amenity=>car_wash'::hstore, 'FR'), 'car_wash', 'get_subcategory amenity=>car_wash for FR should be car_wash');

SELECT is(get_category('shop=>motorcycle'::hstore, 'DE'), 'mobility', 'get_category shop=>motorcycle for DE should be mobility');

SELECT is(get_subcategory('shop=>motorcycle'::hstore, 'DE'), 'motorcycle', 'get_subcategory shop=>motorcycle for DE should be motorcycle');

SELECT is(get_category('shop=>motorcycle'::hstore, 'AT'), 'mobility', 'get_category shop=>motorcycle for AT should be mobility');

SELECT is(get_subcategory('shop=>motorcycle'::hstore, 'AT'), 'motorcycle', 'get_subcategory shop=>motorcycle for AT should be motorcycle');

SELECT is(get_category('shop=>motorcycle'::hstore, 'CH'), 'mobility', 'get_category shop=>motorcycle for CH should be mobility');

SELECT is(get_subcategory('shop=>motorcycle'::hstore, 'CH'), 'motorcycle', 'get_subcategory shop=>motorcycle for CH should be motorcycle');

SELECT is(get_category('shop=>motorcycle'::hstore, 'FR'), 'mobility', 'get_category shop=>motorcycle for FR should be mobility');

SELECT is(get_subcategory('shop=>motorcycle'::hstore, 'FR'), 'motorcycle', 'get_subcategory shop=>motorcycle for FR should be motorcycle');

SELECT is(get_category('shop=>motorcycle'::hstore, 'IT'), 'mobility', 'get_category shop=>motorcycle for IT should be mobility');

SELECT is(get_subcategory('shop=>motorcycle'::hstore, 'IT'), 'motorcycle', 'get_subcategory shop=>motorcycle for IT should be motorcycle');

SELECT is(get_category('amenity=>vending_machine, vending=>bicycle_tube'::hstore, 'FR'), 'mobility', 'get_category amenity=>vending_machine, vending=>bicycle_tube for FR should be mobility');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>bicycle_tube'::hstore, 'FR'), 'bicycle_tube', 'get_subcategory amenity=>vending_machine, vending=>bicycle_tube for FR should be bicycle_tube');

SELECT is(get_category('amenity=>vending_machine, vending=>public_transport_tickets'::hstore, 'FR'), 'mobility', 'get_category amenity=>vending_machine, vending=>public_transport_tickets for FR should be mobility');

SELECT is(get_subcategory('amenity=>vending_machine, vending=>public_transport_tickets'::hstore, 'FR'), 'public_transport_tickets', 'get_subcategory amenity=>vending_machine, vending=>public_transport_tickets for FR should be public_transport_tickets');

SELECT is(get_category('shop=>tyres'::hstore, 'DE'), 'mobility', 'get_category shop=>tyres for DE should be mobility');

SELECT is(get_subcategory('shop=>tyres'::hstore, 'DE'), 'tyres', 'get_subcategory shop=>tyres for DE should be tyres');

SELECT is(get_category('shop=>tyres'::hstore, 'AT'), 'mobility', 'get_category shop=>tyres for AT should be mobility');

SELECT is(get_subcategory('shop=>tyres'::hstore, 'AT'), 'tyres', 'get_subcategory shop=>tyres for AT should be tyres');

SELECT is(get_category('shop=>tyres'::hstore, 'CH'), 'mobility', 'get_category shop=>tyres for CH should be mobility');

SELECT is(get_subcategory('shop=>tyres'::hstore, 'CH'), 'tyres', 'get_subcategory shop=>tyres for CH should be tyres');

SELECT is(get_category('shop=>tyres'::hstore, 'FR'), 'mobility', 'get_category shop=>tyres for FR should be mobility');

SELECT is(get_subcategory('shop=>tyres'::hstore, 'FR'), 'tyres', 'get_subcategory shop=>tyres for FR should be tyres');

SELECT is(get_category('shop=>tyres'::hstore, 'IT'), 'mobility', 'get_category shop=>tyres for IT should be mobility');

SELECT is(get_subcategory('shop=>tyres'::hstore, 'IT'), 'tyres', 'get_subcategory shop=>tyres for IT should be tyres');

SELECT * FROM finish();
ROLLBACK;
