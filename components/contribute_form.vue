<template>
  <v-form
    ref="form"
    v-model="valid"
  >
    <h1 class="title">{{ $t('contribute_form.title') }}</h1>

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
            :disabled="!canSubmit"
            block
          >
            {{ $t('contribute_form.submit') }}
          </v-btn>
        </v-col>
        <v-col cols="6">
          <v-btn
            :disabled="loading"
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
</template>

<script>
import { apiUrl } from '../config.json';
import parseId from '../lib/parse_id';
import DetailSchema from './place/detail_schema';
import equals from 'fast-deep-equal';
import { getForm, getModelForForm, getTagsFromModel, getFormOptions, completeModel, getTagsToSendAsNotes } from '../lib/form';

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
      loading: false,
      valid: false,
      model: {},
      schema: {},
      formOptions: getFormOptions(this.$i18n.locale, false)
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

    canSubmit() {
      return this.valid && this.haveTagsChanged;
    },

    editedTags() {
      return getTagsFromModel(this.model);
    },

    haveTagsChanged() {
      for(let e of Object.entries(this.editedTags)) {
        const [editedKey, editedVal] = e;
        if(
          (editedVal !== "null" && this.place.properties.tags[editedKey] !== editedVal)
          || (editedVal === "null" && this.place.properties.tags[editedKey] !== undefined)
        ) {
          return true;
        }
      }

      return false;
    },

    details() {
      let detailsTxt = null;

      // Find changed tags
      let changedTags = [];
      for(let e of Object.entries(this.editedTags)) {
        const [editedKey, editedVal] = e;
        if(
          (editedVal !== "null" && this.place.properties.tags[editedKey] !== editedVal)
          || (editedVal === "null" && this.place.properties.tags[editedKey] !== undefined)
        ) {
          changedTags.push(editedKey);
        }
      }

      // Check if changed tags should be sent as note
      const tagsAsNotes = getTagsToSendAsNotes(this.schema);
      if(Object.keys(tagsAsNotes).filter(k => changedTags.includes(k)).length > 0) {
        detailsTxt = 'Ces attributs sont à vérifier attentivement : ';
        detailsTxt += changedTags.filter(k => tagsAsNotes[k] !== undefined).map(k => `${k} (${tagsAsNotes[k]})`).join(", ");
      }

      return detailsTxt;
    },

    payload() {
      const [ lon, lat ] = this.place.geometry.coordinates;

      return {
        name: this.properties.name,
        lat,
        lon,
        lang: this.$i18n.locale,
        tags: this.editedTags,
        details: this.details
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
             this.payload.tags.wheelchair === 'null' ? 'unknown' : this.payload.tags.wheelchair,
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
