<template>
  <v-toolbar
    :dense="!isMobile || !geocoder"
    :height="isMobile && geocoder ? '70px' : undefined"
    class="search mt-md-5"
  >
    <v-tooltip
      v-if="!isMobile"
      bottom
    >
      <template v-slot:activator="{ on }">
        <v-btn
          icon
          v-on="on"
          @click.native="clickExpand"
        >
          <v-icon>{{ expanded ? "osm-chevron_left" : "osm-chevron_right" }}</v-icon>
        </v-btn>
      </template>
      <span>{{ $t('menu') }}</span>
    </v-tooltip>

    <template v-if="isMobile">
      <template v-if="!geocoder">
        <img
          :alt="$t('subtitle')"
          :src="logoMobile"
          class="img-header-mobile"
        />
        <v-spacer></v-spacer>
      </template>

      <v-tooltip
        v-if="!geocoder"
        bottom
      >
        <template v-slot:activator="{ on }">
          <v-btn
            icon
            v-on="on"
            @click="geocoder = true"
          >
            <v-icon>osm-magnify</v-icon>
          </v-btn>
        </template>
        <span>{{ $t('search') }}</span>
      </v-tooltip>

      <geocoder
        v-show="geocoder"
        @select="onGeocoderSelect"
        @blur="onGeocoderBlur"
      />
    </template>
  </v-toolbar>
</template>

<script>
import Geocoder from './geocoder';
import i18nMixin from './mixins/i18n';
import isMobile from './mixins/is_mobile';

export default {
  components: {
    Geocoder
  },

  mixins: [i18nMixin, isMobile],

  data() {
    return {
      geocoder: false,
      expanded: true
    };
  },

  methods: {
    clickExpand() {
      this.$emit('toggleSidebar');
      this.expanded = !this.expanded;
    },

    onGeocoderSelect(bbox) {
      this.geocoder = false;
      this.$emit('onGeocode', bbox);
    },

    onGeocoderBlur() {
      this.geocoder = false;
    }
  }
}
</script>

<style>
.search {
  position: absolute;
  z-index: 4;
}
.sm .search {
  width: 100%;
}
.img-header-mobile {
  max-height: 40px;
  max-width: 80%;
}
.v-application--is-ltr .v-toolbar__content > .v-btn.v-btn--icon {
  margin-right: -12px;
}
</style>
