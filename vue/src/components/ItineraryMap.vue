<template>
  <div>
    <div v-if="!error" id="map"></div>
    <h4 v-else>There was an error with loading the map</h4>
  </div>
</template>

<script>
import maps from "@/util/maps.js";
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
  },
  methods: {
    loadWayPoints() {
      const start = this.geoData.trips[0].geometry.coordinates[0];
      console.log(JSON.parse(JSON.stringify(this.geoData)));
      console.log(start);
      const geometry = this.geoData.trips[0].geometry;
      const routeGeoJSON = turf.featureCollection([turf.feature(geometry)]);
      this.map.getSource("route").setData(routeGeoJSON);
      this.geoData.waypoints.forEach((waypoint) => {
        maps.addBasicWaypoint(waypoint.location, this.map);
      });
      this.map.flyTo({
        center: start,
      });
    },
  },
  watch: {
    canLoadRoute(value) {
      if (value) {
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
