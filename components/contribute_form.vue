<template>
  <div>
    <div class="d-flex align-center">
      <h1 class="title flex-grow-1">{{ $t('contribute_form.title') }}</h1>
      <a
        @click="close"
      >
        {{ $t('contribute_form.cancel') }}
      </a>
    </div>
    <v-form ref="form" v-model="valid">
      <v-jsf
        v-model="model"
        :schema="schema"
        :options="formOptions"
       />
    </v-form>
  </div>
</template>

<script>
import { apiUrl } from '../config.json';
import parseId from '../lib/parse_id';
import { getForm } from '../lib/place';
import { categories, forms } from '../categories.json';

export default {
  components: {},

  props: {
    place: {
      type: Object,
      required: true
    }
  },

  data() {
    return {
      details: '',
      loading: false,
      valid: null,
      model: {},
      schema: {},
      formOptions: {
        locale: this.$i18n.locale,
        icons: {
          "calendar": "osm-blog",
          "clock": "osm-time",
          "info": "osm-info",
          "add": "osm-plus",
          "edit": "",
          "delete": "osm-close"
        }
      }
    };
  },

  mounted() {
    if(this.place) {
      this.schema = getForm(this.place) || {};
      if(Object.keys(this.schema).length > 0) {
        // Create model according to form structure
        let model = {};
        Object.entries(this.schema["x-map-tags"]).forEach(e => {
          const [ tag, path ] = e;
          const pathNames = path.split(".");
          let obj = model;
          pathNames.forEach((pn, i) => {
            if(i === pathNames.length - 1) {
              obj[pn] = this.properties[pn] || this.properties.tags[pn] || "";
            }
            else {
              if(!obj[pn]) {
                obj[pn] = {};
              }
              obj = obj[pn];
            }
          });
        });

        this.model = model;
      }
    }
  },

  computed: {
    properties() {
      return this.place.properties;
    },

    id() {
      const { type, id } = parseId(this.place.id);
      return `${type}/${id}`;
    },

    payload() {
      const [ lon, lat ] = this.place.geometry.coordinates;
      const tags = {
        opening_hours: this.openingHoursWithoutLockDown ? 'same': undefined,
        fixme: this.definite_closing === true ? 'This place is definitely closed' : undefined
      };

      Object.entries(this.fields).forEach(e => {
        const [ fieldId, field ] = e;
        if(this.fieldValues[fieldId]) {
          tags[field.tag] = this.fieldValues[fieldId];
        }
      });

      return {
        name: this.properties.name,
        state: this.open ? 'open' : 'closed',
        details: null,
        opening_hours: null,
        lat,
        lon,
        lang: this.$i18n.locale,
        tags: tags
      };
    }
  },

  methods: {
    submit() {
//       const [ type, id ] = this.id.split('/');
//       this.loading = true;
//       fetch(
//         `${apiUrl}/contribute/${type}/${id}`,
//         {
//           method: 'POST',
//           headers: {
//             'Content-Type': 'application/json'
//           },
//           body: JSON.stringify(this.payload)
//         }
//       ).then((response) => {
//         if (response.status === 200) {
//           this.$emit('success');
//           this.$store.commit('setContribution', [
//              this.place.properties.fid,
//              this.payload.state,
//              parseInt((Date.now() / 1000).toFixed(0))
//            ]);
//         }
//       }).finally(() => {
//         this.loading = false
//       });
    },

    close() {
      this.$emit('close');
    }
  }
};
</script>
