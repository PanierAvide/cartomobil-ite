<template>
  <v-form>
    <v-jsf
      v-model="model"
      :schema="schema"
      :options="formOptions"
      class="pb-0"
    >
      <template v-for="l in linksDisplayed" :slot="l.slot" slot-scope="{value}">
        <detail-opening-hours
          v-if="l.type == 'opening_hours'"
          :value="place.properties.tags.opening_hours"
          :country="place.properties.country"
          :coordinates="place.geometry.coordinates"
        />
        <detail-link
          v-else
          v-for="value in l.values"
          :key="value.text"
          :href="value.href"
          :title="value.text"
          :icon="linkIcons[l.tag]"
          :external="value.href.startsWith('http')"
        />
      </template>
    </v-jsf>
  </v-form>
</template>

<script>
import { getForm, getModelForForm, getReadOnlyForm, getFormOptions, getLinksForForm } from '../../lib/form';
import DetailLink from './detail_link';
import DetailOpeningHours from './detail_opening_hours';
import placeMixin from '../mixins/place';

export default {
  components: {
    DetailLink,
    DetailOpeningHours
  },

  mixins: [placeMixin],

  props: {
    place: {
      type: Object,
      required: true
    }
  },

  data() {
    return {
      model: {},
      schema: {},
      links: [],
      formOptions: getFormOptions(this.$i18n.locale, true)
    };
  },

  mounted() {
    if(this.place) {
      this.schema = getForm(this.place) || {};
      if(Object.keys(this.schema).length > 0) {
        this.model = getModelForForm(this.schema, this.place);
        this.schema = getReadOnlyForm(this.schema, this.model) || {};
        this.links = getLinksForForm(this.schema) || [];
      }
    }
  },

  computed: {
    linkIcons() {
      return {
        phone: 'osm-phone',
        mobile: 'osm-mobile_phone',
        email: 'osm-mail',
        facebook: 'osm-fcbk',
        website: 'osm-link'
      };
    },

    linksDisplayed() {
      return this.links.map(l => {
        const type = l.split("@")[0];
        const id = l.split("@").pop();
        const tag = l.split(".").pop();
        return { type, tag, values: this.link(tag, type), slot: id };
      });
    }
  }
};
</script>
