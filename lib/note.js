import { getFormById } from './form';
import { categories } from '../categories.json';
import equals from 'fast-deep-equal';

// Convert categories into a tag -> cat1/2/3 mapping
const tagsToCategories = [];
Object.entries(categories).forEach(c1 => {
  const [ cat1, cat1Obj ] = c1;
  Object.entries(cat1Obj.subcategories).forEach(c2 => {
    const [ cat2, cat2Obj ] = c2;

    tagsToCategories.push({
      cat1,
      cat2,
      cat3: "other",
      tags: cat2Obj.osm_tags
    });

    if(cat2Obj.subfilters) {
      Object.entries(cat2Obj.subfilters).forEach(c3 => {
        const [ cat3, cat3Obj ] = c3;

        tagsToCategories.push({
          cat1,
          cat2,
          cat3,
          tags: cat3Obj.osm_tags
        });
      });
    }
  });
});

function findHashtagsInText(str) {
  const regex = /\s(\#[a-zA-Z0-9]+)/g;
  return [...str.matchAll(regex)].map(m => m[1].toLowerCase());
}

function getTagsFromText(str) {
  const tags = {};
  str.split("\n").forEach(line => {
    const parts = line.split("=");
    if(parts.length >= 2) {
      const key = parts[0];
      const value = parts.slice(1).join("=");
      if(/^[a-zA-Z:_\-0-9]+$/.test(key.trim()) && value.trim().length > 0) {
        tags[key.trim()] = value.trim();
      }
    }
  });
  return tags;
}

function matchesTags(featureTags, patternTags) {
  let match = true;

  Object.entries(patternTags).forEach(pte => {
    if(featureTags[pte[0]] !== pte[1]) {
      if(pte[1] === "*") {
        if(featureTags[pte[0]] === undefined) {
          match = false;
        }
      }
      else if(pte[1].includes("|")) {
        if(pte[1].split("|").filter(part => featureTags[pte[0]] === part).length === 0) {
          match = false
        }
      }
      else {
        match = false;
      }
    }
  });

  return match;
}

function getCategory(cat, tags) {
  const res = tagsToCategories.filter(ttc => ttc.tags.find(ttct => matchesTags(tags, ttct)) !== undefined).pop();
  return res ? res['cat'+cat] : "other";
}

export function osmNoteToFeature(osm) {
  const noteText = osm.properties.comments[0].text;
  const hashtags = findHashtagsInText(noteText).map(h => h.substring(1));
  const tags = getTagsFromText(noteText);
  const dateParts = osm.properties.comments[0].date.split(" ");

  return {
    type: "Feature",
    geometry: osm.geometry,
    properties: {
      fid: 'o'+osm.properties.id,
      id: 'o'+osm.properties.id,
      name: tags.name,
      cat1: getCategory(1, tags) === "other" ? (tags.obstacle ? 'barrier' : (tags.note ? 'note' : 'other')) : getCategory(1, tags),
      cat2: getCategory(2, tags),
      cat3: getCategory(3, tags),
      status: tags.wheelchair,
      status_order: 5,
      tags,
      last_update: dateParts[0]+"T"+dateParts[1]
    }
  };
}
