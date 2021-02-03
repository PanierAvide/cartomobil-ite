<template>
  <v-form
    ref="form"
    v-model="valid"
  >
    <div class="d-flex align-center pa-2 mb-3 elevation-4">
      <v-btn
        icon
        @click="close"
      >
        <v-icon>osm-arrow-left</v-icon>
      </v-btn>
      <h1 class="title">{{ $t(`note_form.title.${this.type}`) }}</h1>
    </div>

    <v-alert
      dense
      type="info"
      class="mx-3"
    >
      {{ $t('note_form.move_marker') }}
    </v-alert>

    <v-jsf
      v-model="model"
      :schema="schema"
      :options="formOptions"
      class="pb-0 mx-3"
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
import { getFormById, getTagsFromModel, getFormOptions, getFormObjectName } from '../lib/form';

export default {
  props: {
    type: {
      type: String,
      required: true
    },

    position: {
      type: Object,
      required: true
    },
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
    if(this.type) {
      this.schema = getFormById(this.type);
      this.model = {};
    }
  },

  watch: {
    type() {
      if(this.type) {
        this.schema = getFormById(this.type);
        this.model = {};
      }
    }
  },

  computed: {
    canSubmit() {
      return this.valid && Object.values(this.editedTags).filter(v => v && v !== "null").length > 0;
    },

    editedTags() {
      return getTagsFromModel(this.model);
    },

    details() {
      return `Merci de vérifier consciencieusement les informations saisies et d'ajouter dans OSM les attributs qui décrivent le mieux la situation #${this.type}`;
    },

    payload() {
      return {
        name: getFormObjectName(this.type),
        lat: this.position.lat,
        lon: this.position.lng,
        lang: this.$i18n.locale,
        tags: this.editedTags,
        details: this.details
      };
    }
  },

  methods: {
    submit() {
      this.loading = true;
      fetch(
        `${apiUrl}/contribute/new`,
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
          this.close();
        }
      }).finally(() => {
        this.loading = false
      });
    },

    close() {
      this.$store.commit('addNewPlaceType', null);
      this.$emit('close');
    }
  }
};
</script>
