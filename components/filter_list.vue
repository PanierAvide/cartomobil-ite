<template>
  <v-container>
    <v-row dense>
      <v-col
        v-for="category in categories"
        :key="category"
        :value="category"
        cols="3"
        md="4"
        class="text-center category-col"
        @click="updateValue(category)"
      >
        <v-avatar color="grey darken-2">
          <v-icon color="white">{{ `osm-${category}` }}</v-icon>
        </v-avatar>
        <p class="text-subtitle2 mb-1">{{ $t(`categories.${category}`) }}</p>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  props: {
    value: {
      type: String,
      required: true
    }
  },

  computed: mapGetters(['categories']),

  methods: {
    updateValue(value) {
      this.$emit('input', value);
    }
  }
}
</script>

<style>
.category-col {
  cursor: pointer;
}

.category-col .v-avatar {
  margin: 2px;
  transition: transform .1s ease-in;
}

.category-col .v-avatar .v-icon {
  transition: transform .1s ease-in;
}

.category-col:hover .v-avatar {
  margin: 0px;
  width: 52px !important;
  height: 52px !important;
  min-width: 52px !important;
}

.category-col:hover .v-avatar .v-icon {
  font-size: 26px;
}
</style>
