<template>
  <div class="home">
    <div>
      <h1>Welcome to New Orleans</h1>
      <p>
        Known as The Big Easy, New Orleans is world-renowned for its distinctive
        music, Creole cuisine, unique dialects, and its annual celebrations and
        festivals, most notably its historical landmarks.
      </p>
    </div>
    <filter-search />
    <div class="grid">
      <landmark-card
        v-for="l in $store.state.filteredLandmarks"
        v-bind:key="l.landMarkId"
        v-bind:landmarkId="l.landMarkId"
      />
    </div>
  </div>
</template>

<script>
import LandmarkCard from "@/components/LandmarkCard.vue";
import FilterSearch from "@/components/FilterSearch.vue";

export default {
  name: "home",
  components: { LandmarkCard, FilterSearch },
};
</script>

<style scoped>
@media (min-width: 992px) {
  .grid {
    grid-template-columns: repeat(auto-fit, minmax(40%, 1fr));
  }
}
</style>
