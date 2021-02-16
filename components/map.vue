<template>
  <MglMap
    :center="mapCenter"
    :zoom="mapZoom"
    :map-style="mapStyle"
    :max-bounds="mapLimits"
    :accessToken="accessToken"
    :maxZoom="20"
    @load="load"
    @rotateend="maprotated"
    @update:center="updateMapCenter"
    @update:zoom="updateMapZoom"
    @update:bounds="updateMapBounds"
    @move="updateMapCenterDynamic"
    @moveend="refreshMapBounds"
    @zoomend="refreshMapBounds"
    @rotate="refreshMapBounds"
    @pitch="refreshMapBounds"
  >
    <MglMarker
      v-if="place"
      :key="place.id"
      :coordinates="place.geometry.coordinates"
      :offset="{ x: 0, y: -15 }"
      :color="placeColor"
    />
    <MglMarker
      v-if="highlightPlace"
      :coordinates="highlightPlace.geometry.coordinates"
      :offset="{ x: 0, y: -15 }"
      color="red"
    />
    <MglMarker
      v-if="newPlaceType"
      ref="posmarker"
      :coordinates="[ mapCenter.lng, mapCenter.lat ]"
      :offset="{ x: 0, y: -15 }"
      color="orange"
    />
    <MglVectorLayer
      v-for="layer in layers"
      :key="layer.id"
      :clear-source="false"
      :layer-id="layer.id"
      :layer="layer"
      :source="poiSource"
      source-id="poi"
      @mouseenter="mouseenter"
      @click="clickPoi"
      @mouseleave="mouseleave"
    />
    <MglVectorLayer
      v-for="layer in noteLayers"
      :key="layer.id"
      :clear-source="false"
      :layer-id="layer.id"
      :layer="layer"
      :source="noteSource"
      source-id="poi-note"
      @mouseenter="mouseenter"
      @click="clickPoiNote"
      @mouseleave="mouseleave"
    />
    <MglGeojsonLayer
      v-for="layer in osmNoteLayers"
      :key="layer.id"
      :clear-source="false"
      :layer-id="layer.id"
      :layer="layer"
      :source="osmNoteSource"
      source-id="poi-osm-note"
      @mouseenter="mouseenter"
      @click="clickPoiNote"
      @mouseleave="mouseleave"
    />
  </MglMap>
</template>

<script>
import 'mapbox-gl/dist/mapbox-gl.css';
import { mapState } from 'vuex';
import debounce from 'lodash.debounce';
import * as config from '../config.json';
import { readContributionFromStorage, pushContribution } from '../lib/recent_contributions';
import { decodeFilter } from '../lib/categories';
import { rawColorForStatus } from '../lib/place';
import { osmNoteToFeature } from '../lib/note';
import {
  MglMap,
  MglMarker,
  MglVectorLayer,
  MglGeojsonLayer,
} from 'vue-mapbox/dist/vue-mapbox.umd';
import { GeolocateControl, NavigationControl } from 'mapbox-gl';
import isMobile from './mixins/is_mobile';

const source = "public.poi_osm_light";
const noteSource = "public.poi_recent_notes_light";
const contribSource = "poi-contrib-src";
let delayCounting = null;

function getColorStroke(theme, contribs = readContributionFromStorage()) {
  return [
    'case',
    ["in", ["get", "fid"], ["literal", contribs.filter(c => c[1] && c[1].startsWith("yes")).map(c => c[0])]], rawColorForStatus('yes', theme),
    ["in", ["get", "fid"], ["literal", contribs.filter(c => c[1] === "no").map(c => c[0])]], rawColorForStatus('no', theme),
    ["in", ["get", "status"], ["literal", ["yes", "limited"]]], rawColorForStatus('yes', theme),
    ["in", ["get", "status"], ["literal", ["no"]]], rawColorForStatus('no', theme),
    rawColorForStatus('unknown', theme)
  ];
}

function getLayers(theme) {
  const conditionalOpacity = [
    'interpolate', ['linear'],
    ['zoom'],
    0, 0,
    12, [
      'case',
      ["in", ["get", "status"], ["literal", ["no", "unknown"]]], 0,
      1
    ],
    14, [
      'case',
      ["in", ["get", "status"], ["literal", ["no", "unknown"]]], 0,
      1
    ],
    15, 1
  ];

  const layers = [
    {
      id: "poi-background",
      type: "circle",
      "source-layer": source,
      layout: {
        'circle-sort-key': [
          'case',
          ["in", ["get", "status"], ["literal", ["yes", "limited"]]], 2,
          ["in", ["get", "status"], ["literal", ["no"]]], 1,
          0
        ]
      },
      paint: {
        'circle-color': 'white',
        'circle-opacity': conditionalOpacity,
        'circle-stroke-opacity': conditionalOpacity,
        'circle-stroke-width': [
          'case',
          ["in", ["get", "status"], ["literal", ["yes", "limited"]]], 4,
          2.5
        ],
        'circle-stroke-color': getColorStroke(theme),
        'circle-radius': [
          'interpolate',
          ['linear'],
          ['zoom'],
          12, 0,
          14, 2,
          15, [
            'case',
            ["in", ["get", "status"], ["literal", ["no", "unknown"]]], 4,
            ["in", ["get", "cat1"], ["literal", ["note", "obstacle"]]], 3,
            6
          ],
          19, 13
        ]
      }
    },
    {
      id: "poi-icon",
      type: "symbol",
      "source-layer": source,
      minzoom: 15,
      layout: {
        'symbol-sort-key': [
          'case',
          ["in", ["get", "status"], ["literal", ["yes", "limited"]]], 0,
          ["in", ["get", "status"], ["literal", ["no"]]], 1,
          2
        ],
        "icon-image": [
          'image', [
            'case',
            ['!=', ['get', 'cat3'], 'other'], ['get', 'cat3'],
            ['!=', ['get', 'cat2'], 'other'], ['get', 'cat2'],
            ['!=', ['get', 'cat1'], 'other'], ['get', 'cat1'],
            'other'
          ]
        ],
        "icon-size": [
          'interpolate',
          ['linear'],
          ['zoom'],
          14, 0.3,
          19, 0.9
        ],
        "text-anchor": "top",
        "text-field": ["get", "name"],
        "text-font": [
          config.mapboxToken ? "Open Sans Regular" : "Noto Sans Regular"
        ],
        "text-max-width": 9,
        "text-offset": [
          'interpolate',
          ['linear'],
          ['zoom'],
          14, ['literal', [0, 0]],
          19, ['literal', [0, 1.5]]
        ],
        "text-padding": 2,
        "text-size": 12
      },
      paint: {
        "icon-opacity": conditionalOpacity,
        "text-opacity": [
          'interpolate', ['linear'],
          ['zoom'],
          0, 0,
          16, 0,
          17, 1
        ],
        "text-color": "#666",
        "text-halo-blur": 0.5,
        "text-halo-color": "#ffffff",
        "text-halo-width": 1
      }
    }
  ];

  const newLayers = layers
    .concat(layers.map(ls => Object.assign({}, ls, { id: ls.id+"-note", "source-layer": noteSource })))
    .concat(layers.map(ls => {
      const newls = Object.assign({}, ls, { id: ls.id+"-note-osm" });
      delete newls["source-layer"];
      return newls;
    }));
  return newLayers;
}

const SIDEBAR_SIZE = 400;

export default {
  components: {
    MglMap,
    MglMarker,
    MglVectorLayer,
    MglGeojsonLayer,
  },

  mixins: [isMobile],

  props: {
    featuresAndLocation: {
      type: String,
      required: false,
      default: ''
    },

    mapStyle: {
      type: Object,
      required: true
    },

    mapCenter: {
      type: Object,
      required: true
    },

    mapZoom: {
      type: Number,
      required: true
    },

    mapBounds: {
      type: Array,
      required: true
    },

    mapLimits: {
      type: Array,
      required: false
    },

    filter: {
      type: String,
      required: true
    },

    sidebar: {
      type: Boolean,
      required: true
    }
  },

  data() {
    return {
      osmNoteSource: { type: "geojson", data: { type: "FeatureCollection", features: [] } }
    };
  },

  mounted() {
    this.$on('updateMapBounds', (bbox) => {
      this.map.fitBounds(bbox, { duration: 0 });
    });
  },

  computed: {
    ...mapState(['place', 'highlightPlace', 'contribution', 'newPlaceType']),

    poiSource() {
      return {
        minzoom: config.minZoomPoi,
        maxzoom: config.maxZoomPoi,
        tiles: [ `${config.tilesUrl}/${source}/{z}/{x}/{y}.pbf` ]
      };
    },

    noteSource() {
      return {
        type: "vector",
        minzoom: config.minZoomPoi,
        maxzoom: config.maxZoomPoi,
        tiles: [ `${config.tilesUrl}/${noteSource}/{z}/{x}/{y}.pbf?rdm=${Date.now()}` ]
      };
    },

    allLayers() {
      const [ category, subcategories, subfilters ] = decodeFilter(this.filter);
      return getLayers(this.$vuetify.theme.themes.light).map((layer) => {
        const newLayer = { ...layer, filter: ['all'] };
        if (subfilters) {
          newLayer.filter.push(['in', ['get', 'cat3'], ['literal', subfilters]]);
        } else if (subcategories) {
          newLayer.filter.push(['in', ['get', 'cat2'], ['literal', subcategories]]);
        } else if (category !== '') {
          newLayer.filter.push(['==', 'cat1', category]);
        }
        return newLayer;
      });
    },

    layers() {
      return this.allLayers.filter(l => !l.id.endsWith('-note') && !l.id.endsWith('-note-osm'));
    },

    noteLayers() {
      return this.allLayers.filter(l => l.id.endsWith('-note'));
    },

    osmNoteLayers() {
      return this.allLayers.filter(l => l.id.endsWith('-note-osm'));
    },

    placeColor() {
      return rawColorForStatus(this.place.properties.status, this.$vuetify.theme.themes.light);
    },

    accessToken() {
      return config.mapboxToken || undefined;
    }
  },

  watch: {
    place(place) {
      if (!this.map) return;
      if (place) {
        const isPlaceUnderUI = (x, y) => {
          const height = document.body.clientHeight;
          const width = document.body.clientWidth;
          if (this.isMobile) {
            return (x < 0 || x > width || y > height / 2 || y < 0);
          } else {
            const offsetSidebar = this.sidebar ? SIDEBAR_SIZE : 0;
            return (x < offsetSidebar || x > width || y > height || y < 0);
          }
        }
        const { x, y } = this.map.project(place.geometry.coordinates);
        if (isPlaceUnderUI(x, y)) {
          this.map.panTo(place.geometry.coordinates, { offset: [0, this.isMobile ? (-document.body.clientHeight / 4) : 0] });
        }
      }
    },

    contribution(contribution) {
      if(contribution) {
        // Update layer coloring
        this.map.setPaintProperty('poi-background', 'circle-stroke-color', getColorStroke(this.$vuetify.theme.themes.light, pushContribution(contribution)));
        this.$store.commit('setContribution', null);
      }
    },

    filter(filter) {
      this.countPlaces();
    },
  },

  methods: {
    load({ map }) {
      this.map = map;

      // Controls
      this.navcontrol = new NavigationControl({ showCompass: false, showZoom: !this.isMobile });
      this.map.addControl(this.navcontrol, 'top-right');
      this.geoloccontrol = new GeolocateControl({ positionOptions: { enableHighAccuracy: true } });
      this.map.addControl(this.geoloccontrol, 'top-right');

      // Count places
      this.map.on('moveend', this.countPlaces.bind(this));
      this.map.on('zoomend', this.countPlaces.bind(this));
      this.map.on('rotate', this.countPlaces.bind(this));
      this.map.on('pitch', this.countPlaces.bind(this));
      this.map.on('data', this.countPlaces.bind(this));
      this.map.on('load', this.countPlaces.bind(this));

      this.$emit('loaded');
      this.updateMapBounds(map.getBounds());
      this.loadOsmNotes();
    },

    countPlaces() {
      if(delayCounting) {
        clearTimeout(delayCounting);
        delayCounting = null;
      }

      delayCounting = setTimeout(() => {
        const layerId = 'poi-background';
        if(this.map.getLayer(layerId)) {
          const layer = this.layers.find(l => l.id === layerId);
          const features = this.map.queryRenderedFeatures({ layers: [layerId], filter: layer ? layer.filter : undefined });

          if (features) {
            const uniqueFeatures = this.getUniqueFeatures(features, 'fid');
            this.$emit('placesCounted', uniqueFeatures.length);
          }
          else {
            this.$emit('placesCounted', 0);
          }
        }
        else {
          this.$emit('placesCounted', 0);
        }
      }, 100);
    },

    getUniqueFeatures(array, comparatorProperty) {
      const existingFeatureKeys = {};
      const uniqueFeatures = array.filter(function(el) {
        if (existingFeatureKeys[el.properties[comparatorProperty]]) {
          return false;
        } else {
          existingFeatureKeys[el.properties[comparatorProperty]] = true;
          return true;
        }
      });

      return uniqueFeatures;
    },

    updateMapCenter(mapCenter) {
      this.$emit('update:mapCenter', mapCenter);
    },

    updateMapZoom(mapZoom) {
      this.$emit('update:mapZoom', mapZoom);
    },

    updateMapCenterDynamic(mapCenter) {
      if(this.$refs && this.$refs.posmarker) {
        this.$refs.posmarker.marker.setLngLat(this.map.getCenter());
      }
    },

    refreshMapBounds() {
      this.updateMapBounds(this.map.getBounds());
    },

    updateMapBounds: debounce(function (mapBounds) {
      if (!this.isMobile) {
        const height = document.body.clientHeight;
        const width = document.body.clientWidth;
        const bounds = [
          this.map.unproject([SIDEBAR_SIZE, 0]).toArray(),
          this.map.unproject([width, height]).toArray()
        ];
        this.$emit('update:mapBounds', bounds);
      } else {
        this.$emit('update:mapBounds', mapBounds.toArray());
      }
    }, 1000),

    mouseenter(e) {
      e.map.getCanvas().style.cursor = 'pointer';
    },

    mouseleave(e) {
      e.map.getCanvas().style.cursor = '';
    },

    maprotated(e) {
      const showCompass = this.map.getBearing() !== 0;
      if(!this.navcontrol || this.navcontrol.options.showCompass !== showCompass) {
        if(this.navcontrol) {
          this.map.removeControl(this.navcontrol);
          this.map.removeControl(this.geoloccontrol);
        }
        this.navcontrol = new NavigationControl({ showCompass: showCompass, showZoom: !this.isMobile });
        this.map.addControl(this.navcontrol, 'top-right');
        this.map.addControl(this.geoloccontrol, 'top-right');
      }
    },

    clickPoi(e) {
      const id = e.mapboxEvent.features[0].properties.fid;
      if (this.$route.name === 'place' && this.$route.params.id === id) {
        return;
      }
      this.$router.push({
        name: 'place',
        params: {
          id,
          featuresAndLocation: this.featuresAndLocation
        }
      });
    },

    clickPoiNote(e) {
      const id = e.mapboxEvent.features[0].properties.fid.toString();
      if (this.$route.name === 'note' && this.$route.params.id === id) {
        return;
      }
      this.$router.push({
        name: 'note',
        params: {
          id: id.startsWith('o') ? id : 'n'+id,
          featuresAndLocation: this.featuresAndLocation
        }
      });
    },

    reloadNotesLayer() {
      this.noteLayers.forEach(l => this.map.removeLayer(l.id));
      this.map.removeSource('poi-note');
      this.map.addSource('poi-note', this.noteSource);
      this.noteLayers.forEach(l => {
        l.source = 'poi-note';
        this.map.addLayer(l);
      });
    },

    loadOsmNotes() {
      fetch(`${config.osmUrl}/api/0.6/notes/search.json?q=cartomobilite`)
      .then(data => data.json())
      .then(geojson => {
        geojson.features = geojson.features.map(osmNoteToFeature);
        this.osmNoteSource.data = geojson;
      });
    },
  }
}
</script>

<style>
.mgl-map-wrapper {
  width: 100vw;
  height: 100vh;
  position: relative;
}

.mgl-map-wrapper .mapboxgl-map {
  height: 100%;
  left: 0;
  position: absolute;
  top: 0;
  width: 100%;
}

.xs .mapboxgl-control-container button,
.sm .mapboxgl-control-container button {
  width: 35px;
  height: 35px;
}

@media (min-width: 600px) {
  .mapboxgl-ctrl-geolocate {
    display: none !important;
  }
}
</style>
