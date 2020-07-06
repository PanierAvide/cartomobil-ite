export function findImage({ lng, lat }, pano, users, clientId) {
  const url = new URL("https://a.mapillary.com/v3/images");
  const params = {
    client_id: clientId,
    closeto: [lng, lat].join(','),
    radius: 30
  };

  if(pano) {
    params.pano = pano;
  }

  if(users) {
    params.userkeys = users.join(',');
  }

  url.search = new URLSearchParams(params);
  return fetch(url)
    .then(e => e.json())
    .then((e) => {
      if (e.features.length > 0) {
        return e.features[0].properties.key;
      }
      else {
        return null;
      }
    });
}

export function getImage(key, clientId) {
  const url = new URL(`https://a.mapillary.com/v3/images/${key}`);
  const params = {
    client_id: clientId
  };
  url.search = new URLSearchParams(params);
  return fetch(url).then(e => e.json());
}

export function mapillaryViewerFilter(users, pano) {
  const filters = [
    'all',
    ['==', 'pano', pano]
  ];
  if(users) {
    filters.push(['in', 'userKey', ...users]);
  }
  return filters;
}
