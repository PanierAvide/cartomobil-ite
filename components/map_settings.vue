<template>
  <v-list-group class="group-map-settings" no-action>
    <template v-slot:prependIcon>
      <v-badge v-if="statusEnabled" dot color="warning">
        <v-icon small>osm-settings</v-icon>
      </v-badge>
      <v-icon v-else small>osm-settings</v-icon>
    </template>

    <template v-slot:activator>
      <v-list-item-content>
        <v-list-item-title>{{ $t('map_settings.title') }}</v-list-item-title>
      </v-list-item-content>
    </template>

    <v-list-item class="pl-5">
      <v-list-item-content>
        <v-list-item-title>{{ $t('map_settings.place_status') }}</v-list-item-title>
      </v-list-item-content>
      <v-list-item-action>
        <status-switch :status.sync="place_status" />
      </v-list-item-action>
    </v-list-item>

    <v-list-item class="pl-5">
      <v-list-item-content>
        <v-list-item-title>{{ $t('map_settings.service_status') }}</v-list-item-title>
      </v-list-item-content>
      <v-list-item-action>
        <status-switch :status.sync="service_status" />
      </v-list-item-action>
    </v-list-item>
  </v-list-group>
</template>

<script>
import i18nMixin from './mixins/i18n';
import StatusSwitch from './status_switch';
import { decodeFilter } from '../lib/categories';

export default {
  components: {
    StatusSwitch
  },

  mixins: [i18nMixin],

  props: {
    filter: {
      type: String,
      required: true
    },
  },

  data() {
    return {
      place_status: '',
      service_status: ''
    };
  },

  computed: {
    statusEnabled() {
      return this.place_status !== '' || this.service_status !== '';
    },
  },

  mounted() {
    this.updateStatus();
  },

  watch: {
    filter() {
      this.updateStatus();
    },

    place_status(newv, oldv) {
      if(newv === undefined || newv === null || newv.trim() === "") { newv = ''; }
      this.$store.commit('setStatus', 'place='+newv);
    },

    service_status(newv, oldv) {
      if(newv === undefined || newv === null || newv.trim() === "") { newv = ''; }
      this.$store.commit('setStatus', 'service='+newv);
    },
  },

  methods: {
    updateStatus() {
      const [ category, subcategories, subfilters, status ] = decodeFilter(this.filter);
      if(status) {
        this.place_status = status.place || '';
        this.service_status = status.service || '';
      }
      else {
        this.place_status = '';
        this.service_status = '';
      }
    },
  },
};
</script>

<style>
.group-map-settings .v-list-item__icon.v-list-group__header__prepend-icon {
  margin-right: 9px !important;
}
</style>
