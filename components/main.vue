<template>
  <div
    :class="{
       sm: isMobile,
      'place-opened': $route.name === 'place' && !isMobile,
      'sidebar-opened': sidebar && !isMobile,
      'sidebar-big-opened': sidebar && hasCategoryFilter && !isMobile
    }"
  >
    <div>
      <v-navigation-drawer
        v-if="!isMobile"
        v-model="sidebar"
        :width="hasCategoryFilter ? 400 : 350"
        temporary
        stateless
        hide-overlay
        fixed
      >
        <filter-results
          v-if="hasCategoryFilter"
          v-model="filter"
          :featuresAndLocation="featuresAndLocation"
          :map-bounds="mapBounds"
          :nbPlacesVisible="nbPlacesVisible"
        />
        <note-form
          v-else-if="newPlaceType !== null"
          :type="newPlaceType"
          :position="mapCenter"
          @close="closeNote"
          @success="onSuccessNote"
        />
        <main-menu
          v-else
          :filter="filter"
          :style="{ width: '350px' }"
        >
          <geocoder
            v-show="true"
            @select="updateMapBounds"
            :style="{ margin: '5px' }"
          />

          <filter-list v-model="filter" />
        </main-menu>
      </v-navigation-drawer>
      <v-content>
        <top-toolbar
          v-model="filter"
          @toggleSidebar="sidebar = !sidebar"
          @onGeocode="updateMapBounds"
        />
        <client-only>
          <osm-map
            v-if="loadMap"
            ref="map"
            :sidebar="sidebar"
            :map-style="mapStyle"
            :map-center.sync="mapCenter"
            :map-zoom.sync="mapZoom"
            :map-bounds.sync="mapBounds"
            :map-limits="mapLimits"
            :filter="filter"
            :featuresAndLocation="featuresAndLocation"
            @loaded="mapLoaded = true"
            @placesCounted="nbPlacesVisible = $event"
          />
          <v-slide-y-reverse-transition>
            <v-chip
              v-if="mapZoom < minZoomAllPoi"
              color="primary"
              class="zoom-chip mb-6"
              :class="{ 'push-up': !rgpdBannerHidden }"
              @click="mapZoom = minZoomAllPoi"
            >
              {{ $t('zoomtosee') }}
            </v-chip>
          </v-slide-y-reverse-transition>
          <rgpd-banner @consent="rgpdBannerHidden = true" />
          <apps-sheet />
        </client-only>
        <bottom-menu
          v-if="isMobile && mapLoaded"
          :filter="filter"
        >
          <filter-results
            v-if="hasCategoryFilter"
            v-model="filter"
            :featuresAndLocation="featuresAndLocation"
            :map-bounds="mapBounds"
            :nbPlacesVisible="nbPlacesVisible"
          />
          <note-form
            v-else-if="newPlaceType !== null"
            :type="newPlaceType"
            :position="mapCenter"
            @close="closeNote"
            @success="onSuccessNote"
          />
          <main-menu
            v-else
            :filter="filter"
            :show-brand="false"
          >
            <filter-list v-model="filter" />
          </main-menu>
        </bottom-menu>
      </v-content>
    </div>
    <router-view>
      <div v-if="hasCategoryFilter">
        <v-btn
          tile
          text
          class="full-width justify-start"
          @click="closePlace"
        >
          <v-icon>osm-arrow-left</v-icon>
          {{ $t('backtolist') }}
        </v-btn>
      </div>
    </router-view>
    <splash-screen v-if="!mapLoaded" />
  </div>
</template>

<script>
import { mapGetters, mapState } from 'vuex';
import debounce from 'lodash.debounce';
import config from '../config.json';
import { getCookie, setCookie } from '../lib/cookie';
import { encode, decode, encodePosition, decodePosition, findBrand } from '../lib/url';
import { encodeFilter, decodeFilter } from '../lib/categories';
import isMobile from './mixins/is_mobile';
import AppsSheet from './apps_sheet';
import MainMenu from './main_menu';
import FilterList from './filter_list';
import FilterResults from './filter_results';
import TopToolbar from './top_toolbar';
import BottomMenu from './bottom_menu';
import RgpdBanner from './rgpd_banner';
import SplashScreen from './splash_screen';
import Geocoder from './geocoder';
import NoteForm from './note_form';

const MAP_VIEW_COOKIE = 'mapView';

export default {
  components: {
    AppsSheet,
    BottomMenu,
    FilterList,
    FilterResults,
    MainMenu,
    RgpdBanner,
    SplashScreen,
    TopToolbar,
    Geocoder,
    NoteForm,
  },

  mixins: [isMobile],

  props: {
    featuresAndLocation: {
      type: String,
      required: false,
      default: ''
    }
  },

  data() {
    return {
      filter: '',
      loadMap: false,
      mapLimits: config.mapBounds || undefined,
      mapBounds: [],
      mapCenter: { lat: 0, lng: 0 },
      mapLoaded: false,
      mapStyle: null,
      mapZoom: 0,
      minZoomPoi: config.minZoomPoi,
      minZoomAllPoi: config.minZoomAllPoi,
      rgpdBannerHidden: false,
      sidebar: false,
      nbPlacesVisible: 0
    };
  },

  mounted() {
    this.sidebar = !this.isMobile;

    const { filter, location } = decode(this.featuresAndLocation);
    this.filter = filter;

    // Store initial status values
    const [ category, subcategories, subfilters, status ] = decodeFilter(this.filter);
    if(status) {
      Object.entries(status).forEach(e => this.$store.commit('setStatus', e.join("=")));
    }

    Promise.all([
      this.loadInitialLocation(location),
      this.loadAndOverrideMapStyle()
    ]).then(() => {
      this.loadMap = true;
      this.getCurrentCountry();
    });
  },

  computed: {
    ...mapGetters(['categories', 'allCategories']),

    ...mapState(['newPlaceType', 'statusPlace', 'statusService']),

    hasCategoryFilter() {
      return this.filter.split("~")[0] !== '';
    }
  },

  watch: {
    mapCenter() {
      this.updateRoute();
      this.saveCurrentView();
      this.refreshCurrentCountry();
    },

    mapZoom() {
      this.updateRoute();
      this.saveCurrentView();
    },

    filter() {
      this.updateRoute();
    },

    statusPlace() {
      this.updateFilterStatus();
    },

    statusService() {
      this.updateFilterStatus();
    },

    newPlaceType(newv, oldv) {
      if(newv && newv !== oldv) {
        const [ category, subcategories, subfilters, status ] = decodeFilter(this.filter);
        this.filter = encodeFilter(null, null, null, status);
      }
    },
  },

  methods: {
    loadAndOverrideMapStyle() {
      let getStylePromise;
      if(config.mapboxStyle && config.mapboxToken) {
        getStylePromise = fetch(config.mapboxStyle+"?access_token="+config.mapboxToken).then(res => res.json());
      }
      else {
        getStylePromise = new Promise(resolve => resolve({
            version: 8,
            name: "Cartomobil'ité",
            glyphs: `${config.fontsUrl}/{fontstack}/{range}.pbf`,
            sources: {
              osm: {
                type: "raster",
                tiles: [ "https://tile.openstreetmap.org/{z}/{x}/{y}.png" ],
                maxzoom: 19,
                attribution: "&copy; OpenStreetMap"
              }
            },
            layers: [{
              id: "osm",
              source: "osm",
              type: "raster"
            }]
        }));
      }

      return getStylePromise
      .then(data => {
        data.sprite = `${window.location.origin}/sprite/caresteouvert`;
        this.mapStyle = data;
      });
    },

    loadInitialLocation(location) {
      let promise;
      const savedMapView = this.savedMapView();
      if (location) {
        const { lat, lng, zoom } = decodePosition(location, config);
        this.mapCenter = { lat, lng };
        this.mapZoom = zoom;
        promise = Promise.resolve();
      } else if (savedMapView) {
        const { center, zoom } = JSON.parse(savedMapView);
        this.mapCenter = center;
        this.mapZoom = zoom;
        promise = Promise.resolve();
      } else if(config.geoIpUrl) {
        promise = this.centerMapViaGeoIP();
      }
      return promise;
    },

    centerMapViaGeoIP() {
      return fetch(config.geoIpUrl)
        .then(res => res.json())
        .then(json => {
          this.mapCenter = { lat: json.ll[0], lng: json.ll[1] };
          this.mapZoom = json.city !== '' ? 13 : 5;
        }).catch(() => {
          this.mapCenter = { lat: config.mapCenter[1], lng: config.mapCenter[0] };
          this.mapZoom = config.mapZoom;
        });
    },

    closePlace() {
      this.$router.push({ name: 'index', params: { featuresAndLocation: this.featuresAndLocation } })
    },

    closeNote() {
      this.$store.commit('addNewPlaceType', null);
    },

    onSuccessNote() {
      this.$refs.map.reloadNotesLayer();
    },

    updateRoute() {
      if (!this.lastFeaturesAndLocation) {
        this.lastFeaturesAndLocation = this.featuresAndLocation;
      }
      const newFeaturesAndLocation = encode(
        this.filter,
        encodePosition(this.mapCenter.lat, this.mapCenter.lng, this.mapZoom)
      );
      if (this.lastFeaturesAndLocation === newFeaturesAndLocation) {
        return;
      }
      this.lastFeaturesAndLocation = newFeaturesAndLocation;
      this.$router.replace({
        name: this.$route.name,
        params: {
          ...this.$route.params,
          featuresAndLocation: newFeaturesAndLocation
        }
      });
    },

    updateMapBounds(bbox) {
      if(bbox.length === 5) {
        const placeId = bbox.pop();
        if(placeId) {
          setTimeout(() => this.$router.push({ name: 'place', params: { id: placeId, featuresAndLocation: this.featuresAndLocation } }), 500);
        }
      }

      this.$refs.map.$emit('updateMapBounds', bbox);
    },

    updateFilterStatus() {
      const [ category, subcategories, subfilters, status ] = decodeFilter(this.filter);
      const newStatus = {};
      if(this.statusService !== "") { newStatus.service = this.statusService; }
      if(this.statusPlace !== "") { newStatus.place = this.statusPlace; }
      this.filter = encodeFilter(category, subcategories, subfilters, newStatus);
    },

    savedMapView() {
      return getCookie(MAP_VIEW_COOKIE);
    },

    saveCurrentView() {
      setCookie(MAP_VIEW_COOKIE, JSON.stringify({ center: this.mapCenter, zoom: this.mapZoom }));
    },

    refreshCurrentCountry: debounce(function() {
      if (!this.lastMapCenter) {
        this.lastMapCenter = this.mapCenter;
      }
      const { lat: lat1, lng: lon1 } = this.mapCenter;
      const { lat: lat2, lng: lon2 } = this.lastMapCenter;
      const distance = this.getDistanceBetween2MapCenter(lat1, lon1, lat2, lon2);
      const tenKm = 10000;
      if (distance > tenKm) {
        this.lastMapCenter = this.mapCenter;
        this.getCurrentCountry();
      }
    }, 1),

    getCurrentCountry() {
      const { lat, lng } = this.mapCenter;
      this.$store.commit('setArea', 'FR');
//      fetch(`${config.apiUrl}/country?lat=${lat}&lon=${lng}`)
//        .then(res => res.text())
//        .then(area => {
//          this.$store.commit('setArea', area);
//           const [category, subcategory, subfilter] = this.filter.split('/');
//           if (!this.categories.includes(category)) {
//             this.filter = '';
//           } else if (subcategory && !this.allCategories[category].subcategories[subcategory]) {
//             this.filter = category;
//           } else if (subfilter && !this.allCategories[category].subcategories[subcategory].subfilters[subfilter]) {
//             this.filter = subcategory;
//           }
//        });
    },

    getDistanceBetween2MapCenter(lat1, lon1, lat2, lon2) {
      const toRadians = (number) => number * Math.PI / 180;
      const R = 6371e3; // metres
      const φ1 = toRadians(lat1);
      const φ2 = toRadians(lat2);
      const Δφ = toRadians(lat2-lat1);
      const Δλ = toRadians(lon2-lon1);

      const a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
              Math.cos(φ1) * Math.cos(φ2) *
              Math.sin(Δλ/2) * Math.sin(Δλ/2);
      const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

      return R * c;
    }
  }
}
</script>

<style>
.full-width {
  width: 100%;
}
.zoom-chip {
  position: fixed !important;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
}
.zoom-chip.push-up {
  bottom: 60px;
}
.sm .zoom-chip {
  bottom: 40px;
}
.sm .mapboxgl-ctrl-top-right {
  top: 50px;
}
.sm .mapboxgl-ctrl-bottom-right {
  bottom: 20px;
}
.sidebar-opened .search {
  transform: translateX(350px);
}
.sidebar-big-opened .search, .place-opened .search {
  display: none;
}
.text-pre {
  white-space: pre-line;
}
.v-navigation-drawer__content {
  display: flex;
}
.form-hide-desc p {
  display: none;
}
.form-field-readonly .v-select__selections > div {
  color: black !important;
}
.form-field-readonly .v-input__slot::before {
  border: none !important;
}
.vjsf-tooltip {
  max-width: 300px;
  background: rgb(55, 52, 52);
  z-index: 2500 !important;
  pointer-events: unset !important;
}
.vjsf-tooltip a {
  color: #c5e2ff !important;
}
.vjsf-property-equipments.pl-2,
.vjsf-property-basics.pl-2,
.vjsf-property-details.pl-2,
.vjsf-property-equipments.pl-2 > div > .vjsf-property.pl-2,
.vjsf-property-basics.pl-2 > div > .vjsf-property.pl-2,
.vjsf-property-details.pl-2 > div > .vjsf-property.pl-2,
.vjsf-property-root.pl-2 > div > .vjsf-property.pl-2,
.vjsf-property-root.pl-2 > div > .vjsf-property.pl-2 .vjsf-property.pl-2,
.vjsf-property .v-expansion-panel-content .pl-2 {
  padding: 0 !important;
}
.v-menu__content {
  z-index: 2500 !important;
}
.form-field-readonly .v-input__icon--append .v-icon--disabled.mdi-menu-down,
.vjsf-property .v-select__slot .v-input__icon--clear {
  display: none;
}
.toolbar-title-unlimited-height,
.toolbar-title-unlimited-height > .v-toolbar__content {
  min-height: 64px !important;
  height: unset !important;
}
</style>
