<template>
  <article>
    <itinerary-map v-if="data" :geoData="data" />
    <h3 class="itinerary-header" v-if="activeItinerary">
      {{ activeItinerary.name }} Itinerary Optimized Travel Route
    </h3>
    <div class="grid">
      <div>
        <itinerary-edit :itinerary="activeItinerary" />
      </div>
      <div>
        <h5>Trip Details</h5>
        <h6>{{ miles(data.trips[0].distance) }} Total Miles</h6>
        <h6 class="last">{{ distance(data.trips[0].duration) }} Total</h6>

        <vertical-timeline v-if="data">
          <transition-group name="company">
            <div
              v-for="(landmark, index) in activeItineraryLandmarks"
              :key="landmark.landMarkId"
            >
              <timeline-content>
                <dynamic-image
                  :imagePath="landmark.photos[0].path"
                  :altText="`Picture of ${landmark.name}`"
                />
                <h6>
                  <span class="timeline-small">{{ index + 1 }}</span>
                  {{ landmark.name }}
                </h6>
                <p class="timeline-district">{{ landmark.district.name }}</p>
              </timeline-content>

              <timeline-content direction="right" small="true">
                <p>
                  {{ miles(data.trips[0].legs[index].distance) }} Miles <br />
                  {{ distance(data.trips[0].legs[index].duration) }}
                </p>
              </timeline-content>
            </div>
          </transition-group>
        </vertical-timeline>
        <div v-else>
          <h6>Need more than two locations to generate a route</h6>
        </div>
      </div>
    </div>
  </article>
</template>

<script>
import ItineraryMap from "../components/ItineraryMap.vue";
import mapService from "@/services/MapService.js";
import util from "@/util/util.js";
import VerticalTimeline from "@/components/VerticalTimeline.vue";
import TimelineContent from "../components/TimelineContent.vue";
import ItineraryEdit from "@/components/ItineraryEdit.vue";

export default {
  components: {
    ItineraryMap,
    VerticalTimeline,
    TimelineContent,
    ItineraryEdit,
  },
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
  beforeDestroy() {
    this.$store.commit("SET_ACTIVE_ITINERARY", 0);
  },
  methods: {
    loadItinerary() {
      const addresses = this.activeItineraryLandmarks.map((landmark) => {
        return util.composeAddressString(landmark.address);
      });
      mapService.getOptimizationForAddresses(addresses).then((data) => {
        this.data = data;
        console.log(data);
      });
    },
    miles(m) {
      return util.getMiles(m);
    },
    distance(t) {
      return util.getHoursMinutes(t);
    },
  },
  computed: {
    activeItinerary() {
      return this.$store.state.allItineraries.find(
        (i) => i.itineraryId == this.$store.state.activeItineraryId
      );
    },
    activeItineraryLandmarks() {
      if (this.activeItinerary) {
        return this.$store.getters.getLandmarksItinerary(this.activeItinerary);
      }
      return [];
    },
  },
  watch: {
    activeItineraryLandmarks: {
      handler(value) {
        if (value && value.length > 1) {
          this.loadItinerary();
        }
      },
    },
  },
};
</script>

<style>
.itinerary-header {
  margin: 1rem 0;
}

.last {
  margin-bottom: 8px;
}
.timeline-district {
  color: var(--complement);
}

.company {
  backface-visibility: hidden;
  z-index: 2;
}

.company-move {
  transition: all 600ms ease-in-out 50ms;
}

.company-enter-active {
  transition: all 400ms ease-out;
}

.company-leave-active {
  transition: all 200ms ease-in;
  position: absolute;
  z-index: 1;
}

.company-enter,
.company-leave-to {
  opacity: 0;
}
</style>
