<template>
  <details>
    <summary role="button" class="secondary">
      {{ itinerary.name }}
    </summary>

    <div class="grid grid-well">
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
      <button @click="emailItinerary" class="spaced-btn">Email Itinerary</button>
      <button @click="deleteItinerary" class="warning spaced-btn">Delete Itinerary</button>
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
      this.$modal.show("dialog", {
        title: "Delete " + this.itinerary.name,
        text: "Are you sure you want to delete this itinerary?",
        buttons: [
          {
            title: "Cancel",
            handler: () => {
              this.$modal.hide("dialog");
            },
          },
          {
            title: "Delete",
            handler: () => {
              this.$store.commit("REMOVE_ITINERARY", this.itinerary);
              this.$store.dispatch("syncItineraries");
              this.$modal.hide("dialog");
            },
          },
        ],
      });
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

<style scoped>
.spaced-btn {
  margin-left: 20px;
}
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
  .grid-well.grid {
    grid-template-columns: 1fr 1fr;
  }
  .well {
    height: 350px;
  }
}
</style>
