import categoriesForCountry, { availableSubFilters } from '../lib/categories';

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
