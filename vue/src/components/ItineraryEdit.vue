<template>
  <div>
    <h5>Edit Itinerary</h5>
    <div class="grid-well">
      <div>
        <h6>Places</h6>
        <div>
          <draggable
            tag="ul"
            v-model="availableLandmarks"
            group="people"
            class="well"
            :sort="false"
          >
            <li
              v-for="landmark in availableLandmarks"
              :key="landmark.landMarkId"
            >
              {{ landmark.name }}
            </li>
          </draggable>
        </div>
      </div>
      <div>
        <h6>Current Itinerary</h6>
        <draggable tag="ul" v-model="landmarks" group="people" class="well">
          <li v-for="(landmark, index) in landmarks" :key="index">
            {{ landmark.name }}
          </li>
        </draggable>
      </div>
    </div>
  </div>
</template>

<script>
import draggable from "vuedraggable";

export default {
  name: "itinerary-settings",
  data() {
    return {
      availableLandmarks: this.$store.getters.getAvailableLandmarks(
        this.itinerary
      ),
      landmarks: this.$store.getters.getLandmarksItinerary(this.itinerary),
    };
  },
  computed: {
    itineraryId() {
      return this.itinerary.itineraryId;
    },
  },

  props: ["itinerary"],
  watch: {
    landmarks(newValue) {
      const newIds = newValue.map((v) => v.landMarkId);
      this.$store.commit("UPDATE_ITINERARY", {
        itineraryId: this.itinerary.itineraryId,
        newList: newIds,
      });
      this.$store.dispatch("syncItineraries");
    },
  },
  components: { draggable },
};
</script>

<style scoped>
.well {
  height: 200px;
  border: var(--border-width) solid var(--table-border-color);
  overflow-y: auto;
  padding: var(--nav-element-spacing-horizontal);
  padding-top: calc(2 * var(--nav-element-spacing-horizontal));
  border-radius: var(--border-radius);
  list-style: none;
  padding-right: 1.5rem;
  padding-left: 1.5rem;
}
ul.well li {
  list-style: none;
  cursor: pointer;
  border: var(--border-width) solid var(--table-border-color);
  border-radius: var(--border-radius);
  background-color: #f5f5f5;
  padding-bottom: 0.3rem;
  padding-top: 0.3rem;
  padding-left: var(--nav-element-spacing-horizontal);
}
@media (min-width: 768px) {
  .well {
    height: 350px;
  }
}
</style>
