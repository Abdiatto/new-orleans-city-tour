<template>
  <div class="home">
    <h1>Visit the Big Easy</h1>
    <div class="grid">
      <landmark-card v-bind:landmarkId="0" />
      <landmark-card v-bind:landmarkId="1" />
      <landmark-card v-bind:landmarkId="2" />
      <landmark-card v-bind:landmarkId="2" />
      <landmark-card v-bind:landmarkId="2" />
    </div>
  </div>
</template>

<script>
import LandmarkCard from "@/components/LandmarkCard.vue";

export default {
  name: "home",
  components: { LandmarkCard },
};
</script>

<style scoped>
@media (min-width: 992px) {
  .grid {
    grid-template-columns: repeat(auto-fit, minmax(40%, 1fr));
  }
}
</style>
