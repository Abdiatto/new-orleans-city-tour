<template>
  <div class="home">
    <h1>Visit the Big Easy</h1>
    <div class="grid">
      <landmark-card
        v-for="l in $store.state.allLandmarks"
        v-bind:key="l.landMarkId"
        v-bind:landmarkId="l.landMarkId"
      />
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
