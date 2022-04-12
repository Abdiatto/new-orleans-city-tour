<template>
  <article>
    <h2>{{ activeLandmark.name }}</h2>
    <dynamic-image :imagePath="activeLandmark.photos[0].path" />
    <p>
      {{ activeLandmark.content }}
    </p>
  </article>
</template>

<script>
export default {
  created() {
    this.$store.commit("SET_ACTIVE_LANDMARK", this.$route.params.id);
  },
  computed: {
    activeLandmark() {
      return this.$store.state.allLandmarks.find((landmark) => {
        return landmark.landMarkId == this.$store.state.activeLandmarkId;
      });
    },
  },
};
</script>

<style></style>
