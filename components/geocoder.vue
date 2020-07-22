<template>
  <v-autocomplete
    v-model="selected"
    :items="items"
    :loading="isLoading"
    :search-input.sync="search"
    :error="!!error"
    :placeholder="$t('search')"
    autofocus
    hide-no-data
    hide-details
    no-filter
    outlined
    dense
    background-color="white"
    prepend-inner-icon="osm-magnify"
    @blur="$emit('blur')"
    class="autocomplete-big"
  >
    <template v-slot:item="{ item }">
      <v-list-item-content>
        <v-list-item-title v-text="item.text"></v-list-item-title>
        <v-list-item-subtitle v-text="item.region"></v-list-item-subtitle>
      </v-list-item-content>
    </template>
  </v-autocomplete>
</template>

<script>
import { nominatimUrl, mapBounds } from '../config.json';
import { countries } from '../categories.json';
import debounce from 'lodash.debounce';

export default {
  data() {
    return {
      isLoading: false,
      items: [],
      search: '',
      selected: null,
      error: null
    };
  },

  watch: {
    search: debounce(function (val) {
      if (this.controller) {
        this.controller.abort();
        this.controller = null;
      }
      if (!val || val.trim().length < 3) return;

      // Direct coordinates input ?
      let directCoordinates = null;
      if(/^-?\d+\.\d+[,;/]-?\d+\.\d+$/.test(val.trim().replace(/ /g, ''))) {
        const separator = val.includes(',') ? ',' : (val.includes('/') ? '/' : ';');
        const coordsLatLng = val.split(separator).map(c => parseFloat(c.trim()));
        const bbox = [ coordsLatLng[1] - 0.0005, coordsLatLng[0] - 0.0005, coordsLatLng[1] + 0.0005, coordsLatLng[0] + 0.0005 ];
        directCoordinates = {
          text: this.$t('coordinates'),
          region: coordsLatLng.join(', '),
          value: bbox
        };
        this.items = [ directCoordinates ];
      }

      this.error = null;
      this.isLoading = true;
      this.controller = new AbortController();
      const signal = this.controller.signal;
      const boundary = countries.join(',').toLowerCase();
      let url = `${nominatimUrl}/search?q=${encodeURIComponent(this.search)}&format=json&countrycodes=${boundary}&limit=5&accept-language=${this.$i18n.locale}`;
      if(mapBounds) {
        const [[minlon, minlat], [maxlon, maxlat]] = mapBounds;
        url += `&viewbox=${minlon},${minlat},${maxlon},${maxlat}&bounded=1`
      }

      fetch(url, { signal })
        .then(res => res.json())
        .then(results => {
          this.error = null;
          this.items = results.map(r => {
            const labels = r.display_name.split(', ');
            const [ minlat, maxlat, minlon, maxlon ] = r.boundingbox.map(v => parseFloat(v));
            const osmid = r.osm_type && r.osm_id ? `${r.osm_type.substring(0,1)}${r.osm_id}` : null;
            return {
              text: labels[0],
              region: labels.splice(1).join(", "),
              value: [minlon, minlat, maxlon, maxlat, osmid]
            };
          });
          if(directCoordinates) { this.items.unshift(directCoordinates); }
        })
        .catch(err => {
          this.error = err;
        })
        .finally(() => {
          this.isLoading = false;
        });
    }, 350, { maxWait: 500 }),

    selected(val) {
      if (Array.isArray(val)) {
        this.$emit('select', val);
      }
    }
  }
}
</script>

<style>
.xs .autocomplete-big input,
.sm .autocomplete-big input {
  font-size: 1.5rem;
  line-height: 35px;
  max-height: 35px;
}

.xs .autocomplete-big .v-input__prepend-inner,
.sm .autocomplete-big .v-input__prepend-inner {
  margin-top: 6px;
}
</style>
