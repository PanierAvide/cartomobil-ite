<template>
  <v-form>
    <v-jsf
      v-model="model"
      :schema="schema"
      :options="formOptions"
      class="pb-0"
    />
  </v-form>
</template>

<script>
import { getForm, getModelForForm, getReadOnlyForm, getFormOptions } from '../../lib/form';

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
      model: {},
      schema: {},
      formOptions: getFormOptions(this.$i18n.locale, true)
    };
  },

  mounted() {
    if(this.place) {
      this.schema = getForm(this.place) || {};
      if(Object.keys(this.schema).length > 0) {
        this.model = getModelForForm(this.schema, this.place);
        this.schema = getReadOnlyForm(this.schema, this.model) || {};
      }
    }
  }
};
</script>
