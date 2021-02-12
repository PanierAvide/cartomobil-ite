<template>
  <note-detail
    ref="detail"
    :id="$route.params.id"
    :features-and-location="this.$route.params.featuresAndLocation"
  >
    <slot />
  </note-detail>
</template>

<script>
import NoteDetail from '../../../../components/place/note_detail';

export default {
  components: { NoteDetail },

  beforeRouteUpdate(to, from, next) {
    if (this.$refs.detail) {
      this.$refs.detail.beforeRouteUpdate(to, from, next);
    } else {
      next();
    }
  },

  beforeRouteLeave(to, from, next) {
    if (this.$refs.detail) {
      this.$refs.detail.beforeRouteLeave(to, from, next);
    } else {
      next();
    }
  }
};
</script>
