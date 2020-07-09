<template>
  <v-chip-group
    :value="value"
    :show-arrows="false"
    :mobile-break-point="10000"
    class="px-2"
    column
    @change="(v) => $emit('input', v)"
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
  }
};
</script>
