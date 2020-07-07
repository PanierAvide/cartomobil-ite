<template>
  <div>
    <h1 class="title">{{ $t('contribute_form.title') }}</h1>
    <detail-schema
      :place="place"
      @modelChanged="editedTags = $event"
      @invalidModel="editedTags = null"
    />
    <v-container class="pt-0">
      <v-row>
        <v-col cols="6">
          <v-btn
            :loading="loading"
            color="success"
            @click="submit"
            :disabled="!canSubmit"
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
  </div>
</template>

<script>
import { apiUrl } from '../config.json';
import parseId from '../lib/parse_id';
import DetailSchema from './place/detail_schema';
import equals from 'fast-deep-equal';

export default {
  components: {
    DetailSchema
  },

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
      editedTags: null
    };
  },

  computed: {
    properties() {
      return this.place.properties;
    },

    id() {
      const { type, id } = parseId(this.place.id);
      return `${type}/${id}`;
    },

    canSubmit() {
      return this.editedTags !== null;
    },

    payload() {
      const [ lon, lat ] = this.place.geometry.coordinates;

      return {
        name: this.properties.name,
        lat,
        lon,
        lang: this.$i18n.locale,
        tags: this.editedTags
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
      this.editedTags = null;
      this.$emit('close');
    }
  }
};
</script>
