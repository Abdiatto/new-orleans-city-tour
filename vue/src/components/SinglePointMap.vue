<template>
  <article class="map-wrapper">
    <div id="map"></div>
  </article>
</template>

<script>
import mapboxgl from "mapbox-gl";
export default {
  name: "single-point-map",
  data() {
    return {
      loading: false,
      location: "",
      access_token: process.env.VUE_APP_MAP_ACCESS_TOKEN,
      center: [-90.0715, 29.9511],
      map: {},
    };
  },
  mounted() {
    this.createMap();
  },

  methods: {
    async createMap() {
      try {
        mapboxgl.accessToken = this.access_token;
        this.map = new mapboxgl.Map({
          container: "map",
          style: "mapbox://styles/mapbox/outdoors-v11",
          center: this.center,
          zoom: 11,
        });
        //place a marker
        new mapboxgl.Marker().setLngLat([-90.0638, 29.95764]).addTo(this.map);
      } catch (err) {
        console.log("map error", err);
      }
    },
  },
};
</script>

<style>
.map-wrapper {
}
#map {
  width: 100%;
  height: 300px;
  padding: 0;
  margin: 0;
}
</style>
