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

function addDefaults(form) {
  if(form.properties) {
    Object.values(form.properties).forEach(sub => {
      addDefaults(sub);
    });
  }
  else if(form.oneOf) {
    if(form.oneOf.length > 0) {
      form.default = {};

      if(form.oneOf[form.oneOf.length-1].properties) {
        Object.entries(form.oneOf[form.oneOf.length-1].properties).forEach(e => {
          form.default[e[0]] = e[1].const;
        });
      }
      else if(form.oneOf[form.oneOf.length-1].const) {
        form.default = form.oneOf[form.oneOf.length-1].const;
      }
    }
    form.oneOf.forEach(sub => {
      addDefaults(sub);
    });
  }

  return form;
}

export function getForm(place) {
  if(
    place && place.properties
    && place.properties.cat1 && place.properties.cat2
    && categories[place.properties.cat1]
    && categories[place.properties.cat1].subcategories[place.properties.cat2]
  ) {
    // Single form
    if(
      categories[place.properties.cat1].subcategories[place.properties.cat2].form
      || categories[place.properties.cat1].form
    ) {
      return addDefaults(forms[
        categories[place.properties.cat1].subcategories[place.properties.cat2].form
        || categories[place.properties.cat1].form
      ]);
    }
    // Multi-forms
    else if(
      categories[place.properties.cat1].subcategories[place.properties.cat2].forms
      || categories[place.properties.cat1].forms
    ) {
      let res = {};
      const formList = (categories[place.properties.cat1].subcategories[place.properties.cat2].forms || categories[place.properties.cat1].forms)
        .map(fid => JSON.parse(JSON.stringify(forms[fid])))
        .forEach(f => {
          res = merge(f, res);
        });
      return addDefaults(res);
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

export function getFormOptions(locale, readOnly) {
  return {
    locale: locale,
    icons: {
      "calendar": "osm-blog",
      "clock": "osm-time",
      "info": "osm-info",
      "add": "osm-plus",
      "edit": "",
      "delete": "osm-close"
    },
    childrenClass: readOnly ? "pl-0 form-field-readonly" : "pl-2",
    disableAll: readOnly
  };
}

const testModel = m => m && m !== "null" && m !== "";
export function getReadOnlyForm(form, model) {
  let newForm;

  if(form.oneOf) {
    newForm = Object.assign({}, form);
    newForm.oneOf = form.oneOf
      .filter(sub => (
        !sub.properties
        || Object.values(sub.properties).filter(v => v.const).length === 0
        || Object.entries(sub.properties).filter(e => model[e[0]] === e[1].const && testModel(model[e[0]])).length === Object.values(sub.properties).filter(v => v.const).length
      ))
      .map(sub => getReadOnlyForm(sub, model))
      .filter(sub => sub);

    if(newForm.oneOf.length === 0 || (newForm.oneOf.length === 1 && newForm.oneOf[0]["x-hide-readOnly"])) {
      newForm = undefined;
    }
  }
  else if(form.properties) {
    newForm = Object.assign({}, form);
    newForm.properties = {};
    Object.keys(form.properties).forEach(k => {
      if(testModel(model[k])) {
        const v = getReadOnlyForm(form.properties[k], model[k]);
        if(v) {
          newForm.properties[k] = v;
        }
      }
    });

    if(Object.keys(newForm.properties).length === 0) {
      newForm = undefined;
    }
  }
  else if(form["x-hide-readOnly"]) {
    newForm = undefined;
  }
  else if(testModel(model)) {
    newForm = Object.assign({}, form);
  }

  if(newForm && newForm.description) {
    delete newForm.description;
  }

  return newForm;
}
