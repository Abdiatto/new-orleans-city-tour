<template>
  <div class="home">
    <h1>Welcome to New Orleans</h1>
    <p>
      Lorem ipsum, dolor sit amet consectetur adipisicing elit. Earum esse
      minima beatae odio consectetur totam. Ut ad neque eos quod doloremque
      illum animi atque odit facere blanditiis, ipsam ratione delectus.
    </p>
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
