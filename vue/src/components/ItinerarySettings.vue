<template>
  <details>
    <summary role="button" class="secondary">
      {{ itinerary.name }}
    </summary>
    <label for="startPoint"> </label>
    <div class="grid">
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
    <div class="form-button">
      <button @click="emailItinerary">Email Itinerary</button>&nbsp;
      <button @click="deleteItinerary" class="warning">Delete Itinerary</button>
    </div>
  </details>
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
    }
  },
  methods: {
    deleteItinerary() {
      this.$store.commit("REMOVE_ITINERARY", this.itinerary);
      this.$store.dispatch("syncItineraries");
    },
    emailItinerary() {
      this.$router.push({name: 'email', params: {id: this.itineraryId}})
    }
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

<style>
.well {
  height: 350px;
  border: var(--border-width) solid var(--table-border-color);
  overflow-y: auto;
  padding: var(--nav-element-spacing-horizontal);
  padding-top: calc(2 * var(--nav-element-spacing-horizontal));
}
</style>
