<template>
  <div>
    <v-alert
      :type="type"
      :icon="false"
      tile
      class="mb-0"
    >
      <p class="text-pre mb-0">{{ $t(`details.state.${status}`) }}</p>
      <p
        v-if="lastUpdate"
        class="body-2 font-weight-light mb-0"
      >
        {{ lastUpdateText }}
      </p>
      <template v-if="hasForm && !success && allowContribute">
        <br>
        <v-btn
          :disabled="contribute || lastUpdateTooRecent"
          @click="$emit('contribute')">{{ $t('details.signal') }}</v-btn>
      </template>
    </v-alert>
    <v-alert
      v-if="success"
      :icon="false"
      type="success"
      tile
      class="mb-0"
    >
      <span class="text-pre">{{ $t('details.signal_done') }}</span>
    </v-alert>

  </div>
</template>

<script>
import { colorForStatus } from '../../lib/place';
import { getForm } from '../../lib/form';

export default {

  props: {
    status: {
      type: String,
      required: true
    },

    place: {
      type: Object,
      required: true
    },

    lastUpdate: {
      type: Date,
      required: false
    },

    success: {
      type: Boolean,
      required: false
    },

    contribute: {
      type: Boolean,
      required: false
    },

    allowContribute: {
      type: Boolean,
      required: false,
      default: true
    }
  },

  computed: {
    hasForm() {
      return getForm(this.place) !== null;
    },

    type() {
      return colorForStatus(this.status);
    },

    lastUpdateTooRecent() {
      return this.lastUpdate && this.allowContribute && Date.now() - this.lastUpdate.getTime() < 1000*60*60;
    },

    lastUpdateText() {
      if (this.lastUpdateTooRecent) {
        return this.$t('details.last_update.recent');
      }
      const format = { weekday: 'long', day: 'numeric', month: 'long', hour: '2-digit', minute: '2-digit', year: 'numeric' };
      const date = this.lastUpdate.toLocaleString(this.$i18n.locale, format);
      return this.$t('details.last_update.date', { date });
    }
  }
};
</script>
