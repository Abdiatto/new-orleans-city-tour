<template>
  <router-link
    v-bind:to="{ name: 'landmarks', params: { id: activeLandMark.id } }"
    tag="article"
    class="landmark-card"
  >
    <h4>{{ activeLandMark.name }}</h4>
    <p>{{ activeLandMark.content }}</p>
    <dynamic-image :imagePath="activeLandMark.photos[0].path" />
  </router-link>
</template>

<script>
export default {
  name: "landmark-card",
  props: ["landmarkId"],
  computed: {
    activeLandMark() {
      return this.$store.state.allLandmarks.find(
        (l) => l.id == this.landmarkId
      );
    },
  },
};
</script>

<style>
.landmark-card:hover {
  cursor: pointer;
}
</style>
