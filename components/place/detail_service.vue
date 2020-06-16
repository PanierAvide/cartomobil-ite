<template>
  <v-list-item>
    <v-list-item-icon><v-icon>{{ icon }}</v-icon></v-list-item-icon>
    <v-list-item-content>
      <v-list-item-title>
        {{ title }}
      </v-list-item-title>
    </v-list-item-content>
    <v-list-item-icon v-if="icon2"><v-icon>{{ icon2 }}</v-icon></v-list-item-icon>
  </v-list-item>
</template>

<script>
export default {
  props: {
    icon: {
      type: String,
      required: true
    },
    title: {
      type: String,
      required: true
    },
    icon2: {
       type: String,
       required: false
    }
  }
};
</script>
