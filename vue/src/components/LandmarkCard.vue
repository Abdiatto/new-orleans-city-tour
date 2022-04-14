<template>
  <router-link
    v-bind:to="{ name: 'landmarks', params: { id: activeLandMark.landMarkId } }"
    tag="article"
    class="landmark-card"
  >
    <h4>{{ activeLandMark.name }}</h4>
    <p>{{ activeLandMark.district.name }}</p>
    <dynamic-image
      :imagePath="activeLandMark.photos[0].path"
      :altText="`Picture of ${activeLandMark.name}`"
    />
  </router-link>
</template>

<script>
export default {
  name: "landmark-card",
  props: ["landmarkId"],
  computed: {
    activeLandMark() {
      return this.$store.state.allLandmarks.find(
        (l) => l.landMarkId == this.landmarkId
      );
    },
  },
};
</script>

<style scoped>
p {
  color: var(--complement);
}
article {
  --typography-spacing-vertical: -0.2rem;
  display: flex;
  flex-direction: column;
}
article .image-wrapper {
  flex-grow: 1;
}
h4 {
  --typography-spacing-vertical: -0.7rem;
  text-transform: uppercase;
}
.landmark-card:hover {
  cursor: pointer;
}
</style>
