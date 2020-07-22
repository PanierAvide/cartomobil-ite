function isRelatedToArea(list, area) {
  if(list === "all" || list.includes(area)) {
    return true;
  }
  // If area is a subcountry, look for country
  else if(area.length > 2) {
    const country = area.substring(0, 2);
    return list.includes(country);
  }
  else {
    return false;
  }
}

function filterSubCategories(subcategories, area) {
  return Object.keys(subcategories).reduce((memo, subcategory) => {
    const areas = subcategories[subcategory].areas;
    const minusAreas = subcategories[subcategory]["-areas"];
    const mapfilter = subcategories[subcategory].mapfilter;
    const minusMapfilter = subcategories[subcategory]["-mapfilter"];

    if (
      ((areas && isRelatedToArea(areas, area)) || (minusAreas && !isRelatedToArea(minusAreas, area)))
      && (!minusMapfilter || !isRelatedToArea(minusMapfilter, area))
      && (!mapfilter || isRelatedToArea(mapfilter, area))
    ) {
      memo[subcategory] = subcategories[subcategory];
    }
    return memo;
  }, {});
}

export function decodeFilter(filter) {
  return filter.split("/").map((part, i) => {
    if(i === 0) { return part; }
    else {
      const res = part.split(",").filter(p => p !== null && p !== undefined && p.trim() !== "");
      return res.length === 0 ? null : res;
    }
  })
  .filter(part => part !== null);
}

export function encodeFilter(category, subcategories, subfilters) {
  const parts = [];

  if(category) {
    parts.push(category);

    if(subcategories && subcategories.length > 0) {
      parts.push(subcategories.join(","));

      if(subfilters && subfilters.length > 0) {
        parts.push(subfilters.join(","));
      }
    }
  }

  return parts.join("/");
}

export default function categoriesForArea(data, area) {
  return Object.keys(data.categories).reduce((memo, category) => {
    const minusMapfilter = data.categories[category]["-mapfilter"];
    const mapfilter = data.categories[category].mapfilter;

    const subcategories = filterSubCategories(data.categories[category].subcategories, area);

    if (
      Object.keys(subcategories).length > 0
      && (!minusMapfilter || !isRelatedToArea(minusMapfilter, area))
      && (!mapfilter || isRelatedToArea(mapfilter, area))
    ) {
      memo[category] = { subcategories };
    }
    return memo;
  }, {});
}

export function availableSubFilters(categories, filter) {
  const [ category, subcategory ] = filter.split('/');
  if (!categories[category]) {
    return [];
  }
  const subcategories = categories[category].subcategories;
  let subfilters = [];
  if (subcategory && subcategories[subcategory] && subcategories[subcategory].subfilters) {
    subfilters = Object.keys(subcategories[subcategory].subfilters);
  }
  return subfilters;
}
