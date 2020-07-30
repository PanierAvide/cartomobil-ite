<template>
  <v-list-item
    :to="{ name: 'place', params: { id: place.id, featuresAndLocation } }"
    active-class="primary--text"
  >
    <v-list-item-icon class="mr-2 mt-3">
      <v-icon
        :style="{ 'border-color': color }"
        class="circle"
        color="grey darken-2"
        small
      >{{ `osm-${category}` }}</v-icon>
    </v-list-item-icon>
    <v-list-item-content class="py-2">
      <v-list-item-title>{{ title || type }}</v-list-item-title>
      <v-list-item-subtitle v-if="title && displayType">{{ type }}</v-list-item-subtitle>
      <v-list-item-subtitle
        v-if="!$vuetify.breakpoint.smAndDown && (link('phone') || link('mobile'))"
        v-text="(link('phone') || link('mobile'))[0].text"
      />
      <dense-opening-hours
        v-if="place.properties.tags.opening_hours"
        :value="place.properties.tags.opening_hours"
      />
      <v-list-item-subtitle v-else>{{ $t(`details.state_short.${place.properties.status}`) }}</v-list-item-subtitle>
    </v-list-item-content>
    <v-list-item-action
      v-if="$vuetify.breakpoint.smAndDown && (link('phone') || link('mobile'))"
      class="my-1"
    >
      <v-btn
        :href="(link('phone') || link('mobile'))[0].href"
        icon
        @click.stop
      >
        <v-icon>osm-phone</v-icon>
      </v-btn>
    </v-list-item-action>
  </v-list-item>
</template>

<script>
import placeMixin from '../mixins/place';
import { rawColorForStatus } from '../../lib/place';
import DenseOpeningHours from './dense_opening_hours';

export default {
  components: { DenseOpeningHours },

  mixins: [placeMixin],

  props: {
    place: {
      type: Object,
      required: true
    },

    displayType: {
      type: Boolean,
      required: false,
      default: true
    },

    featuresAndLocation: {
      type: String,
      required: false,
      default: ''
    }
  },

  data() {
    return {};
  },

  computed: {
    color() {
      return rawColorForStatus(this.place.properties.status, this.$vuetify.theme.themes.light);
    },
  }
}
</script>

<style>
.circle {
  border: solid 3px;
  border-radius: 50%;
  padding: 5px;
}
</style>
