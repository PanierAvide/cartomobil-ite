<template>
  <v-sheet
    v-touch="{ up: moveUp, down: moveDown }"
    :elevation="3"
    :tile="!isMobile"
    :height="`${height}vh`"
    :class="{ 'bottom-dialog': isMobile, 'left-sidebar': !isMobile }"
  >
    <v-card
      :loading="!place"
      tile
      min-height="100%"
      class="d-flex flex-column"
    >
      <slot />
      <v-toolbar
        v-if="place"
        tile
        dark
        class="flex-grow-0 toolbar-title-unlimited-height"
      >
        <v-icon>{{ `osm-${category}` }}</v-icon>
        <v-toolbar-title
          :title="title"
          class="ml-3 toolbar-title toolbar-title-long"
        >
          {{ title || type }}
          <template v-if="title">
            <br>
            <span class="subtitle-1">{{ type }}</span>
          </template>
        </v-list-item>
        </v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn
          icon
          dark
          @click="close">
          <v-icon>osm-close</v-icon>
        </v-btn>
      </v-toolbar>
      <div v-if="place">
        <v-alert
          type="warning"
          tile
          class="mb-0"
        >
          <span class="text-pre">{{ $t('details.signal_note') }}</span>
        </v-alert>

        <detail-state
          ref="state"
          :place="place"
          :status="status"
          :last-update="lastUpdate"
          :allowContribute="false"
        />

        <v-list
          v-if="infos.length > 0 || hasVending"
          class="py-0"
        >
          <v-list-item v-if="infos.length > 0">
            <v-list-item-icon><v-icon>osm-info</v-icon></v-list-item-icon>
            <v-list-item-content>
              <p
                v-for="info in infos"
                :key="info"
                v-html="info"
                v-linkified:options="{ className: 'alert-link', attributes: { rel: 'noopener' } }"
                class="mb-0 overflowwrap-anywhere"
              />
            </v-list-item-content>
          </v-list-item>
        </v-list>

        <detail-schema class="mx-3 my-2" :place="place" />

        <mapillary-viewer
          v-if="mapillaryImage"
          :m-key="mapillaryImage"
          :cover="true"
          :marker="place.geometry"
          class="card-mapillary ma-2"
        />
      </div>
    </v-card>
  </v-sheet>
</template>

<script>
import { mapState } from 'vuex';
import { noteFeature, osmUrl, mapillaryClientId } from '../../config.json';
import { encodePosition } from '../../lib/url';
import { osmNoteToFeature } from '../../lib/note';
import parseId from '../../lib/parse_id';
import { getRecentContribution } from '../../lib/recent_contributions';
import isMobile from '../mixins/is_mobile';
import placeMixin from '../mixins/place';
import DetailHygiene from './detail_hygiene';
import DetailState from './detail_state';
import DetailService from './detail_service';
import DetailSchema from './detail_schema';
import OsmLink from '../osm_link';
import UpdateDetailDialog from '../update_detail_dialog';
import { categories } from '../../categories.json';
import ContributeForm from '../contribute_form';
import { findImage } from '../mapillary/mapillary';

export default {
  components: {
    DetailHygiene,
    DetailState,
    DetailService,
    DetailSchema,
    OsmLink,
    UpdateDetailDialog,
    ContributeForm
  },

  mixins: [placeMixin, isMobile],

  props: {
    id: {
      type: String,
      required: true
    },
    featuresAndLocation: {
      type: String,
      required: false,
      default: ''
    }
  },

  head() {
    if (!this.place) {
      return {};
    }
    const [lng, lat] = this.place.geometry.coordinates;
    return {
      title: `${this.title || this.type} - ${this.$t('title')}`,
      meta: [
        { hid: 'ogurl', property: 'og:url',  content: `${this.$rootUrl}${encodePosition(lat, lng, 18)}/note/${this.id}` },
        { hid: 'ogtitle', property: 'og:title', content: this.$t('title') }
      ],
      link: [
        { hid: 'canonical', rel: 'canonical', href: `${this.$rootUrl}note/${this.id}` }
      ]
    }
  },

  mounted() {
    this.updateDefaultHeight();

    this.beforeUnloadListener = (event) => {
      if (this.$refs.state && this.$refs.state.contribute) {
        event.preventDefault();
        event.returnValue = '';
      }
    };
    window.addEventListener('beforeunload', this.beforeUnloadListener);
  },

  beforeDestroy() {
    window.removeEventListener('beforeunload', this.beforeUnloadListener);
  },

  fetch() {
    return this.updatePlace();
  },

  data() {
    return {
      height: 100,
      place: null,
      mapillaryImage: null
    };
  },

  computed: {
    ...mapState(['country']),

    hasVending() {
      return this.$te(`details.vending.${this.place.properties.tags.vending}`);
    },

    hasSpecificOpeningHours() {
      return !!(this.place.properties.opening_hours && this.place.properties.opening_hours !== 'open');
    },

    hasOpeningInfos() {
      return !!(this.hasSpecificOpeningHours
               || this.place.properties.tags.opening_hours
               || this.place.properties.brand_hours);
    },

    lastUpdate() {
      return this.place && new Date(this.place.properties.last_update);
    },

    infos() {
      let infos = [];

      // Category note
      if(this.$te(`categories_notes.${this.place.properties.cat1}`)) {
        infos.push(this.$t(`categories_notes.${this.place.properties.cat1}`));
      }
      if(this.$te(`categories_notes.${this.place.properties.cat2}`)) {
        infos.push(this.$t(`categories_notes.${this.place.properties.cat2}`));
      }
      if(this.$te(`categories_notes.${this.place.properties.cat3}`)) {
        infos.push(this.$t(`categories_notes.${this.place.properties.cat3}`));
      }

      // Custom POI description
      if (this.place.properties.tags['description:cro']) {
        infos.push(this.place.properties.tags['description:cro']);
      }

      // Mandatory mask
      if (this.place.properties.tags['safety:covid19']) {
        infos = infos.concat(
          this.place.properties.tags['safety:covid19']
          .split(';')
          .filter(v => !this.$t(`details.safety.${v}`).startsWith("details."))
          .map(v => this.$t(`details.safety.${v}`))
        );
      }

      // Access
      if (this.place.properties.tags['access:covid19'] === 'no') {
        infos.push(this.$t('details.not_accessible'));
      }

      // Maximal capacity
      if (!isNaN(parseInt(this.place.properties.tags['capacity:covid19']))) {
        infos.push(this.$tc('details.capacity', this.place.properties.tags['capacity:covid19']));
      }

      // POI information
      if (this.place.properties.brand_infos) {
        infos.push(this.place.properties.brand_infos);
      }

      return infos;
    }
  },

  watch: {
    id() {
      this.place = null;
      this.contribute = false;
      this.updatePlace();
    },

    isMobile() {
      this.updateDefaultHeight();
    }
  },

  methods: {
    updateDefaultHeight() {
      this.height = this.isMobile ? 50 : 100;
    },

    updatePlace() {
      const recentNote = this.id.startsWith('n');
      const myId = this.id.substring(1);
      const promises = [];

      if(recentNote) {
        promises.push(fetch(`${noteFeature}.json?fid=${myId}&precision=7`)
        .then(data => data.json())
        .then((geojson) => {
          if(geojson.features.length == 1) {
            this.place = geojson.features[0];
  //           this.$store.commit('setPlace', note);

            this.mapillaryImage = this.place.properties.tags.mapillary;
            if(!this.mapillaryImage) {
              this.fetchMapillaryImage();
            }
          }
          else { throw new Error("No feature"); }
        })
        .catch(() => {
          this.$nuxt.context.redirect(`/${this.$route.params.featuresAndLocation || ''}`);
        }));
      }
      else {
        promises.push(fetch(`${osmUrl}/api/0.6/notes/${myId}.json`)
        .then(data => data.json())
        .then((data) => {
          if(data.type === "Feature") {
            this.place = osmNoteToFeature(data);
  //           this.$store.commit('setPlace', note);

            this.mapillaryImage = this.place.properties.tags.mapillary;
            if(!this.mapillaryImage) {
              this.fetchMapillaryImage();
            }
          }
          else { throw new Error("No feature"); }
        })
        .catch(() => {
          this.$nuxt.context.redirect(`/${this.$route.params.featuresAndLocation || ''}`);
        }));
      }

      return Promise.all(promises);
    },

    fetchMapillaryImage() {
      const coordinates = {
        lng: this.place.geometry.coordinates[0],
        lat: this.place.geometry.coordinates[1]
      };
      findImage(coordinates, false, null, mapillaryClientId)
      .then((mKey) => {
        this.mapillaryImage = mKey;
      });
    },

    close() {
      this.$router.push({ name: 'index', params: { featuresAndLocation: this.$route.params.featuresAndLocation } })
    },

    beforeRouteUpdate(to, from, next) {
      let result = true;
      if (to.params.id !== from.params.id && this.$refs.state && this.$refs.state.contribute) {
        result = window.confirm(this.$t('details.signal_warning'));
      }
      next(result);
    },

    beforeRouteLeave(to, from, next) {
      let result = true;
      if (this.$refs.state && this.$refs.state.contribute) {
        result = window.confirm(this.$t('details.signal_warning'));
      }
      next(result);
      if (result) {
//         this.$store.commit('setPlace', null);
      }
    },

    moveUp() {
      this.height = 90;
    },

    moveDown() {
      this.height == 50 ? this.close() : this.height = 50;
    }
  }
}
</script>

<style scoped>
.toolbar-title {
  line-height: 1;
}
.toolbar-title.toolbar-title-long {
  white-space: unset;
  font-size: 1.15rem;
}
.left-sidebar {
  width: 400px;
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 10;
  overflow-y: auto;
}

.bottom-dialog {
  z-index: 300 !important;
  width: 100vw;
  position: fixed;
  bottom: 0;
  left: 0;
  z-index: 10;
  overflow-y: auto;
  transition: height ease .1s;
}
.overflowwrap-anywhere {
  overflow-wrap: anywhere;
}
.card-mapillary {
  height: 300px;
}
</style>
