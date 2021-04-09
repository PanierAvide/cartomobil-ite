<template>
  <div class="full-width d-flex flex-column flex-grow-1 menu">
    <div class="d-flex align-center pa-2 mb-2 elevation-4">
      <v-btn
        icon
        @click="clearSelection"
      >
        <v-icon>osm-arrow-left</v-icon>
      </v-btn>
      <h1 class="title">{{ $t(`categories.${category}`) }}</h1>
    </div>

    <filter-subcategories
      :value="value"
      :category="category"
      class="px-2"
      @input="(v) => $emit('input', v)"
    />

    <template v-if="subcategories && subcategories.length === 1 && availableSubfilters.length > 0">
      <v-divider />

      <filter-subfilters
        :value="value"
        :subfilters="availableSubfilters"
        @input="(v) => $emit('input', v)"
      />
    </template>

    <template v-if="notes.length > 0">
      <v-divider />
      <p
        v-for="note in notes"
        :key="note"
        v-html="note"
        class="body-2 font-weight-light ma-4 my-2"
      />
    </template>

    <v-skeleton-loader
      v-if="loading && !results"
      :type="`list-item-two-line@${this.pageSize}`"
    />
    <v-list
      v-else-if="results"
      v-touch="{ left: goNext, right: goPrev }"
      class="pt-0"
    >
      <template v-for="place in results.features">
        <v-divider />
        <place-dense
          :key="place.id"
          :place="place"
          :featuresAndLocation="featuresAndLocation"
          :display-type="!hasSelectedSubCategory"
          @mouseenter.native="$store.commit('highlightPlace', place)"
          @mouseleave.native="$store.commit('highlightPlace', null)"
        />
      </template>
      <v-divider />
    </v-list>
    <div
      v-else
      class="pa-2"
    >
      {{ $t('filter_noresults') }}
    </div>
    <div class="mb-2 text-center">
      <v-btn
        :disabled="!canGoPrev"
        icon
        large
        @click="goPrev"
      >
        <v-icon>osm-chevron_left</v-icon>
      </v-btn>
      {{pageText}}
      <v-btn
        :disabled="!canGoNext"
        icon
        large
        @click="goNext"
      >
        <v-icon>osm-chevron_right</v-icon>
      </v-btn>
    </div>

    <v-spacer />

    <v-list class="pb-0">
      <v-divider />
      <map-settings :filter="filter" />
      <v-divider />
      <missing-shop-dialog />
    </v-list>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
import _debounce from 'lodash.debounce';
import { poiFeature } from '../config.json';
import { availableSubFilters, decodeFilter, encodeFilter } from '../lib/categories';
import { decode } from '../lib/url';
import isMobile from './mixins/is_mobile';
import PlaceDense from './place/dense';
import FilterSubcategories from './filter_subcategories';
import FilterSubfilters from './filter_subfilters';
import MapSettings from './map_settings';
import MissingShopDialog from './missing_shop_dialog';

const debounce = process.env.NODE_ENV === 'production' ? _debounce : fn => fn;
const PAGE_SIZE = { "mobile": 5, "wide": 8 };

export default {
  components: {
    FilterSubfilters,
    FilterSubcategories,
    PlaceDense,
    MapSettings,
    MissingShopDialog,
  },

  mixins: [isMobile],

  props: {
    value: {
      type: String,
      required: true
    },

    mapBounds: {
      type: Array,
      required: true,
    },

    featuresAndLocation: {
      type: String,
      required: false,
      default: ''
    },

    nbPlacesVisible: {
      type: Number,
      required: false,
      default: 0
    }
  },

  data() {
    return {
      loading: true,
      offset: 0,
      results: null,
      filter: ''
    };
  },

  mounted() {
    this.fetchResults();
    const { filter, location } = decode(this.featuresAndLocation);
    this.filter = filter;
  },

  computed: {
    ...mapGetters(['allCategories']),

    category() {
      return decodeFilter(this.value)[0];
    },

    subcategories() {
      return this.hasSelectedSubCategory ? decodeFilter(this.value)[1] : null;
    },

    hasSelectedSubCategory() {
      return this.value.includes('/');
    },

    subfilters() {
      const [cat,subcats,subfilts,status] = decodeFilter(this.value);
      return subfilts;
    },

    filterParams() {
      const params = [];
      const [cat,subcats,subfilts,status] = decodeFilter(this.value);

      if(subfilts) { params.push(['cat3',subfilts]); }
      else if(subcats) { params.push(['cat2',subcats]); }
      else { params.push(['cat1', cat]); }

      if(status) {
        if(status.place) { params.push(['status', status.place]); }
        if(status.service) { params.push(['status_service', status.service]); }
      }

      return params;
    },

    filterName() {
      const [cat,subcats,subfilts,status] = decodeFilter(this.value);
      if(subfilts) { return 'cat3'; }
      else if(subcats) { return 'cat2'; }
      else { return 'cat1'; }
    },

    filterValue() {
      const [cat,subcats,subfilts,status] = decodeFilter(this.value);
      if(subfilts) { return subfilts; }
      else if(subcats) { return subcats; }
      else { return cat; }
    },

    availableSubfilters() {
      return availableSubFilters(this.allCategories, this.value);
    },

    canGoPrev() {
      return !this.loading && this.offset > 0;
    },

    canGoNext() {
      return !this.loading && this.results && this.results.numberReturned === this.pageSize && (this.nbPlacesVisible === 0 || this.offset + this.results.numberReturned < this.nbPlacesVisible);
    },

    pageSize() {
      return this.isMobile ? PAGE_SIZE.mobile : PAGE_SIZE.wide;
    },

    pageText() {
      const currentPage = Math.ceil(this.offset / this.pageSize) + 1;
      const totalPages = Math.ceil(this.nbPlacesVisible / this.pageSize);
      return this.loading || !this.nbPlacesVisible || currentPage > totalPages ? "" : currentPage + " / " + (this.canGoNext ? totalPages : currentPage);
    },

    notes() {
      const notes = [];

      // Category note
      if(this.category && this.$te(`categories_notes.${this.category}`)) {
        notes.push(this.$t(`categories_notes.${this.category}`));
      }
      if(this.subcategories) {
        this.subcategories.forEach(sc => {
          if(this.$te(`categories_notes.${sc}`)) {
            notes.push(this.$t(`categories_notes.${sc}`));
          }
        });
      }
      if(this.subfilters) {
        this.subfilters.forEach(sf => {
          if(this.$te(`categories_notes.${sf}`)) {
            notes.push(this.$t(`categories_notes.${sf}`));
          }
        });
      }

      return notes;
    }
  },

  watch: {
    mapBounds(value, oldValue) {
      this.offset = 0;
      this.fetchResults();
    },

    value() {
      this.results = null;
      this.offset = 0;
      this.loading = true;
      this.fetchResults();
    }
  },

  methods: {
    clearSelection() {
      const [cat,subcats,subfilts,status] = decodeFilter(this.value);
      this.$emit('input', encodeFilter(null, null, null, status));
    },

    goPrev() {
      if (this.canGoPrev) {
        this.updateOffset(this.offset - this.pageSize);
      }
    },

    goNext() {
      if (this.canGoNext) {
        this.updateOffset(this.offset + this.pageSize);
      }
    },

    updateOffset(offset) {
      this.offset = offset;
      this.results = null;
      this.loading = true;
      this.fetchResults();
    },

    fetchResults: debounce(function () {
      if (this.value === '' || this.mapBounds.length === 0) {
        this.loading = false;
        return;
      }
      this.loading = true;
      const params = [
        ['limit', this.pageSize],
        ['offset', this.offset],
        ['bbox', this.mapBounds],
        ['orderby', 'status_order'],
        ...this.filterParams
      ];
      fetch(`${poiFeature}?${new URLSearchParams(params)}`)
        .then(res => res.json())
        .then((json) => {
          this.results = json;
          this.loading = false;
        }).catch(() => {
          this.results = null;
          this.loading = false;
        });
    }, 1000)
  }
}
</script>
