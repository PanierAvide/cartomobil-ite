/*
 * Generate SQL functions to handle POI categories in DB
 */

const path = require('path');
const fs = require('fs');

const CATEGORIES_JSON = path.join(__dirname, "..", "categories.json");
const CATEGORIES_SQL = path.join(__dirname, "..", "db", "categories_functions.sql");
const POI_SQL = path.join(__dirname, "..", "db", "update_poi.sql");

const catg = require(CATEGORIES_JSON);


/**
 * Converts a list of OSM tags for a category into SQL conditions
 */
function tagsPerCategoryToSql(tpc) {
	const sqlPerCategory = {};
	Object.entries(tpc).forEach(e => {
		const [ catId, tags ] = e;
		const sqlCond = tags.map(kv => {
			return Object.entries(kv).map(kv => {
				const [ k, v ] = kv;

				if(k === "areas") {
					const rightpart = v.length === 1 ? `LIKE '${v[0]}%'` : `SIMILAR TO '(${v.join("|")})%'`;
					return `area ${rightpart}`;
				}
				else if(k === "-areas") {
					const rightpart = v.length === 1 ? `LIKE '${v[0]}%'` : `SIMILAR TO '(${v.join("|")})%'`;
					return `area NOT ${rightpart}`;
				}
				else {
					const values = v.split("|");
					let rightpart;
					if(values.length === 1) {
						rightpart = values[0] === "*" ? `!= ''` : `= '${values[0].replace(/'(?!')/g, "''")}'`;
					}
					else {
						rightpart = values.includes('*') ? `!= ''` : `IN (${values.map(v => `'${v.replace(/'(?!')/g, "''")}'`).join(", ")})`;
					}
					return `tags->'${k}' ${rightpart}`;
				}
			})
			.join(" AND ");
		});

		sqlPerCategory[catId] = sqlCond.length === 1 ? sqlCond : sqlCond.map(c => `(${c})`).join(" OR ");
	});

	// Generate string for list of conditions
	let conditionsSql = '';
	Object.entries(sqlPerCategory).forEach((e, i) => {
		const [ cat, sql ] = e;

		conditionsSql += `${i === 0 ? '' : '\n\tELS'}IF ${sql} THEN
		result := '${cat}';`;
	});

	return conditionsSql;
}


// Find all tags for a category
const tagsPerCategory = {};

Object.entries(catg.categories).forEach(e => {
	const [ catId, cat ] = e;
	const singleTags = {};
	tagsPerCategory[catId] = Object.values(cat.subcategories)
	.filter(subcat => subcat.osm_tags)
	.map(subcat => {
		let result;
		if(subcat.osm_filter_tags) {
			result = [];
			subcat.osm_tags.forEach(tags => {
				subcat.osm_filter_tags.forEach(ftags => {
					result.push(Object.assign({}, tags, ftags));
				});
			});
		}
		else {
			result = subcat.osm_tags;
		}

		if(subcat.areas && subcat.areas !== "all") {
			result = result.map(obj => Object.assign({}, obj, { areas: subcat.areas }));
		}

		if(subcat["-areas"]) {
			result = result.map(obj => Object.assign({}, obj, { "-areas": subcat["-areas"] }));
		}

		return result;
	}).flat();

	// Merge single tags
	tagsPerCategory[catId].forEach(kv => {
		if(Object.keys(kv).length === 1) {
			const k = Object.keys(kv)[0];
			if(!singleTags[k]) {
				singleTags[k] = [ kv[k] ];
			}
			else {
				singleTags[k].push(kv[k]);
			}
		}
	});

	tagsPerCategory[catId] = tagsPerCategory[catId].filter(kv => Object.keys(kv).length !== 1 || !Object.keys(singleTags).includes(Object.keys(kv)[0]));
	Object.entries(singleTags).forEach(e => {
		tagsPerCategory[catId].push({ [e[0]]: e[1].join("|") });
	});
});

const catfct = `CREATE OR REPLACE FUNCTION get_category1(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
DECLARE
	result VARCHAR;
BEGIN
	${tagsPerCategoryToSql(tagsPerCategory)}
	ELSE
		result := NULL;
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql IMMUTABLE;
`;


// Find all tags for subcategories
const tagsPerSubcategory = {};
Object.values(catg.categories).forEach((cat, index) => {
	Object.entries(cat.subcategories).forEach(([ subcatId, subcat ], index2) => {
		if (subcat.osm_tags) {
			if (!tagsPerSubcategory[subcatId]) {
				tagsPerSubcategory[subcatId] = subcat.osm_tags;
			}

			if ((subcat.areas && subcat.areas !== "all") || subcat['-areas']) {
				const minusArea = subcat['-areas'] || [];
				const areas = (subcat.areas || catg.countries).filter(a => !minusArea.includes(a));

				tagsPerSubcategory[subcatId] = tagsPerSubcategory[subcatId].map(tags => {
					if (tags.areas) {
						tags.areas.push(...areas);
						return tags;
					} else {
						return { ...tags, areas };
					}
				});
			}
		}
	});
});

const subcatfct = `CREATE OR REPLACE FUNCTION get_category2(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
DECLARE
	result VARCHAR;
BEGIN
	${tagsPerCategoryToSql(tagsPerSubcategory)}
	ELSE
		result := 'other';
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql IMMUTABLE;
`;


// Look up all tags for subfilters
const tagsPerSubfilter = {};
Object.values(catg.categories).forEach((cat, index) => {
	Object.entries(cat.subcategories).forEach(([ subcatId, subcat ], index2) => {
		if (subcat.subfilters) {
			Object.entries(subcat.subfilters).forEach(([ subfilterId, subfilter ], index3) => {
				if (!tagsPerSubfilter[subfilterId]) {
					tagsPerSubfilter[subfilterId] = subfilter.osm_tags.map(tags => Object.assign({}, tags, { cat2: subcatId }));
				}

				if ((subcat.areas && subcat.areas !== "all") || subcat['-areas']) {
					const minusArea = subcat['-areas'] || [];
					const areas = (subcat.areas || catg.countries).filter(a => !minusArea.includes(a));

					tagsPerSubfilter[subfilterId] = tagsPerSubfilter[subfilterId].map(tags => {
						if (tags.areas) {
							tags.areas.push(...areas);
							return tags;
						} else {
							return { ...tags, areas };
						}
					});
				}
			});
		}
	});
});

const subfilterfct = `CREATE OR REPLACE FUNCTION get_category3(tags HSTORE, area VARCHAR DEFAULT 'FR') RETURNS VARCHAR AS $$
DECLARE
	result VARCHAR;
BEGIN
	tags := tags::hstore || CONCAT('cat2=>', get_category2(tags, area))::hstore;
	${tagsPerCategoryToSql(tagsPerSubfilter)}
	ELSE
		result := 'other';
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql IMMUTABLE;
`;


// Write whole SQL into file
const wholeSql = `--
-- AUTOMATICALLY GENERATED SCRIPT
-- DO NOT EDIT DIRECTLY, EDIT INSTEAD "/categories.json"
-- THEN RUN "yarn run categories" TO UPDATE
--

-- Function for getting normalized category (cat1) from OSM tags
${catfct}

-- Function for getting normalized subcategory (cat2) from OSM tags
${subcatfct}

-- Function for getting normalized subfilter (cat3) from OSM tags
${subfilterfct}`;

fs.writeFile(CATEGORIES_SQL, wholeSql, (err) => {
	if(err) { throw new Error(err); }
});


// Edit categories filter in update_poi.sql
const tagsForCondition = {};

Object.values(catg.categories)
.map(cat => (
	Object.values(cat.subcategories)
	.filter(subcat => subcat.osm_tags)
	.map(subcat => subcat.osm_tags)
	.flat()
))
.flat()
.forEach(e => {
	Object.entries(e).forEach(kv => {
		const [ k, v ] = kv;
		if(catg.sql_columns.includes(k)) {
			if(!tagsForCondition[k]) {
				tagsForCondition[k] = new Set();
			}
			v.split("|").map(sv => tagsForCondition[k].add(sv));
		}
	});
});

const sqlCond = `\n\t(`+Object.entries(tagsForCondition).map(e => {
	let txt = `"${e[0]}" `;
	const values = [...e[1]];
	txt += values.includes('*') ? `!= ''` : `IN (${values.sort().map(v => `'${v}'`).join(', ')})`;
	return txt;
}).join(" OR ")+`) --CATEGORIES\n`;

fs.readFile(POI_SQL, 'utf8', (err, txt) => {
	if(err) { throw new Error(err); }

	const newTxt = txt.replace(/\n.*--CATEGORIES\n/g, sqlCond);

	fs.writeFile(POI_SQL, newTxt, 'utf8', (err) => {
		if(err) { throw new Error(err); }
	});
});
