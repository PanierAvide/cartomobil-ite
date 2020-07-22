import categoriesForCountry, { availableSubFilters, encodeFilter, decodeFilter } from '../lib/categories';

describe('categoriesForCountry', () => {
  it('returns all categories for the given country', () => {
    const result = categoriesForCountry({
      categories: {
        police: {
          subcategories: {
            police: { areas: 'all' },
          }
        }
      }
    }, 'FR');
    expect(Object.keys(result)).toEqual(['police']);
    expect(Object.keys(result.police.subcategories)).toEqual(['police']);
  });

  it('filter categories available only to others countries', () => {
    const result = categoriesForCountry({
      categories: {
        police: {
          subcategories: {
            police: { areas: 'all' }
          }
        },
        police2: {
          subcategories: {
            police: { areas: ['DE'] }
          }
        }
      }
    }, 'FR');
    expect(Object.keys(result)).toEqual(['police']);
    expect(Object.keys(result.police.subcategories)).toEqual(['police']);
  });

  it('include only subcategories available to the current country', () => {
    const result = categoriesForCountry({
      categories: {
        police: {
          subcategories: {
            police: { areas: 'all' },
            police2: { areas: ['DE', 'FR'] }
          }
        },
        police3: {
          subcategories: {
            police: { areas: ['DE'] }
          }
        }
      }
    }, 'FR');
    expect(Object.keys(result)).toEqual(['police']);
    expect(Object.keys(result.police.subcategories)).toEqual(['police', 'police2']);
  });
});

describe('availableSubFilters', () => {
  const categories = {
    police: {
      subcategories: {
        police: { subfilters: { "gendarmerie": {}, "police": {} } },
        police2: { },
        police3: { subfilters: { "gendarmerie": {} } },
        police4: { subfilters: { "gendarmerie": {} } }
      }
    }
  };

  it('when a category is selected', () => {
    const result = availableSubFilters(categories, 'police');
    expect(result).toEqual([]);
  });

  it('when a subcategory is selected', () => {
    let result = availableSubFilters(categories, 'police/police');
    expect(result).toEqual(['gendarmerie', 'police']);

    result = availableSubFilters(categories, 'police/police2');
    expect(result).toEqual([]);

    result = availableSubFilters(categories, 'police/police3');
    expect(result).toEqual(['gendarmerie']);

    result = availableSubFilters(categories, 'police/doesnotexist');
    expect(result).toEqual([]);
  });

  it('when a category doesnt exists', () => {
    let result = availableSubFilters(categories, 'police2');
    expect(result).toEqual([]);
  });
});

describe('encodeFilter', () => {
  it('handles cat only', () => {
    const result = encodeFilter('administration');
    expect(result).toEqual('administration');
  });

  it('handles cat + subcat', () => {
    const result = encodeFilter('administration', ['townhall']);
    expect(result).toEqual('administration/townhall');
  });

  it('handles cat + subcats', () => {
    const result = encodeFilter('administration', ['government', 'townhall']);
    expect(result).toEqual('administration/government,townhall');
  });

  it('handles cat + subcat + subfilter', () => {
    const result = encodeFilter('administration', ['government'], ['pref']);
    expect(result).toEqual('administration/government/pref');
  });

  it('handles cat + subcat + subfilters', () => {
    const result = encodeFilter('administration', ['government'], ['pref','etat']);
    expect(result).toEqual('administration/government/pref,etat');
  });

  it('cleans empty arrays', () => {
    const result = encodeFilter('administration', ['government'], []);
    expect(result).toEqual('administration/government');
  });
});

describe('decodeFilter', () => {
  it('handles cat only', () => {
    const result = decodeFilter('administration');
    expect(result).toEqual(['administration']);
  });

  it('handles cat + subcat', () => {
    const result = decodeFilter('administration/townhall');
    expect(result).toEqual(['administration', ['townhall']]);
  });

  it('handles cat + subcats', () => {
    const result = decodeFilter('administration/government,townhall');
    expect(result).toEqual(['administration', ['government', 'townhall']]);
  });

  it('handles cat + subcat + subfilter', () => {
    const result = decodeFilter('administration/government/pref');
    expect(result).toEqual(['administration', ['government'], ['pref']]);
  });

  it('handles cat + subcat + subfilters', () => {
    const result = decodeFilter('administration/government/pref,etat');
    expect(result).toEqual(['administration', ['government'], ['pref','etat']]);
  });

  it('cleans empty arrays', () => {
    const result = decodeFilter('administration/government/');
    expect(result).toEqual(['administration', ['government']]);
  });
});
