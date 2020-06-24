import { categories, forms } from '../categories.json';

const statuses = {
  yes: 'success',
  limited: 'success',
  unknown: 'warning',
  no: 'error'
};

export function colorForStatus(status)  {
  return statuses[status];
}

export function rawColorForStatus(status, theme) {
  const statuses = {
    yes: theme.success,
    limited: theme.success,
    unknown: '#9E9E9E',
    no: theme.error
  };
  return statuses[status];
}

export function getForm(place) {
  if(
    place && place.properties
    && place.properties.normalized_cat && place.properties.cat
    && categories[place.properties.normalized_cat]
    && categories[place.properties.normalized_cat].subcategories[place.properties.cat]
    && categories[place.properties.normalized_cat].subcategories[place.properties.cat].form
  ) {
        return forms[categories[place.properties.normalized_cat].subcategories[place.properties.cat].form];
  }
  else { return null; }
}
