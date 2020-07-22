<template>
  <v-chip-group
    :value="chipValues"
    :show-arrows="false"
    :mobile-break-point="10000"
    class="px-2"
    column
    multiple
    @change="onChange"
  >
    <v-chip
      v-for="subfilter in subfilters"
      :key="subfilter"
      :value="subfilter"
      label
      active-class="primary--text"
    >
      <v-icon small>{{ `osm-${subfilter}` }}</v-icon>
      <span class="pl-1">{{ $t(`categories.${subfilter}`) }}</span>
    </v-chip>
  </v-chip-group>
</template>

<script>
import { decodeFilter, encodeFilter } from '../lib/categories';

export default {
  props: {
    value: {
      type: String,
      required: false,
      default: undefined
    },
    subfilters: {
      type: Array,
      required: true
    }
  },

  computed: {
    chipValues() {
      const [ category, subcategories, subfilters ] = decodeFilter(this.value);
      return subfilters;
    }
  },

  methods: {
    onChange(v) {
      const [ category, subcategories, subfilters ] = decodeFilter(this.value);
      this.$emit('input', encodeFilter(category, subcategories, v));
    }
  }
};
</script>
