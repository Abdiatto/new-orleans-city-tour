<template>
  <div v-if="data && landmarkLocations">
    <ol>
      <li v-for="waypoint in data" :key="waypoint.waypoint_index">
        {{
          findLandmarkById(findLandmarkIdByWaypoint(waypoint.waypoint_index))
            .name
        }}
      </li>
    </ol>
  </div>
</template>

<script>
import mapService from "@/services/MapService.js";
import util from "@/util/util.js";
export default {
  props: ["geoData", "itinerary"],
  data() {
    return {
      data: false,
      landmarkLocations: false,
      oldData: false,
    };
  },
  mounted() {
    this.oldData = JSON.parse(JSON.stringify(this.geoData));

    this.findLandmarkLocations().then(
      (data) => (this.landmarkLocations = data)
    );

    const waypoints = this.geoData.waypoints;
    this.data = waypoints.sort((a, b) => {
      const keyA = a.waypoint_index;
      const keyB = b.waypoint_index;
      if (keyA < keyB) return -1;
      if (keyA > keyB) return 1;
      return 0;
    });
    console.log("---data---");
    console.log(JSON.parse(JSON.stringify(this.oldData)));
  },
  methods: {
    findLandmarkByWaypointId(waypointIndex) {
      const waypoint = this.oldData.waypoints.findIndex((waypoint) => {
        return waypoint.waypoint_index === waypointIndex;
      });
      const id = this.itinerary.landmarks[waypoint];
      return this.$store.state.allLandmarks.find((landmark) => {
        return landmark.landMarkId == id;
      });
    },
    findLandmarkIdByWaypoint(waypointIndex) {
      const waypoint = this.oldData.waypoints.findIndex((waypoint) => {
        return waypoint.waypoint_index === waypointIndex;
      });
      return this.itinerary.landmarks[waypoint];
    },
    findLandmarkById(id) {
      return this.$store.state.allLandmarks.find((landmark) => {
        return landmark.landMarkId == id;
      });
    },
    findLandmarkName(lnglat) {
      this.landmarkLocations.find((landmark) => {
        return JSON.stringify(lnglat) === JSON.stringify(landmark.center);
      });
    },
    async findLandmarkLocations() {
      const allLandmarks = this.$store.state.allLandmarks;
      const landmarks = await Promise.all(
        allLandmarks.map(async (landmark) => {
          const address = util.composeAddressString(landmark.address);
          const landmarkChords = await mapService.getMapPosition(address);
          let newLandmark = landmark;
          newLandmark.center = landmarkChords;
          return newLandmark;
        })
      );
      return landmarks;
    },
  },
};
</script>

<style></style>
