<template>
  <div>
    <div v-if="!error" id="map"></div>
    <h4 v-else>There was an error with loading the map</h4>
  </div>
</template>

<script>
import Vue from "vue";
import MapCustomMarker from "@/components/MapCustomMarker.vue";
import maps from "@/util/maps.js";
import util from "@/util/util.js";
import * as turf from "@turf/turf";

export default {
  props: ["geoData"],
  data() {
    return {
      error: false,
      map: {},
      loaded: false,
      nothing: turf.featureCollection([]),
      data: false,
    };
  },
  mounted() {
    try {
      this.map = maps.newMap();
      this.map.on("load", () => {
        this.map.addSource("route", { type: "geojson", data: this.nothing });
        this.map.addLayer(maps.routeLine, "waterway-label");
        this.map.addLayer(maps.routeArrow, "waterway-label");
        this.loaded = true;
      });
    } catch {
      this.error = "true";
      console.log("map error");
    }
  },
  computed: {
    canLoadRoute() {
      return this.loaded && "geometry" in this.geoData.trips[0];
    },
    landmarks() {
      return this.$store.getters.getLandmarksByItinerary(
        this.$store.state.activeItineraryId
      );
    },
  },
  methods: {
    loadWayPoints() {
      const start = this.geoData.trips[0].geometry.coordinates[0];
      const geometry = this.geoData.trips[0].geometry;
      const routeGeoJSON = turf.featureCollection([turf.feature(geometry)]);
      this.map.getSource("route").setData(routeGeoJSON);
      this.geoData.waypoints.forEach((waypoint, index) => {
        const landmark = this.landmarks[index];
        this.customWayPoint(waypoint.location, landmark);
      });

      this.map.flyTo({
        center: start,
      });
    },
    customWayPoint(location, landmark) {
      const imageUrl = util.composeCloudinary(
        landmark.photos[0].path,
        "t_point"
      );
      const MarkerClass = Vue.extend(MapCustomMarker);
      const markerInstance = new MarkerClass({
        propsData: { imageUrl },
      });
      markerInstance.$mount();
      const html = `<h6>${landmark.name}</h6>`;
      maps.addCustomWaypoint(markerInstance.$el, location, this.map, html);
    },
  },
  watch: {
    canLoadRoute(value) {
      if (value) {
        maps.clearMarkers();
        this.loadWayPoints();
      }
    },
    geoData() {
      if (this.canLoadRoute) {
        maps.clearMarkers();
        this.loadWayPoints();
      }
    },
  },
};
</script>

<style scoped>
#map {
  width: 100%;
  height: 600px;
  padding: 0;
  margin: 0;
}
</style>
