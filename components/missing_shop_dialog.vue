<template>
  <v-dialog
    v-model="dialog"
    :eager="true"
    max-width="900"
  >
    <template v-slot:activator="{ on }">
      <v-list-item v-on="on">
        <v-list-item-icon class="mr-0">
          <v-icon small>osm-plus</v-icon>
        </v-list-item-icon>
        <v-list-item-content class="ml-2">
          <v-list-item-title class="body-1">{{ $t('learnmore.contribute') }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </template>

    <v-card>
      <v-card-title>
        {{ $t('learnmore.contribute') }}
        <v-spacer></v-spacer>
        <v-btn
          icon
          @click="dialog = false"
        >
          <v-icon>osm-close</v-icon>
        </v-btn>
      </v-card-title>
      <v-card-text>
        <p class="mb-0">{{ $t('missing_shop_dialog.contribute') }}</p>
        <v-row>
          <v-col
            cols="12"
            md="6"
            lg="3"
          >
            <v-btn
              class="full-width"
              outlined
              color="primary"
              @click="addNewPlace('barrier')"
            >
              <v-icon class="mr-1">osm-plus</v-icon>
              {{ $t('missing_shop_dialog.cta_add_barrier') }}
            </v-btn>
          </v-col>
          <v-col
            cols="12"
            md="6"
            lg="3"
          >
            <v-btn
              class="full-width"
              outlined
              color="primary"
              @click="addNewPlace('parking_pmr')"
            >
              <v-icon class="mr-1">osm-plus</v-icon>
              {{ $t('missing_shop_dialog.cta_add_pmr_parking') }}
            </v-btn>
          </v-col>
          <v-col
            cols="12"
            md="6"
            lg="3"
          >
            <v-btn
              class="full-width"
              outlined
              color="primary"
              @click="addNewPlace('toilets')"
            >
              <v-icon class="mr-1">osm-plus</v-icon>
              {{ $t('missing_shop_dialog.cta_add_toilets') }}
            </v-btn>
          </v-col>
          <v-col
            cols="12"
            md="6"
            lg="3"
          >
            <v-btn
              class="full-width"
              outlined
              color="secondary"
              @click="addNewPlace('note')"
            >
              <v-icon class="mr-1">osm-plus</v-icon>
              {{ $t('missing_shop_dialog.cta_note') }}
            </v-btn>
          </v-col>
        </v-row>

        <p class="mb-0 mt-2">{{ $t('missing_shop_dialog.read_docs') }}</p>

        <v-row>
          <v-col
            cols="12"
            md="6"
          >
            <v-btn
              :href="links.contribute_cro"
              class="full-width"
              outlined
              color="secondary"
              target="_blank"
            >
              {{ $t('missing_shop_dialog.cta_improve') }}
            </v-btn>
          </v-col>
          <v-col
            cols="12"
            md="6"
          >
            <v-btn
              :href="links.email"
              class="full-width"
              outlined
              color="secondary"
            >
              {{ $t('missing_shop_dialog.cta_contact') }}
            </v-btn>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapState } from 'vuex';
import i18nMixin from './mixins/i18n';

export default {
  mixins: [i18nMixin],

  data() {
    return {
      dialog: false
    };
  },

  computed: mapState(['country']),

  watch: {
    dialog(value) {
      if (!value) return;
      _paq.push(['trackEvent', 'MissingShop', 'Open']);
    }
  },

  methods: {
    addNewPlace(category) {
      this.$store.commit('addNewPlaceType', category);
    }
  }
};
</script>
