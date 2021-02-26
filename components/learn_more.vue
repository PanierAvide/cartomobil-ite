<template>
  <v-dialog
    v-model="dialog"
    :eager="true"
    :width="600"
  >
    <template v-slot:activator="{ on }">
      <v-list-item v-on="on">
        <v-list-item-icon class="mr-0">
          <v-icon small color="#FBC213">osm-info</v-icon>
        </v-list-item-icon>
        <v-list-item-content class="ml-2">
          <v-list-item-title class="body-1">{{ $t('learnmore.title') }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </template>

    <v-card>
      <v-card-title>
        {{ $t('learnmore.title') }}
        <v-spacer></v-spacer>
        <v-btn
          icon
          @click="dialog = false"
        >
          <v-icon>osm-close</v-icon>
        </v-btn>
      </v-card-title>
      <v-card-text>
        <p class="text-pre">{{ $t('learnmore.description', { brand }) }}</p>
        <v-row>
          <v-col
            cols="12"
            md="5"
          >
            <h2 class="mb-3">{{ $t('learnmore.about') }}</h2>
            <ul>
              <li>
                <a :href="links.blog" target="_blank" rel="noopener">
                  {{ $t('learnmore.blog') }}
                </a>
              </li>
              <li>
                <a :href="links.about" target="_blank" rel="noopener">
                  {{ $t('learnmore.about') }}
                </a>
              </li>
              <li>
                <a :href="links.disclaimer" target="_blank" rel="noopener">
                  {{ $t('learnmore.disclaimer') }}
                </a>
              </li>
            </ul>
          </v-col>
          <v-col
            cols="12"
            md="7"
          >
            <h2 class="mb-3">{{ $t('learnmore.contact_us') }}</h2>
            <ul>
              <li>
                <a :href="links.email" target="_blank" rel="noopener">
                  {{ $t('learnmore.email') }}
                </a>
              </li>
              <li>
                <a :href="links.issues" target="_blank" rel="noopener">
                  {{ $t('learnmore.bugs') }}
                </a>
              </li>
              <li>
                <a :href="links.issues" target="_blank" rel="noopener">
                  {{ $t('learnmore.category') }}
                </a>
              </li>
            </ul>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
import i18nMixin from './mixins/i18n';

export default {
  mixins: [i18nMixin],

  data() {
    return {
      dialog: false
    };
  }
};
</script>
