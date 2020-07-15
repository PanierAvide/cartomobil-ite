<template>
  <v-form
    ref="form"
    v-model="valid"
  >
    <v-jsf
      v-model="model"
      :schema="schema"
      :options="formOptions"
      class="pb-0"
      @change="submitTags"
      @input="submitTags"
    />
  </v-form>
</template>

<script>
import { getForm, getModelForForm, getTagsFromModel, getReadOnlyForm } from '../../lib/form';
let delaySubmitTags = null;

export default {
  components: {},

  props: {
    place: {
      type: Object,
      required: true
    },
    readOnly: {
      type: Boolean,
      required: false,
      default: false
    }
  },

  data() {
    return {
      valid: false,
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
        },
        childrenClass: this.readOnly ? "pl-0 form-field-readonly" : "pl-2",
        disableAll: this.readOnly
      }
    };
  },

  mounted() {
    if(this.place) {
      this.schema = getForm(this.place) || {};
      if(Object.keys(this.schema).length > 0) {
        this.model = getModelForForm(this.schema, this.place);
        if(this.readOnly) {
          this.schema = getReadOnlyForm(this.schema, this.model) || {};
        }
      }
    }
  },

  methods: {
    submitTags(e, skipValidate) {
      if(delaySubmitTags) {
        clearTimeout(delaySubmitTags);
        delaySubmitTags = null;
      }

      if(this.readOnly || !this.$refs.form || !this.place) {
        return false;
      }

      delaySubmitTags = setTimeout(() => {
        delaySubmitTags = null;
        if(!skipValidate && !this.valid) {
          this.$refs.form.validate();
          return this.$nextTick(() => this.submitTags(e, true));
        }

        if(!this.model || !this.valid) {
          return this.$emit('invalidModel');
        }

        const newTags = getTagsFromModel(this.model);
        for(let e of Object.entries(newTags)) {
          const [editedKey, editedVal] = e;
          if(
            (editedVal !== "null" && this.place.properties.tags[editedKey] !== editedVal)
            || (editedVal === "null" && this.place.properties.tags[editedKey] !== undefined)
          ) {
            return this.$emit('modelChanged', newTags);
          }
        }
      }, 500);
    }
  }
};
</script>

<style>
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
}

.vjsf-property-equipments.pl-2,
.vjsf-property-basics.pl-2,
.vjsf-property-details.pl-2,
.vjsf-property-equipments.pl-2 > div > .vjsf-property.pl-2,
.vjsf-property-basics.pl-2 > div > .vjsf-property.pl-2,
.vjsf-property-details.pl-2 > div > .vjsf-property.pl-2 {
  padding: 0 !important;
}
</style>
