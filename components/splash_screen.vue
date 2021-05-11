<template>
  <div class="d-flex align-center justify-center root accent-3">
    <div class="black--text text-center px-5">
      <v-progress-circular
        indeterminate
        color="primary"
        :size="30"
        :width="3"
      ></v-progress-circular>
      <h1 class="mb-10">{{ $t('title') }} : {{ $t('splash_subtitle1') }}</h1>
      <p>{{ $t('splash_subtitle2') }}</p>
    </div>
  </div>
</template>

<style scoped>
.root {
  position: fixed;
  top: 0;
  left: 0;
  height: 100vh;
  width: 100vw;
  z-index: 30;
  background-color: #D2E9EF;
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-image: url('../assets/splash_background.jpg');
}
</style>
