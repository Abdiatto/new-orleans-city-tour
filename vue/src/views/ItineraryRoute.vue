<template>
  <article>
    <h2 v-if="activeItinerary">
      {{ activeItinerary.name }} Itinerary Optimized Travel Route
    </h2>
    <itinerary-map v-if="data" :geoData="data" />
    <itinerary-route-details
      v-if="data"
      :geoData="data"
      :itinerary="activeItinerary"
    />
  </article>
</template>

<script>
import ItineraryMap from "../components/ItineraryMap.vue";
import mapService from "@/services/MapService.js";
import util from "@/util/util.js";
import ItineraryRouteDetails from "@/components/ItineraryRouteDetails.vue";

export default {
  components: { ItineraryMap, ItineraryRouteDetails },
  data() {
    return {
      data: false,
      activeItinerary1: false,
    };
  },
  created() {
    this.$store.commit("SET_ACTIVE_ITINERARY", this.$route.params.id);
  },
  mounted() {
    const allItineraries = this.$store.state.allItineraries.find(
      (i) => i.itineraryId == this.$store.state.activeItineraryId
    );
    console.log("i", allItineraries);
  },
  methods: {
    loadItinerary() {
      const addresses = this.activeItineraryLandmarks.map((landmark) => {
        return util.composeAddressString(landmark.address);
      });
      mapService.getOptimizationForAddresses(addresses).then((data) => {
        this.data = data;
      });
    },
  },
  computed: {
    activeItinerary() {
      return this.$store.state.allItineraries.find(
        (i) => i.itineraryId == this.$store.state.activeItineraryId
      );
    },
    activeItineraryLandmarks() {
      return this.activeItinerary
        ? this.$store.getters.getLandmarksItinerary(this.activeItinerary)
        : [];
    },
  },
  watch: {
    activeItineraryLandmarks: {
      handler(value) {
        console.log("watcher");
        if (value && value.length > 0) {
          this.loadItinerary();
        }
      },
    },
  },
};
</script>

<style></style>
