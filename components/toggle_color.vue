<template>
  <v-tooltip top>
    <template v-slot:activator="{ on }">
      <v-btn
        :height="50"
        tile
        text
        v-on="on"
        @click="colorBlind = !colorBlind"
      >
        <img
          v-if="colorBlind"
          src="~/assets/color_blind.svg"
        />
        <img
          v-else
          src="~/assets/color_normal.svg"
        />
      </v-btn>
    </template>
    <span>{{ $t(`toggle_color.${this.colorBlind ? 'normal': 'blind'}`) }}</span>
  </v-tooltip>
</template>

<script>
import colors from 'vuetify/lib/util/colors';
import { getCookie, setCookie } from '../lib/cookie';

const COLOR_BLIND_COOKIE = 'colorBlind';

export default {
  data() {
    return {
      colorBlind: getCookie(COLOR_BLIND_COOKIE) === "true" ? true : false
    };
  },

  watch: {
    colorBlind: {
      immediate: true,
      handler() {
        const theme = this.$vuetify.theme.themes.light;
        if (this.colorBlind) {
          theme.success = '#368CD3';
          theme.error = '#FBC213';
        } else {
          theme.success = '#49BC39';
          theme.error = '#E94720';
        }
        setCookie(COLOR_BLIND_COOKIE, this.colorBlind);
      }
    }
  }
}
</script>
