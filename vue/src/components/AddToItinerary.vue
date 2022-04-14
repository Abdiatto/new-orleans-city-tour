<template>
  <details role="list" class="itinerary-add">
    <summary aria-haspopup="listbox" role="button" class="secondary"
      >Add to Itinerary</summary
    >
    <ul role="listbox">
      <li v-for="itinerary in itineraries" :key="itinerary.itineraryId">
        <label>
          <input
            type="checkbox"
            :value="landmarkId"
            v-model="itinerary.landmarks"
          />
          {{ itinerary.name }}
        </label>
      </li>
    </ul>
  </details>
</template>

<script>
export default {
  name: "add-to-itinerary",
  props: ["landmarkId"],
  data() {
    return {
      itineraries: this.$store.state.allItineraries,
    };
  },
  watch: {
    itineraries: {
      handler(newValue) {
        this.$store.commit("UPDATE_ITINERARIES", newValue);
        this.$store.dispatch("syncItineraries");
      },
      deep: true,
    },
  },
};
</script>

<style>
.itinerary-add {
  max-width: 240px;
}
.itinerary-add summary {
  padding: 0.2rem 0.4rem;
  margin-top: 0.4rem;
}
</style>
