<template>
  <div
    v-if="allCategories[category]"
    class="root"
  >
    <v-chip-group
      :show-arrows="false"
      :value="chipValues"
      :column="expand"
      :mobile-break-point="10000"
      multiple
      @change="onChange"
      ref="chipsubcat"
    >
      <v-chip
        v-for="{ subcategory, text } in subCategories"
        :key="subcategory"
        :value="subcategory"
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
    if(this.$refs.chipsubcat && this.$refs.chipsubcat.$refs.content.clientWidth <= this.$refs.chipsubcat.$refs.wrapper.clientWidth) {
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
    },

    chipValues() {
      const parts = this.value.split("/");
      if(parts.length > 1) {
        return parts[1].split(",");
      }
      else {
        return [];
      }
    }
  },

  methods: {
    onChange(v) {
      const newValue = v.length > 0 ? `${this.category}/${v.join(",")}` : this.category;
      this.$emit('input', newValue);
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
