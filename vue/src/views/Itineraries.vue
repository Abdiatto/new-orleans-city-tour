<template>
  <article>
    <h2>Plan My Trip</h2>
    <details :open="isOpen">
      <summary role="button" class="contrast">Create a New Itinerary</summary>
      <form v-on:submit.prevent="createItinerary" novalidate="true">
        <label for="name"
          >Name of this itinerary<input
            type="text"
            :aria-invalid="!formError.isValid"
            name="name"
            id="name"
            v-model="newName"
          />
          <small v-show="!formError.isValid" class="form-error">{{
            formError.message
          }}</small>
        </label>
        <div class="form-button">
          <button type="submit">Create</button>
        </div>
      </form>
    </details>
    <h4>My Itineraries</h4>
    <itinerary-settings
      v-for="(itinerary, index) in itinerariesOfUser"
      :key="index"
      :itinerary="itinerary"
    />
  </article>
</template>

<script>
import ItinerarySettings from "@/components/ItinerarySettings.vue";
import util from "@/util/util.js";
export default {
  components: { ItinerarySettings },
  methods: {
    findLandmark(id) {
      return this.$store.state.allLandmarks.find((l) => l.landMarkId == id);
    },
    createItinerary() {
      const check = util.validateLength(this.newName, 3, 30);
      this.formError = check;
      if (check.isValid) {
        this.$store.commit("ADD_ITINERARY", this.newName);
        this.newName = "";
        this.isOpen = false;
        this.$store.dispatch("syncItineraries");
      }
    },
  },
  data() {
    return {
      newName: "",
      formError: { isValid: true, message: "" },
      isOpen: false,
    };
  },
  computed: {
    itinerariesOfUser() {
      const userId = this.$store.state.user.id;
      return this.$store.state.allItineraries.filter(iti => iti.userId == userId);
    }
  }
};
</script>

<style></style>
