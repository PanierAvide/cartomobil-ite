<template>
  <div
    v-if="allCategories[category]"
    class="root"
  >
    <v-chip-group
      :show-arrows="false"
      :value="value"
      :column="expand"
      :mobile-break-point="10000"
      @change="(v) => $emit('input', v || category)"
      ref="chipsubcat"
    >
      <v-chip
        v-for="{ subcategory, text } in subCategories"
        :key="subcategory"
        :value="`${category}/${subcategory}`"
        active-class="primary--text"
      >
        <v-icon small>{{ `osm-${subcategory}` }}</v-icon>
        <span class="pl-1">{{ text }}</span>
      </v-chip>
    </v-chip-group>
    <v-btn
      v-if="!hideExpandButton"
      :elevation="2"
      :class="{ less: expand, more: !expand }"
      large
      icon
      class="white"
      @click="expand = !expand"
    >
      <v-icon v-if="expand">osm-chevron_up</v-icon>
      <v-icon v-else>osm-chevron_down</v-icon>
    </v-btn>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  props: {
    value: {
      type: String,
      required: true
    },
    category: {
      type: String,
      required: true
    }
  },

  data() {
    return {
      expand: false,
      hideExpandButton: false
    };
  },

  mounted() {
    if(this.$refs.chipsubcat.$refs.content.clientWidth <= this.$refs.chipsubcat.$refs.wrapper.clientWidth) {
      this.hideExpandButton = true;
    }
  },

  computed: {
    ...mapGetters(['allCategories']),

    subCategories() {
      return Object.keys(this.allCategories[this.category].subcategories).map((subcategory) => {
        return {
          subcategory,
          text: this.$t(`categories.${subcategory}`)
        }
      });//.sort((a, b) => a.text.localeCompare(b.text));
    }
  }
}
</script>

<style scoped>
.root {
  position: relative;
}
.more {
  position: absolute;
  right: 5px;
  top: 0;
}
.less {
  position: absolute;
  right: 5px;
  bottom: 0;
}
</style>
