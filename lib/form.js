import { categories, forms } from '../categories.json';

const merge = (target, source) => {
  // Iterate through `source` properties and if an `Object` set property to merge of `target` and `source` properties
  for (const key of Object.keys(source)) {
    if (source[key] instanceof Object && key in target) Object.assign(source[key], merge(target[key], source[key]))
  }

  // Join `target` and modified `source`
  Object.assign(target || {}, source)
  return target
};

export function getForm(place) {
  if(
    place && place.properties
    && place.properties.normalized_cat && place.properties.cat
    && categories[place.properties.normalized_cat]
    && categories[place.properties.normalized_cat].subcategories[place.properties.cat]
  ) {
    // Single form
    if(
      categories[place.properties.normalized_cat].subcategories[place.properties.cat].form
      || categories[place.properties.normalized_cat].form
    ) {
      return forms[
        categories[place.properties.normalized_cat].subcategories[place.properties.cat].form
        || categories[place.properties.normalized_cat].form
      ];
    }
    // Multi-forms
    else if(
      categories[place.properties.normalized_cat].subcategories[place.properties.cat].forms
      || categories[place.properties.normalized_cat].forms
    ) {
      let res = {};
      const formList = (categories[place.properties.normalized_cat].subcategories[place.properties.cat].forms || categories[place.properties.normalized_cat].forms)
        .map(fid => JSON.parse(JSON.stringify(forms[fid])))
        .forEach(f => {
          res = merge(f, res);
        });
      return res;
    }
  }
  else { return null; }
}

export function getModelForForm(form, place, key = null) {
  let model = {};

  if(form.properties) {
    Object.keys(form.properties).forEach(key => {
      model[key] = getModelForForm(form.properties[key], place, key);
    });
  }
  else if(form.oneOf) {
    form.oneOf.forEach(sub => {
      if(sub.const) {
        model = getModelForForm(sub, place, key);
      }
      else {
        Object.assign(model, getModelForForm(sub, place, key));
      }
    });
  }
  else {
    model = place.properties.tags[key] || place.properties[key] || (form.format === "text" ? "" : "null");
  }

  return model;
}

export function getTagsFromModel(model) {
  let tags = {};

  Object.entries(model).forEach(e => {
    const [k,v] = e;
    if(typeof v === "object") {
      Object.assign(tags, getTagsFromModel(v));
    }
    else {
      tags[k] = v.toString();
      if(tags[k] === "") { tags[k] = "null"; }
    }
  });

  return tags;
}
