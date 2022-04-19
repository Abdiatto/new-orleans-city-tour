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
    <add-to-itinerary :landmarkId="activeLandmark.landMarkId" />
    <h5>location</h5>
    <landmark-maps v-for="address in Address" v-bind:key="address.id" />
    <h6>About</h6>
    <p class="content">
      {{ activeLandmark.content }}
    </p>
    <landmark-map :address="activeLandmark.address" />
  </article>
</template>

<script>
import AddressLine from "@/components/AddressLine.vue";
import AddToItinerary from "@/components/AddToItinerary.vue";
import LandmarkMap from "@/components/LandmarkMap.vue";
export default {
  components: { AddressLine, AddToItinerary, LandmarkMap },
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
.itinerary-add {
  max-width: 240px;
}
.itinerary-add summary {
  padding: 0.2rem 0.4rem;
  margin-top: 0.4rem;
}
</style>
