<template>
  <v-btn-toggle
    dense multiple
    value="status"
    @change="onBtnChange"
  >
    <v-btn :class="status.includes('no') && 'status-switch-active'" value="no" small :title="$t('details.state_short.no')">
      <v-icon>osm-status_no</v-icon>
    </v-btn>

    <v-btn :class="status.includes('limited') && 'status-switch-active'" value="limited" small :title="$t('details.state_short.limited')">
      <v-icon color="warning">osm-status_limited</v-icon>
    </v-btn>

    <v-btn :class="status.includes('yes') && 'status-switch-active'" value="yes" small :title="$t('details.state_short.yes')">
      <v-icon color="success">osm-status_yes</v-icon>
    </v-btn>
  </v-btn-toggle>
</template>

<script>
import i18nMixin from './mixins/i18n';

export default {
  mixins: [i18nMixin],

  props: ['status'],

  methods: {
    onBtnChange(v) {
      this.$emit('update:status', v);
    },
  },
};
</script>

<style scoped>
.status-switch-active {
  background-color: #CFCFCF !important;
}
</style>
