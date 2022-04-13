<template>
  <article>
    <dynamic-image
      :imagePath="activeLandmark.photos[0].path"
      :altText="`Picture of ${activeLandmark.name}`"
    />
    <h2>{{ activeLandmark.name }}</h2>
    <div>
      <p>{{ activeLandmark.district.name }}</p>
      <address-line :address="activeLandmark.address" />
    </div>
    <h6>About</h6>
    <p class="content">
      {{ activeLandmark.content }}
    </p>
  </article>
</template>

<script>
import AddressLine from "@/components/AddressLine.vue";
export default {
  components: { AddressLine },
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

<style scoped>
article {
  --typography-spacing-vertical: -0.2rem;
}
h2 {
  --typography-spacing-vertical: -0.7rem;
  text-transform: uppercase;
  color: var(--primary);
}
article p:first-child {
  color: var(--complement);
}
h6 {
  margin-top: 0.6rem;
}
</style>
