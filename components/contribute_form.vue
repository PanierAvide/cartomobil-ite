<template>
  <div>
    <h1 class="title">{{ $t('contribute_form.title') }}</h1>
    <v-form
      ref="form"
      v-model="valid"
      @submit="submit"
    >
      <v-jsf
        v-model="model"
        :schema="schema"
        :options="formOptions"
        class="pb-0"
      />
      <v-container class="pt-0">
        <v-row>
          <v-col cols="6">
            <v-btn
              :loading="loading"
              color="success"
              @click="submit"
              block
            >
              {{ $t('contribute_form.submit') }}
            </v-btn>
          </v-col>
          <v-col cols="6">
            <v-btn
              :loading="loading"
              color="secondary"
              @click="close"
              block
            >
              {{ $t('contribute_form.cancel') }}
            </v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </div>
</template>

<script>
import { apiUrl } from '../config.json';
import parseId from '../lib/parse_id';
import { getForm, getModelForForm, getTagsFromModel } from '../lib/form';
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
        this.model = getModelForForm(this.schema, this.place);
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
      const tags = getTagsFromModel(this.model);

      return {
        name: this.properties.name,
        lat,
        lon,
        lang: this.$i18n.locale,
        tags: tags
      };
    }
  },

  methods: {
    submit() {
      const [ type, id ] = this.id.split('/');
      this.loading = true;
      fetch(
        `${apiUrl}/contribute/${type}/${id}`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(this.payload)
        }
      ).then((response) => {
        if (response.status === 200) {
          this.$emit('success');
          this.$store.commit('setContribution', [
             this.place.properties.fid,
             this.payload.tags.wheelchair,
             parseInt((Date.now() / 1000).toFixed(0))
           ]);
        }
      }).finally(() => {
        this.loading = false
      });
    },

    close() {
      this.$emit('close');
    }
  }
};
</script>
